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
        personalItem.setMonto(Double.parseDouble(request.getParameter("personal_item_monto")));
        personalItemRepository.save(personalItem);
        return "redirect:/personal/edit/" + personalId;
    }
}
