package com.gasto.app;

import com.gasto.repository.PersonalItemRepository;
import com.gasto.repository.PersonalRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/personal/{personalId}/liquidacion")
public class LiquidacionController {

    @Resource
    private PersonalRepository personalRepository;

    @Resource
    private PersonalItemRepository personalItemRepository;

    @RequestMapping("/new")
    public String create(@PathVariable("personalId") Integer personalId, Model model) {
        model.addAttribute("personal", personalRepository.findById(personalId).get());
        model.addAttribute("personalItemHaberes", personalItemRepository.findByPersonalIdAndTipo(personalId, 1));
        model.addAttribute("personalItemDescuentos", personalItemRepository.findByPersonalIdAndTipo(personalId, 2));
        return "liquidacion_detail";
    }

}
