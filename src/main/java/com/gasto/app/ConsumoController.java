package com.gasto.app;

import com.gasto.model.BoletaPago;
import com.gasto.model.Consumo;
import com.gasto.model.Departamento;
import com.gasto.model.DepartamentoConsumo;
import com.gasto.repository.BoletaPagoRepository;
import com.gasto.repository.ConsumoRepository;
import com.gasto.repository.DepartamentoConsumoRepository;
import com.gasto.repository.DepartamentoRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/consumo")
public class ConsumoController {

    @Resource
    private ConsumoRepository consumoRepository;

    @Resource
    private DepartamentoConsumoRepository departamentoConsumoRepository;

    @Resource
    private DepartamentoRepository departamentoRepository;

    @Resource
    private BoletaPagoRepository boletaPagoRepository;

    @RequestMapping()
    public String findAll(Model model) {
        model.addAttribute("consumos", consumoRepository.findAll());
        return "consumo_list";
    }

    @RequestMapping("/new")
    public String create(Model model) {
        List<DepartamentoConsumo> departamentos = new ArrayList<DepartamentoConsumo>();
        for (Departamento departamento: departamentoRepository.findAll()) {
            DepartamentoConsumo departamentoConsumo = new DepartamentoConsumo();
            departamentoConsumo.setDepartamento(departamento);
            departamentos.add(departamentoConsumo);
        }

        model.addAttribute("departamentoConsumoGrupos", subListDepartamentos(departamentos, 8));
        model.addAttribute("boletaPagos", boletaPagoRepository.findByGastocomunIdAndConsumoId(null, null));
        return "consumo_detail";
    }

    @RequestMapping("/edit/{consumoId}")
    public String update(@PathVariable("consumoId") Integer consumoId, Model model) {
        List<BoletaPago> boletaPagos = boletaPagoRepository.findByConsumoId(consumoId);
        boletaPagos.addAll(boletaPagoRepository.findByGastocomunIdAndConsumoId(null, null));

        model.addAttribute("consumoId", consumoId);
        model.addAttribute("consumo", consumoRepository.findById(consumoId).get());
        model.addAttribute("departamentoConsumoGrupos", subListDepartamentos(departamentoConsumoRepository.findByConsumoId(consumoId), 8));
        model.addAttribute("boletaPagos", boletaPagos);
        return "consumo_detail";
    }

    @RequestMapping("/save")
    public String save(HttpServletRequest request) {
        Consumo consumo;
        if (request.getParameter("consumo_id") != null) {
            Integer consumoId = Integer.parseInt(request.getParameter("consumo_id"));
            consumo = consumoRepository.findById(consumoId).get();
        }
        else {
            consumo = new Consumo();
        }

        consumo.setFecha(Timestamp.valueOf(request.getParameter("consumo_fecha") + " 00:00:00"));
        consumo.setNombre(request.getParameter("consumo_nombre"));
        consumo.setCantidad(Integer.parseInt(request.getParameter("consumo_cantidad")));
        consumo.setMonto(Integer.parseInt(request.getParameter("consumo_monto")));
        consumoRepository.save(consumo);

        for (String entry : (Set<String>) request.getParameterMap().keySet()) {
            String[] info = entry.split("_");
            if (info.length == 4 && info[0].equals("departamento")) {
                int departamentoId = Integer.parseInt(info[1]);
                int departamentoConsumoId = Integer.parseInt(info[2]);
                int cantidad = request.getParameter(entry).equals("") ? 0 : Integer.parseInt(request.getParameter(entry));
                int monto = (cantidad > 0) ? (int) ((consumo.getMonto() / consumo.getCantidad()) * cantidad) : 0;

                DepartamentoConsumo departamentoConsumo;
                if (departamentoConsumoId == 0) {
                    Departamento departamento = departamentoRepository.findById(departamentoId).get();
                    departamentoConsumo = new DepartamentoConsumo();
                    departamentoConsumo.setDepartamento(departamento);
                    departamentoConsumo.setConsumo(consumo);
                }
                else {
                    departamentoConsumo = departamentoConsumoRepository.findById(departamentoConsumoId).get();
                }

                departamentoConsumo.setCantidad(cantidad);
                departamentoConsumo.setMonto(monto);
                departamentoConsumoRepository.save(departamentoConsumo);
            }

            if (info.length == 3 && info[0].equals("item")) {
                String tipo = info[1];
                int pagoId = Integer.parseInt(info[2]);
                if (tipo.equals("boleta")) {
                    BoletaPago boletaPago = boletaPagoRepository.findById(pagoId).get();
                    if (request.getParameter(entry).equals("1")) {
                        boletaPago.setConsumo(consumo);
                    }
                    else {
                        boletaPago.setConsumo(null);
                    }
                    boletaPagoRepository.save(boletaPago);
                }
            }
        }

        return "redirect:/consumo";
    }

    @RequestMapping("/delete/{consumoId}")
    public String delete(@PathVariable("consumoId") Integer consumoId) {
        Consumo consumo = consumoRepository.findById(consumoId).get();
        consumoRepository.delete(consumo);
        return "redirect:/consumo";
    }

    private static List<List<DepartamentoConsumo>> subListDepartamentos(List<DepartamentoConsumo> departamentoConsumos, int count) {
        //List<Departamento> departamentos = (List<Departamento>) iterableDepartamentos;
        List<List<DepartamentoConsumo>> departamentoGrupos = new ArrayList<List<DepartamentoConsumo>>();
        int start = 0;
        while (start < departamentoConsumos.size()) {
            int limit = (start + count) > departamentoConsumos.size() ? departamentoConsumos.size() : start + count;
            departamentoGrupos.add(departamentoConsumos.subList(start, limit));
            start = limit;
        }
        return departamentoGrupos;
    }
}
