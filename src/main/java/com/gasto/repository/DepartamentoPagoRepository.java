package com.gasto.repository;

import com.gasto.model.DepartamentoPago;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DepartamentoPagoRepository extends CrudRepository<DepartamentoPago, Integer> {
    List<DepartamentoPago> findByDepartamentoId(Integer departamentoId);
}
