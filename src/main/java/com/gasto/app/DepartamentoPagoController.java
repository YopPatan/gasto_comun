package com.gasto.app;

import com.gasto.model.Departamento;
import com.gasto.model.DepartamentoPago;
import com.gasto.repository.DepartamentoPagoRepository;
import com.gasto.repository.DepartamentoRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;

@Controller
@RequestMapping("/departamento/{departamentoId}/pago")
public class DepartamentoPagoController {

    @Resource
    private DepartamentoPagoRepository departamentoPagoRepository;

    @Resource
    private DepartamentoRepository departamentoRepository;

    @RequestMapping("/new")
    public String create(@PathVariable("departamentoId") Integer departamentoId, Model model) {
        model.addAttribute("departamentoId", departamentoId);
        return "partials/_departamento_pago_modal";
    }

    @RequestMapping("/edit/{departamentoPagoId}")
    public String update(@PathVariable("departamentoId") Integer departamentoId, @PathVariable("departamentoPagoId") Integer departamentoPagoId, Model model) {
        DepartamentoPago departamentoPago = departamentoPagoRepository.findById(departamentoPagoId).get();

        model.addAttribute("departamentoId", departamentoId);
        model.addAttribute("departamentoPago", departamentoPagoRepository.findById(departamentoPagoId).get());
        return "partials/_departamento_pago_modal";
    }

    @RequestMapping("/save")
    public String save(@PathVariable("departamentoId") Integer departamentoId, HttpServletRequest request) {
        DepartamentoPago departamentoPago;
        if (request.getParameter("departamento_pago_id") != null) {
            Integer departamentoPagoId = Integer.parseInt(request.getParameter("departamento_pago_id"));
            departamentoPago = departamentoPagoRepository.findById(departamentoPagoId).get();
        }
        else {
            departamentoPago = new DepartamentoPago();

            Departamento departamento = departamentoRepository.findById(departamentoId).get();
            departamentoPago.setDepartamento(departamento);
        }

        departamentoPago.setFecha(Timestamp.valueOf(request.getParameter("departamento_pago_fecha") + " 00:00:00"));
        departamentoPago.setMonto(Integer.parseInt(request.getParameter("departamento_pago_monto")));
        departamentoPagoRepository.save(departamentoPago);
        return "redirect:/departamento/edit/" + departamentoId;
    }

    @RequestMapping("/delete/{departamentoPagoId}")
    public String delete(@PathVariable("departamentoId") Integer departamentoId, @PathVariable("departamentoPagoId") Integer departamentoPagoId) {
        DepartamentoPago departamentoPago = departamentoPagoRepository.findById(departamentoPagoId).get();
        departamentoPagoRepository.delete(departamentoPago);
        return "redirect:/departamento/edit/" + departamentoId;
    }
}
