package com.gasto.app;

import com.gasto.model.Personal;
import com.gasto.repository.PersonalItemRepository;
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
    private PersonalItemRepository personalItemRepository;


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
        model.addAttribute("personal", personalRepository.findById(personalId).get());
        model.addAttribute("personalItemHaberes", personalItemRepository.findByPersonalIdAndTipo(personalId, 1));
        model.addAttribute("personalItemDescuentos", personalItemRepository.findByPersonalIdAndTipo(personalId, 2));
        return "personal_detail";
    }

    @RequestMapping("/save")
    public String save(Model model, HttpServletRequest request) {
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
        personalRepository.save(personal);
        return "redirect:/personal";
    }
}
