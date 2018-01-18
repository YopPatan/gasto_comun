package com.gasto.app;

import com.gasto.model.PersonalItem;
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
@RequestMapping("/personal/{personalId}/item")
public class PersonalItemController {

    @Resource
    private PersonalRepository personalRepository;

    @Resource
    private PersonalItemRepository personalItemRepository;


    @RequestMapping("/new")
    public String create(@PathVariable("personalId") Integer personalId, Model model) {
        model.addAttribute("personalId", personalId);
        return "partials/_personal_item_modal";
    }

    @RequestMapping("/edit/{personalItemId}")
    /*@ResponseBody*/
    public String update(@PathVariable("personalId") Integer personalId, @PathVariable("personalItemId") Integer personalItemId, Model model) {
        model.addAttribute("personalId", personalId);
        model.addAttribute("personalItem", personalItemRepository.findById(personalItemId).get());
        return "partials/_personal_item_modal";
    }

    @RequestMapping("/save")
    public String save(@PathVariable("personalId") Integer personalId, Model model, HttpServletRequest request) {
        PersonalItem personalItem;
        if (request.getParameter("personal_item_id") != null) {
            Integer personalItemId = Integer.parseInt(request.getParameter("personal_item_id"));
            personalItem = personalItemRepository.findById(personalItemId).get();
        }
        else {
            personalItem = new PersonalItem();

            Personal personal = personalRepository.findById(personalId).get();
            personalItem.setPersonal(personal);
        }

        personalItem.setNombre(request.getParameter("personal_item_nombre"));
        personalItem.setTipo(Integer.parseInt(request.getParameter("personal_item_tipo")));
        personalItem.setEsPorcentaje(Integer.parseInt(request.getParameter("personal_es_porcentaje")));
        personalItem.setMonto(Double.parseDouble(request.getParameter("personal_item_monto")));
        personalItemRepository.save(personalItem);
        return "redirect:/personal/edit/" + personalId;
    }

    @RequestMapping("/delete/{personalItemId}")
    public String delete(@PathVariable("personalId") Integer personalId, @PathVariable("personalItemId") Integer personalItemId, Model model, HttpServletRequest request) {
        PersonalItem personalItem = personalItemRepository.findById(personalItemId).get();
        personalItemRepository.delete(personalItem);
        return "redirect:/personal/edit/" + personalId;
    }
}
