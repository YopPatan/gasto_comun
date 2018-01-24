package com.gasto.app;

import com.gasto.model.BoletaPago;
import com.gasto.model.Cuenta;
import com.gasto.model.Gastocomun;
import com.gasto.model.PersonalPago;
import com.gasto.repository.BoletaPagoRepository;
import com.gasto.repository.GastocomunRepository;
import com.gasto.repository.PersonalPagoRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/gastocomun")
public class GastocomunController {

    @Resource
    GastocomunRepository gastocomunRepository;

    @Resource
    PersonalPagoRepository personalPagoRepository;

    @Resource
    BoletaPagoRepository boletaPagoRepository;

    @RequestMapping()
    public String findAll(Model model) {
        model.addAttribute("gastocomunes", gastocomunRepository.findAll());
        return "gastocomun_list";
    }

    @RequestMapping("/new")
    public String create(Model model) {
        return "gastocomun_detail";
    }

    @RequestMapping("/edit/{gastocomunId}")
    public String create(@PathVariable("gastocomunId") Integer gastocomunId, Model model) {
        Map<Integer, Iterable<BoletaPago>> boletaPagosByTipo = new HashMap<Integer, Iterable<BoletaPago>>();
        for (Map.Entry<Integer, String> tipo: Cuenta.getTipoNombres().entrySet()) {
            //System.out.println(tipo.getValue());
            List<BoletaPago> boletaPagos = boletaPagoRepository.findByGastocomunIdAndBoletaCuentaTipo(gastocomunId, tipo.getKey());
            boletaPagos.addAll(boletaPagoRepository.findByGastocomunIdAndBoletaCuentaTipo(null, tipo.getKey()));
            //boletaPagoAsignados.put(tipo.getKey(), boletaPagoRepository.findByGastocomunIdAndBoletaCuentaTipo(gastocomunId, tipo.getKey()));
            boletaPagosByTipo.put(tipo.getKey(), boletaPagos);
        }

        List<BoletaPago> boletaPagos = boletaPagoRepository.findByGastocomunId(gastocomunId);
        boletaPagos.addAll(boletaPagoRepository.findByGastocomunId(null));

        List<PersonalPago> personalPagos = personalPagoRepository.findByGastocomunId(gastocomunId);
        personalPagos.addAll(personalPagoRepository.findByGastocomunId(null));

        model.addAttribute("gastocomun", gastocomunRepository.findById(gastocomunId).get());
        model.addAttribute("cuentaTipos", Cuenta.getTipoNombres());
        model.addAttribute("boletaPagos", boletaPagos);
        model.addAttribute("personalPagos", personalPagos);
        model.addAttribute("boletaPagosByTipo", boletaPagosByTipo);

        /*model.addAttribute("personalPagosNoAsignados", personalPagoRepository.findByGastocomunId(null));
        model.addAttribute("boletaPagoNoAsignados", boletaPagoRepository.findByGastocomunId(null));
        model.addAttribute("personalPagoAsignados", personalPagoRepository.findByGastocomunId(gastocomunId));
        model.addAttribute("boletaPagoAsignados", boletaPagoAsignados);*/
        return "gastocomun_detail";
    }

    @RequestMapping("/addPago/{gastocomunId}/{tipoId}/{pagoId}")
    public String addPago(@PathVariable("gastocomunId") Integer gastocomunId, @PathVariable("tipoId") String tipoId, @PathVariable("pagoId") Integer pagoId, Model model) {
        Gastocomun gastocomun = gastocomunRepository.findById(gastocomunId).get();
        if (tipoId.equals("boleta")) {
            BoletaPago boletaPago = boletaPagoRepository.findById(pagoId).get();
            boletaPago.setGastocomun(gastocomun);
            boletaPagoRepository.save(boletaPago);
        }
        if (tipoId.equals("personal")) {
            PersonalPago personalPago = personalPagoRepository.findById(pagoId).get();
            personalPago.setGastocomun(gastocomun);
            personalPagoRepository.save(personalPago);
        }
        return "redirect:/gastocomun/edit/" + gastocomunId;
    }

    @RequestMapping("/removePago/{gastocomunId}/{tipoId}/{pagoId}")
    public String removePago(@PathVariable("gastocomunId") Integer gastocomunId, @PathVariable("tipoId") String tipoId, @PathVariable("pagoId") Integer pagoId, Model model) {
        if (tipoId.equals("boleta")) {
            BoletaPago boletaPago = boletaPagoRepository.findById(pagoId).get();
            boletaPago.setGastocomun(null);
            boletaPagoRepository.save(boletaPago);
        }
        if (tipoId.equals("personal")) {
            PersonalPago personalPago = personalPagoRepository.findById(pagoId).get();
            personalPago.setGastocomun(null);
            personalPagoRepository.save(personalPago);
        }
        return "redirect:/gastocomun/edit/" + gastocomunId;
    }

    @RequestMapping("/save")
    public String save(Model model, HttpServletRequest request) {
        Gastocomun gastocomun;
        if (request.getParameter("gastocomun_id") != null) {
            Integer boletaId = Integer.parseInt(request.getParameter("gastocomun_id"));
            gastocomun = gastocomunRepository.findById(boletaId).get();
        }
        else {
            gastocomun = new Gastocomun();
        }

        gastocomun.setFecha(Timestamp.valueOf(request.getParameter("gastocomun_fecha") + " 00:00:00"));
        gastocomun.setFechaVencimiento(Timestamp.valueOf(request.getParameter("gastocomun_vencimiento") + " 00:00:00"));
        gastocomunRepository.save(gastocomun);
        return "redirect:/gastocomun";
    }
}
