package com.gasto.repository;

import com.gasto.model.Liquidacion;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LiquidacionRepository extends CrudRepository<Liquidacion, Integer> {
    List<Liquidacion> findByPersonalId(Integer personalId);
}
