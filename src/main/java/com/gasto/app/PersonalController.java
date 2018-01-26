package com.gasto.app;

import com.gasto.model.Personal;
import com.gasto.repository.LiquidacionRepository;
import com.gasto.repository.PersonalItemRepository;
import com.gasto.repository.PersonalPagoRepository;
import com.gasto.repository.PersonalRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/personal")
public class PersonalController {

    @Resource
    private PersonalRepository personalRepository;

    @Resource
    private PersonalPagoRepository personalPagoRepository;

    @Resource
    private PersonalItemRepository personalItemRepository;

    @Resource
    private LiquidacionRepository liquidacionRepository;

    @RequestMapping()
    public String findAll(Model model) {
        model.addAttribute("personals", personalRepository.findAll());
        return "personal_list";
    }

    @RequestMapping("/new")
    public String create(Model model) {
        return "personal_detail";
    }

    @RequestMapping("/edit/{personalId}")
    public String update(@PathVariable("personalId") Integer personalId, Model model) {
        //model.addAttribute("personalId", personalId);
        model.addAttribute("personal", personalRepository.findById(personalId).get());
        model.addAttribute("personalPagos", personalPagoRepository.findByPersonalId(personalId));
        model.addAttribute("personalItemImponibles", personalItemRepository.findByPersonalIdAndTipo(personalId, 1));
        model.addAttribute("personalItemNoImponibles", personalItemRepository.findByPersonalIdAndTipo(personalId, 2));
        model.addAttribute("personalItemDescuentos", personalItemRepository.findByPersonalIdAndTipo(personalId, 3));
        model.addAttribute("liquidaciones", liquidacionRepository.findByPersonalId(personalId));
        return "personal_detail";
    }

    @RequestMapping("/save")
    public String save(HttpServletRequest request) {
        Personal personal;
        if (request.getParameter("personal_id") != null) {
            Integer personalId = Integer.parseInt(request.getParameter("personal_id"));
            personal = personalRepository.findById(personalId).get();
        }
        else {
            personal = new Personal();
        }

        personal.setRut(request.getParameter("personal_rut"));
        personal.setNombres(request.getParameter("personal_nombres"));
        personal.setApellidos(request.getParameter("personal_apellidos"));
        personal.setDireccion(request.getParameter("personal_direccion"));
        personal.setCargo(request.getParameter("personal_cargo"));
        personalRepository.save(personal);
        return "redirect:/personal";
    }

    @RequestMapping("/delete/{personalId}")
    public String delete(@PathVariable("personalId") Integer personalId) {
        Personal personal = personalRepository.findById(personalId).get();
        personalRepository.delete(personal);
        return "redirect:/personal";
    }
}
