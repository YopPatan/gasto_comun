package com.gasto.app;

import com.gasto.model.Boleta;
import com.gasto.model.BoletaPago;
import com.gasto.model.Cuenta;
import com.gasto.repository.BoletaPagoRepository;
import com.gasto.repository.BoletaRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.ParseException;

@Controller
@RequestMapping("/cuenta/{cuentaId}/boletaPago")
public class BoletaPagoController {

    @Resource
    private BoletaPagoRepository boletaPagoRepository;

    @Resource
    private BoletaRepository boletaRepository;

    @RequestMapping("/new")
    public String create(@PathVariable("cuentaId") Integer cuentaId, Model model) {
        model.addAttribute("cuentaId", cuentaId);
        model.addAttribute("boletaAdeudadas", boletaRepository.findByEstado(0));
        return "partials/_boleta_pago_modal";
    }

    @RequestMapping("/edit/{boletaPagoId}")
    public String update(@PathVariable("cuentaId") Integer cuentaId, @PathVariable("boletaPagoId") Integer boletaPagoId, Model model) {
        model.addAttribute("cuentaId", cuentaId);
        model.addAttribute("boletaPago", boletaPagoRepository.findById(boletaPagoId).get());
        return "partials/_boleta_pago_modal";
    }

    @RequestMapping("/save")
    public String save(@PathVariable("cuentaId") Integer cuentaId, Model model, HttpServletRequest request) throws ParseException {
        BoletaPago boletaPago;
        if (request.getParameter("boleta_pago_id") != null) {
            Integer boletaPagoId = Integer.parseInt(request.getParameter("boleta_pago_id"));
            boletaPago = boletaPagoRepository.findById(boletaPagoId).get();
        }
        else {
            boletaPago = new BoletaPago();

            Integer boletaId = Integer.parseInt(request.getParameter("boleta_id"));
            Boleta boleta = boletaRepository.findById(boletaId).get();
            boletaPago.setBoleta(boleta);
        }

        boletaPago.setFecha(Timestamp.valueOf(request.getParameter("boleta_pago_fecha") + " 00:00:00"));
        boletaPago.setCuota(0);
        boletaPago.setAdjunto(request.getParameter("boleta_pago_adjunto"));
        boletaPago.setMonto(Integer.parseInt(request.getParameter("boleta_pago_monto")));
        boletaPagoRepository.save(boletaPago);
        return "redirect:/cuenta/edit/" + cuentaId;
    }

    @RequestMapping("/delete/{boletaPagoId}")
    public String delete(@PathVariable("cuentaId") Integer cuentaId, @PathVariable("boletaPagoId") Integer boletaPagoId, Model model, HttpServletRequest request) {
        BoletaPago boletaPago = boletaPagoRepository.findById(boletaPagoId).get();
        boletaPagoRepository.delete(boletaPago);
        return "redirect:/cuenta/edit/" + cuentaId;
    }

}
