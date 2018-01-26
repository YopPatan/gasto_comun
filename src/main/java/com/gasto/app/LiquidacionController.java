package com.gasto.app;

import com.gasto.model.Liquidacion;
import com.gasto.model.LiquidacionItem;
import com.gasto.model.Personal;
import com.gasto.model.PersonalPago;
import com.gasto.repository.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.Set;

@Controller
@RequestMapping("/personal/{personalId}/liquidacion")
public class LiquidacionController {

    @Resource
    private LiquidacionRepository liquidacionRepository;

    @Resource
    private LiquidacionItemRepository liquidacionItemRepository;

    @Resource
    private PersonalRepository personalRepository;

    @Resource
    private PersonalItemRepository personalItemRepository;

    @Resource
    private PersonalPagoRepository personalPagoRepository;

    @RequestMapping("/new")
    public String create(@PathVariable("personalId") Integer personalId, Model model) {
        model.addAttribute("personalId", personalId);
        model.addAttribute("personal", personalRepository.findById(personalId).get());
        model.addAttribute("personalPagoAnticipos", personalPagoRepository.findByPersonalIdAndLiquidacionIdAndTipo(personalId, null, 2));
        model.addAttribute("itemImponibles", personalItemRepository.findByPersonalIdAndTipo(personalId, 1));
        model.addAttribute("itemNoImponibles", personalItemRepository.findByPersonalIdAndTipo(personalId, 2));
        model.addAttribute("itemDescuentos", personalItemRepository.findByPersonalIdAndTipo(personalId, 3));
        return "partials/_liquidacion_modal";
    }

    @RequestMapping("/edit/{liquidacionId}")
    public String update(@PathVariable("personalId") Integer personalId, @PathVariable("liquidacionId") Integer liquidacionId, Model model) {
        model.addAttribute("personalId", personalId);
        model.addAttribute("liquidacion", liquidacionRepository.findById(liquidacionId).get());
        model.addAttribute("personal", personalRepository.findById(personalId).get());
        model.addAttribute("personalPagoAnticipos", personalPagoRepository.findByPersonalIdAndLiquidacionIdAndTipo(personalId, liquidacionId, 2));
        model.addAttribute("itemImponibles", liquidacionItemRepository.findByLiquidacionIdAndTipo(liquidacionId, 1));
        model.addAttribute("itemNoImponibles", liquidacionItemRepository.findByLiquidacionIdAndTipo(liquidacionId, 2));
        model.addAttribute("itemDescuentos", liquidacionItemRepository.findByLiquidacionIdAndTipo(liquidacionId, 3));
        return "partials/_liquidacion_modal";
    }

    @RequestMapping("/save")
    public String save(@PathVariable("personalId") Integer personalId, HttpServletRequest request) {
        Liquidacion liquidacion;
        if (request.getParameter("liquidacion_id") != null) {
            Integer liquidacionId = Integer.parseInt(request.getParameter("liquidacion_id"));
            liquidacion = liquidacionRepository.findById(liquidacionId).get();
        }
        else {
            liquidacion = new Liquidacion();

            Personal personal = personalRepository.findById(personalId).get();
            liquidacion.setPersonal(personal);
        }

        liquidacion.setFecha(Timestamp.valueOf(request.getParameter("liquidacion_fecha") + " 00:00:00"));
        liquidacion.setDiasTrabajados(Integer.parseInt(request.getParameter("liquidacion_dias_trabajados")));
        liquidacion.setMontoImponible(Integer.parseInt(request.getParameter("liquidacion_monto_imponible")));
        liquidacion.setMontoNoImponible(Integer.parseInt(request.getParameter("liquidacion_monto_no_imponible")));
        liquidacion.setMontoDescuentos(Integer.parseInt(request.getParameter("liquidacion_monto_descuentos")));
        liquidacion.setMontoLiquido(Integer.parseInt(request.getParameter("liquidacion_monto_liquido")));
        liquidacionRepository.save(liquidacion);

        for (String entry : (Set<String>) request.getParameterMap().keySet()) {
            String[] info = entry.split("_");

            // ITEMS
            if (info.length == 3 && info[0].equals("item")) {
                String tipo = info[1];
                String id = info[2];
                LiquidacionItem liquidacionItem;
                if (request.getParameter("liquidacion_id") != null) {
                    liquidacionItem = liquidacionItemRepository.findById(Integer.parseInt(id)).get();
                }
                else {
                    liquidacionItem = new LiquidacionItem();
                }
                liquidacionItem.setTipo(Integer.parseInt(tipo));
                liquidacionItem.setNombre(request.getParameter(entry));
                liquidacionItem.setMonto(Integer.parseInt(request.getParameter(entry + "_monto")));
                liquidacionItem.setLiquidacion(liquidacion);
                liquidacionItemRepository.save(liquidacionItem);
            }

            // ANTICIPOS
            if (info.length == 3 && info[0].equals("pago")) {
                if (request.getParameter("liquidacion_id") == null) {
                    String tipo = info[1];
                    String id = info[2];
                    PersonalPago personalPago = personalPagoRepository.findById(Integer.parseInt(id)).get();
                    personalPago.setLiquidacion(liquidacion);
                    personalPagoRepository.save(personalPago);
                }
            }
        }

        return "redirect:/personal/edit/" + personalId;
    }

    @RequestMapping("/delete/{liquidacionId}")
    public String delete(@PathVariable("personalId") Integer personalId, @PathVariable("liquidacionId") Integer liquidacionId) {
        Liquidacion liquidacion = liquidacionRepository.findById(liquidacionId).get();
        liquidacionRepository.delete(liquidacion);
        return "redirect:/personal/edit/" + personalId;
    }

}
