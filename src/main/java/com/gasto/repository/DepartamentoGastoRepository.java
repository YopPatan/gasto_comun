package com.gasto.repository;

import com.gasto.model.DepartamentoGasto;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DepartamentoGastoRepository extends CrudRepository<DepartamentoGasto, Integer> {
    List<DepartamentoGasto> findByDepartamentoId(Integer departamentoId);

    @Query(value = "SELECT COALESCE(SUM(monto_total), 0) FROM departamento_gasto WHERE departamento_id = ?1", nativeQuery = true)
    int getSumMontoByDepartamentoId(Integer departamentoId);
}
