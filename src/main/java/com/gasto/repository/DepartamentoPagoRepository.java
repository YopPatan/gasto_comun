package com.gasto.repository;

import com.gasto.model.DepartamentoPago;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DepartamentoPagoRepository extends CrudRepository<DepartamentoPago, Integer> {
    List<DepartamentoPago> findByDepartamentoId(Integer departamentoId);

    @Query(value = "SELECT COALESCE(SUM(monto), 0) FROM departamento_pago WHERE departamento_id = ?1", nativeQuery = true)
    int getSumMontoByDepartamentoId(Integer departamentoId);
}
