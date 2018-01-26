package com.gasto.repository;

import com.gasto.model.DepartamentoGasto;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DepartamentoGastoRepository extends CrudRepository<DepartamentoGasto, Integer> {
    List<DepartamentoGasto> findByDepartamentoId(Integer departamentoId);
}
