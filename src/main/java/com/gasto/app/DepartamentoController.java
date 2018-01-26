package com.gasto.app;

import com.gasto.model.Departamento;
import com.gasto.repository.DepartamentoGastoRepository;
import com.gasto.repository.DepartamentoPagoRepository;
import com.gasto.repository.DepartamentoRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/departamento")
public class DepartamentoController {

    @Resource
    private DepartamentoRepository departamentoRepository;

    @Resource
    private DepartamentoGastoRepository departamentoGastoRepository;

    @Resource
    private DepartamentoPagoRepository departamentoPagoRepository;

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
        return "cuenta_detail";
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
}
