package com.gasto.app;

import com.gasto.model.Cuenta;
import com.gasto.repository.BoletaPagoRepository;
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

    @Resource
    private BoletaPagoRepository boletaPagoRepository;

    @RequestMapping()
    public String findAll(Model model) {
        model.addAttribute("cuentas", cuentaRepository.findAll());
        return "cuenta_list";
    }

    @RequestMapping("/new")
    public String create(Model model) {
        model.addAttribute("cuentaTipos", Cuenta.getTipoNombres());
        return "cuenta_detail";
    }

    @RequestMapping("/edit/{cuentaId}")
    public String update(@PathVariable("cuentaId") Integer cuentaId, Model model) {
        model.addAttribute("cuentaId", cuentaId);
        model.addAttribute("cuenta", cuentaRepository.findById(cuentaId).get());
        model.addAttribute("cuentaTipos", Cuenta.getTipoNombres());
        // No llamo a cuenta.getBoletas() porque JPA no es Lizzy
        model.addAttribute("boletas", boletaRepository.findByCuentaId(cuentaId));
        model.addAttribute("boletaPagos", boletaPagoRepository.findByBoletaCuentaId(cuentaId));
        return "cuenta_detail";
    }

    @RequestMapping("/save")
    public String save(HttpServletRequest request) {
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

    @RequestMapping("/delete/{cuentaId}")
    public String delete(@PathVariable("cuentaId") Integer cuentaId, Model model) {
        Cuenta cuenta = cuentaRepository.findById(cuentaId).get();
        int boletaCnt = boletaRepository.findByCuentaId(cuentaId).size();

        if (boletaCnt > 0) {
            model.addAttribute("errorTitulo", "No se puede eliminar la Cuenta");
            model.addAttribute("errorDescripcion", "La cuenta tiene boletas asociadas, no puede ser eliminada.");
            model.addAttribute("errorUrl", "/cuenta");
            return "error";
        }
        else {
            cuentaRepository.delete(cuenta);
            return "redirect:/cuenta";
        }
    }
}
