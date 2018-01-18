package com.gasto.repository;

import com.gasto.model.LiquidacionItem;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface LiquidacionItemRepository extends CrudRepository<LiquidacionItem, Integer> {
    List<LiquidacionItem> findByLiquidacionId(Integer liquidacionId);
    List<LiquidacionItem> findByLiquidacionIdAndTipo(Integer liquidacionId, Integer tipo);
}
