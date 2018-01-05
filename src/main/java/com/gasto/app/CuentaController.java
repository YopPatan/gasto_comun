package com.gasto.app;

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
@RequestMapping("/cuenta")
public class CuentaController {

    @Resource
    private CuentaRepository cuentaRepository;

    @Resource
    private BoletaRepository boletaRepository;

    @RequestMapping()
    public String findAll(Model model) {
        model.addAttribute("cuentas", cuentaRepository.findAll());
        return "cuenta_list";
    }

    @RequestMapping("/new")
    public String create(Model model) {
        return "cuenta_detail";
    }

    @RequestMapping("/edit/{cuentaId}")
    public String update(@PathVariable("cuentaId") Integer cuentaId, Model model) {
        model.addAttribute("cuenta", cuentaRepository.findById(cuentaId).get());
        // No llamo a cuenta.getBoletas() porque JPA no es Lizzy
        model.addAttribute("boletas", boletaRepository.findByCuentaId(cuentaId));
        return "cuenta_detail";
    }

    @RequestMapping("/save")
    public String save(Model model, HttpServletRequest request) {
        Cuenta cuenta;
        if (request.getParameter("cuenta_id") != null) {
            Integer cuentaId = Integer.parseInt(request.getParameter("cuenta_id"));
            cuenta = cuentaRepository.findById(cuentaId).get();
        }
        else {
            cuenta = new Cuenta();
        }

        cuenta.setNombre(request.getParameter("cuenta_nombre"));
        cuenta.setTipo(Integer.parseInt(request.getParameter("cuenta_tipo")));
        cuentaRepository.save(cuenta);
        return "redirect:/cuenta";
    }
}
