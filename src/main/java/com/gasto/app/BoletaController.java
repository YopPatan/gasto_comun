package com.gasto.app;

import com.gasto.model.Boleta;
import com.gasto.model.Cuenta;
import com.gasto.repository.BoletaRepository;
import com.gasto.repository.CuentaRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;

@Controller
@RequestMapping("/cuenta/{cuentaId}/boleta")
public class BoletaController {

    @Resource
    private BoletaRepository boletaRepository;

    @Resource
    private CuentaRepository cuentaRepository;

    @RequestMapping("/new")
    public String create(@PathVariable("cuentaId") Integer cuentaId, Model model) {
        model.addAttribute("cuentaId", cuentaId);
        return "partials/_boleta_modal";
    }

    @RequestMapping("/edit/{boletaId}")
    /*@ResponseBody*/
    public String update(@PathVariable("cuentaId") Integer cuentaId, @PathVariable("boletaId") Integer boletaId, Model model) {
        model.addAttribute("cuentaId", cuentaId);
        model.addAttribute("boleta", boletaRepository.findById(boletaId).get());
        return "partials/_boleta_modal";
    }

    @RequestMapping("/save")
    public String save(@PathVariable("cuentaId") Integer cuentaId, HttpServletRequest request) {
        Boleta boleta;
        if (request.getParameter("boleta_id") != null) {
            Integer boletaId = Integer.parseInt(request.getParameter("boleta_id"));
            boleta = boletaRepository.findById(boletaId).get();
        }
        else {
            boleta = new Boleta();

            Cuenta cuenta = cuentaRepository.findById(cuentaId).get();
            boleta.setCuenta(cuenta);
        }

        boleta.setFecha(Timestamp.valueOf(request.getParameter("boleta_fecha") + " 00:00:00"));
        boleta.setFolio(request.getParameter("boleta_folio"));
        boleta.setAdjunto(request.getParameter("boleta_adjunto"));
        boleta.setMonto(Integer.parseInt(request.getParameter("boleta_monto")));
        boletaRepository.save(boleta);
        return "redirect:/cuenta/edit/" + cuentaId;
    }

    @RequestMapping("/delete/{boletaId}")
    public String delete(@PathVariable("cuentaId") Integer cuentaId, @PathVariable("boletaId") Integer boletaId) {
        Boleta boleta = boletaRepository.findById(boletaId).get();
        boletaRepository.delete(boleta);
        return "redirect:/cuenta/edit/" + cuentaId;
    }
}
