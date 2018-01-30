package com.gasto.app;

import com.gasto.model.Consumo;
import com.gasto.model.Departamento;
import com.gasto.model.DepartamentoGasto;
import com.gasto.repository.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/departamento")
public class DepartamentoController {

    @Resource
    private DepartamentoRepository departamentoRepository;

    @Resource
    private DepartamentoGastoRepository departamentoGastoRepository;

    @Resource
    private DepartamentoPagoRepository departamentoPagoRepository;

    @Resource
    private DepartamentoConsumoRepository departamentoConsumoRepository;

    @Resource
    private ConsumoRepository consumoRepository;

    @Resource
    private BoletaPagoRepository boletaPagoRepository;

    @RequestMapping()
    public String findAll(Model model) {
        model.addAttribute("departamentos", departamentoRepository.findAll());
        return "departamento_list";
    }

    @RequestMapping("/edit/{departamentoId}")
    public String update(@PathVariable("departamentoId") Integer departamentoId, Model model) {
        model.addAttribute("departamentoId", departamentoId);
        model.addAttribute("departamento", departamentoRepository.findById(departamentoId).get());
        model.addAttribute("departamentoGastos", departamentoGastoRepository.findByDepartamentoId(departamentoId));
        model.addAttribute("departamentoPagos", departamentoPagoRepository.findByDepartamentoId(departamentoId));
        return "departamento_detail";
    }

    @RequestMapping("/save")
    public String save(HttpServletRequest request) {
        Integer departamentoId = Integer.parseInt(request.getParameter("departamento_id"));
        Departamento departamento = departamentoRepository.findById(departamentoId).get();

        departamento.setPropietario(request.getParameter("departamento_propietario"));
        departamento.setResidente(request.getParameter("departamento_residente"));
        departamentoRepository.save(departamento);
        return "redirect:/cuenta";
    }

    @RequestMapping("{departamentoId}/gasto/{departamentoGastoId}")
    public String gasto(@PathVariable("departamentoId") Integer departamentoId, @PathVariable("departamentoGastoId") Integer departamentoGastoId, Model model) {
        DepartamentoGasto departamentoGasto = departamentoGastoRepository.findById(departamentoGastoId).get();
        List<Consumo> consumos = consumoRepository.findByGastocomunId(departamentoGasto.getGastocomun().getId());
        for (Consumo consumo: consumos) {
            consumo.setBoletaPagos(boletaPagoRepository.findByConsumoId(consumo.getId()));
        }
        model.addAttribute("departamentoId", departamentoId);
        //model.addAttribute("departamento", departamentoRepository.findById(departamentoId).get());
        model.addAttribute("departamentoGasto", departamentoGasto);
        model.addAttribute("departamentoConsumos", departamentoConsumoRepository.findByDepartamentoIdAndConsumoGastocomunId(departamentoId, departamentoGasto.getGastocomun().getId()));
        model.addAttribute("consumos", consumos);
        return "partials/_departamento_gasto_modal";
    }
}
