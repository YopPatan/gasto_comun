package com.gasto.app;

import com.gasto.model.*;
import com.gasto.repository.*;
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
import java.util.Set;

@Controller
@RequestMapping("/gastocomun")
public class GastocomunController {

    @Resource
    private GastocomunRepository gastocomunRepository;

    @Resource
    private PersonalPagoRepository personalPagoRepository;

    @Resource
    private BoletaPagoRepository boletaPagoRepository;

    @Resource
    private DepartamentoRepository departamentoRepository;

    @Resource
    private DepartamentoGastoRepository departamentoGastoRepository;

    @RequestMapping()
    public String findAll(Model model) {
        model.addAttribute("gastocomunes", gastocomunRepository.findAll());
        return "gastocomun_list";
    }

    @RequestMapping("/new")
    public String create(Model model) {
        Map<Integer, Iterable<BoletaPago>> boletaPagosByTipo = new HashMap<Integer, Iterable<BoletaPago>>();
        for (Map.Entry<Integer, String> tipo: Cuenta.getTipoNombres().entrySet()) {
            boletaPagosByTipo.put(tipo.getKey(), boletaPagoRepository.findByGastocomunIdAndBoletaCuentaTipo(null, tipo.getKey()));
        }

        model.addAttribute("cuentaTipos", Cuenta.getTipoNombres());
        model.addAttribute("boletaPagos", boletaPagoRepository.findByGastocomunId(null));
        model.addAttribute("personalPagos", personalPagoRepository.findByGastocomunId(null));
        model.addAttribute("boletaPagosByTipo", boletaPagosByTipo);
        return "gastocomun_detail";
    }

    @RequestMapping("/edit/{gastocomunId}")
    public String create(@PathVariable("gastocomunId") Integer gastocomunId, Model model) {
        Map<Integer, Iterable<BoletaPago>> boletaPagosByTipo = new HashMap<Integer, Iterable<BoletaPago>>();
        for (Map.Entry<Integer, String> tipo: Cuenta.getTipoNombres().entrySet()) {
            List<BoletaPago> boletaPagos = boletaPagoRepository.findByGastocomunIdAndBoletaCuentaTipo(gastocomunId, tipo.getKey());
            boletaPagos.addAll(boletaPagoRepository.findByGastocomunIdAndBoletaCuentaTipo(null, tipo.getKey()));
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
        return "gastocomun_detail";
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

        gastocomun.setMontoComun(Integer.parseInt(request.getParameter("gastocomun_monto_comun")));
        gastocomun.setMontoReserva(Integer.parseInt(request.getParameter("gastocomun_monto_reserva")));
        gastocomun.setMontoTotal(Integer.parseInt(request.getParameter("gastocomun_monto_total")));
        gastocomun.setFecha(Timestamp.valueOf(request.getParameter("gastocomun_fecha") + " 00:00:00"));
        gastocomun.setFechaVencimiento(Timestamp.valueOf(request.getParameter("gastocomun_vencimiento") + " 00:00:00"));
        gastocomun.setObservaciones(request.getParameter("gastocomun_observaciones"));
        gastocomunRepository.save(gastocomun);

        for (String entry : (Set<String>) request.getParameterMap().keySet()) {
            String[] info = entry.split("_");
            if (info.length == 3 && info[0].equals("item")) {
                String tipo = info[1];
                int pagoId = Integer.parseInt(info[2]);
                if (tipo.equals("boleta")) {
                    BoletaPago boletaPago = boletaPagoRepository.findById(pagoId).get();
                    if (request.getParameter(entry).equals("1")) {
                        boletaPago.setGastocomun(gastocomun);
                    }
                    else {
                        boletaPago.setGastocomun(null);
                    }
                    boletaPagoRepository.save(boletaPago);
                }

                if (tipo.equals("personal")) {
                    PersonalPago personalPago = personalPagoRepository.findById(pagoId).get();
                    if (request.getParameter(entry).equals("1")) {
                        personalPago.setGastocomun(gastocomun);
                    }
                    else {
                        personalPago.setGastocomun(null);
                    }
                    personalPagoRepository.save(personalPago);
                }
            }
        }

        return "redirect:/gastocomun";
    }

    @RequestMapping("/delete/{gastocomunId}")
    public String delete(@PathVariable("gastocomunId") Integer gastocomunId) {
        Gastocomun gastocomun = gastocomunRepository.findById(gastocomunId).get();
        gastocomunRepository.delete(gastocomun);
        return "redirect:/gastocomun";
    }

    @RequestMapping("/prorratear/{gastocomunId}")
    public String prorratear(@PathVariable("gastocomunId") Integer gastocomunId) {
        Gastocomun gastocomun = gastocomunRepository.findById(gastocomunId).get();
        gastocomunRepository.delete(gastocomun);
        Iterable<Departamento> departamentos = departamentoRepository.findAll();
        for (Departamento departamento: departamentos) {
            double alicuota = departamento.getAlicuota();
            DepartamentoGasto departamentoGasto = new DepartamentoGasto();
            departamentoGasto.setDepartamento(departamento);
            departamentoGasto.setGastocomun(gastocomun);
            departamentoGasto.setMontoComun((int) (gastocomun.getMontoComun() * alicuota));
            departamentoGasto.setMontoInteres((int) (gastocomun.getMontoReserva() * alicuota));
            departamentoGastoRepository.save(departamentoGasto);
        }
        return "redirect:/gastocomun";
    }
}
