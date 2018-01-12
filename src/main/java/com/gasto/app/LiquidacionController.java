package com.gasto.app;

import com.gasto.model.PersonalItem;
import com.gasto.repository.PersonalItemRepository;
import com.gasto.repository.PersonalRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/personal/{personalId}/liquidacion")
public class LiquidacionController {

    @Resource
    private PersonalRepository personalRepository;

    @Resource
    private PersonalItemRepository personalItemRepository;

    @RequestMapping("/new")
    public String create(@PathVariable("personalId") Integer personalId, Model model) {
        /*List<Map<String, String>> haberes = new ArrayList<Map<String, String>>();
        List<Map<String, String>> descuentos = new ArrayList<Map<String, String>>();
        int totalHaberes = 0;

        for (PersonalItem personalItem: personalItemRepository.findByPersonalIdAndTipo(personalId, 1)) {
            Map<String, String> item = new HashMap<String, String>();
            totalHaberes += personalItem.getMonto();
            item.put("nombre", personalItem.getNombre());
            item.put("monto", String.valueOf((int) personalItem.getMonto()));
            haberes.add(item);
        }

        for (PersonalItem personalItem: personalItemRepository.findByPersonalIdAndTipo(personalId, 2)) {
            Map<String, String> item = new HashMap<String, String>();
            int monto = (int) ((personalItem.getEsPorcentaje() == 1) ? personalItem.getMonto() * totalHaberes / 100 : personalItem.getMonto());
            item.put("nombre", personalItem.getNombre());
            item.put("monto", String.valueOf(monto));
            descuentos.add(item);
        }

        model.addAttribute("personalItemHaberes", haberes);
        model.addAttribute("personalItemDescuentos", descuentos);
        */

        model.addAttribute("personal", personalRepository.findById(personalId).get());
        model.addAttribute("personalItemHaberes", personalItemRepository.findByPersonalIdAndTipo(personalId, 1));
        model.addAttribute("personalItemDescuentos", personalItemRepository.findByPersonalIdAndTipo(personalId, 2));
        return "partials/_liquidacion_modal";
    }

}
