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
        return "boleta_detail";
    }

    @RequestMapping("/edit/{boletaId}")
    public String update(@PathVariable("cuentaId") Integer cuentaId, @PathVariable("boletaId") Integer boletaId, Model model) {
        model.addAttribute("cuentaId", cuentaId);
        model.addAttribute("boleta", boletaRepository.findById(boletaId).get());
        return "boleta_detail";
    }

    @RequestMapping("/save")
    public String save(@PathVariable("cuentaId") Integer cuentaId, Model model, HttpServletRequest request) {
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

        boleta.setFolio(request.getParameter("boleta_adjunto"));
        boleta.setAdjunto(request.getParameter("boleta_adjunto"));
        boleta.setMonto(Integer.parseInt(request.getParameter("boleta_monto")));
        boletaRepository.save(boleta);
        return "cuenta_detail";
    }
}
