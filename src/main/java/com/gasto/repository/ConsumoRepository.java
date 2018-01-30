package com.gasto.repository;

import com.gasto.model.Consumo;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ConsumoRepository extends CrudRepository<Consumo, Integer> {
    List<Consumo> findByGastocomunId(Integer gastocomunId);
}
