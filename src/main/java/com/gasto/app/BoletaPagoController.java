package com.gasto.app;

import com.gasto.model.Boleta;
import com.gasto.model.BoletaPago;
import com.gasto.repository.BoletaPagoRepository;
import com.gasto.repository.BoletaRepository;
import com.gasto.repository.GastocomunRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;

@Controller
@RequestMapping("/cuenta/{cuentaId}/boletaPago")
public class BoletaPagoController {

    @Resource
    private BoletaPagoRepository boletaPagoRepository;

    @Resource
    private BoletaRepository boletaRepository;

    @Resource
    private GastocomunRepository gastocomunRepository;

    @RequestMapping("/new")
    public String create(@PathVariable("cuentaId") Integer cuentaId, Model model) {
        model.addAttribute("cuentaId", cuentaId);
        model.addAttribute("boletaAdeudadas", boletaRepository.findByEstado(0));
        return "partials/_boleta_pago_modal";
    }

    @RequestMapping("/edit/{boletaPagoId}")
    public String update(@PathVariable("cuentaId") Integer cuentaId, @PathVariable("boletaPagoId") Integer boletaPagoId, Model model) {
        BoletaPago boletaPago = boletaPagoRepository.findById(boletaPagoId).get();

        model.addAttribute("cuentaId", cuentaId);
        model.addAttribute("boletaPago", boletaPagoRepository.findById(boletaPagoId).get());
        model.addAttribute("boleta", boletaRepository.findById(boletaPago.getBoleta().getId()).get());
        return "partials/_boleta_pago_modal";
    }

    @RequestMapping("/save")
    public String save(@PathVariable("cuentaId") Integer cuentaId, HttpServletRequest request) {
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
        boletaPago.setAdjunto(request.getParameter("boleta_pago_adjunto"));
        boletaPago.setMonto(Integer.parseInt(request.getParameter("boleta_pago_monto")));
        boletaPagoRepository.save(boletaPago);
        return "redirect:/cuenta/edit/" + cuentaId;
    }

    @RequestMapping("/delete/{boletaPagoId}")
    public String delete(@PathVariable("cuentaId") Integer cuentaId, @PathVariable("boletaPagoId") Integer boletaPagoId, Model model) {
        BoletaPago boletaPago = boletaPagoRepository.findById(boletaPagoId).get();
        if (boletaPago.getGastocomun() != null) {
            model.addAttribute("errorTitulo", "No se puede eliminar el Pago");
            model.addAttribute("errorDescripcion", "El pago esta asociado a un Gasto Comun, no puede ser eliminado.");
            model.addAttribute("errorUrl", "/cuenta/edit/" + cuentaId);
            return "error";
        }
        else {
            boletaPagoRepository.delete(boletaPago);
            return "redirect:/cuenta/edit/" + cuentaId;
        }
    }

}
