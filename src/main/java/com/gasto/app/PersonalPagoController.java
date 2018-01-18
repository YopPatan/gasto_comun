package com.gasto.app;

import com.gasto.model.Personal;
import com.gasto.model.PersonalPago;
import com.gasto.repository.PersonalPagoRepository;
import com.gasto.repository.PersonalRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;

@Controller
@RequestMapping("/personal/{personalId}/pago")
public class PersonalPagoController {

    @Resource
    private PersonalRepository personalRepository;

    @Resource
    private PersonalPagoRepository personalPagoRepository;


    @RequestMapping("/new")
    public String create(@PathVariable("personalId") Integer personalId, Model model) {
        model.addAttribute("personalId", personalId);
        return "partials/_personal_pago_modal";
    }

    @RequestMapping("/edit/{personalPagoId}")
    public String update(@PathVariable("personalId") Integer personalId, @PathVariable("personalPagoId") Integer personalPagoId, Model model) {
        model.addAttribute("personalId", personalId);
        model.addAttribute("personalPago", personalPagoRepository.findById(personalPagoId).get());
        return "partials/_personal_pago_modal";
    }

    @RequestMapping("/save")
    public String save(@PathVariable("personalId") Integer personalId, Model model, HttpServletRequest request) {
        PersonalPago personalPago;
        if (request.getParameter("personal_pago_id") != null) {
            Integer personalPagoId = Integer.parseInt(request.getParameter("personal_pago_id"));
            personalPago = personalPagoRepository.findById(personalPagoId).get();
        }
        else {
            personalPago = new PersonalPago();

            Personal personal = personalRepository.findById(personalId).get();
            personalPago.setPersonal(personal);
        }

        personalPago.setFecha(Timestamp.valueOf(request.getParameter("personal_pago_fecha") + " 00:00:00"));
        personalPago.setTipo(Integer.parseInt(request.getParameter("personal_pago_tipo")));
        personalPago.setMonto(Integer.parseInt(request.getParameter("personal_pago_monto")));
        personalPagoRepository.save(personalPago);
        return "redirect:/personal/edit/" + personalId;
    }

    @RequestMapping("/delete/{personalPagoId}")
    public String delete(@PathVariable("personalId") Integer personalId, @PathVariable("personalPagoId") Integer personalPagoId, Model model, HttpServletRequest request) {
        PersonalPago personalPago = personalPagoRepository.findById(personalPagoId).get();
        personalPagoRepository.delete(personalPago);
        return "redirect:/personal/edit/" + personalId;
    }
}
