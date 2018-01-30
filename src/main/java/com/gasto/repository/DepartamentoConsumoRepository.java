package com.gasto.repository;

import com.gasto.model.DepartamentoConsumo;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface DepartamentoConsumoRepository extends CrudRepository<DepartamentoConsumo, Integer> {
    List<DepartamentoConsumo> findByConsumoId(Integer consumoId);
    List<DepartamentoConsumo> findByDepartamentoIdAndConsumoGastocomunId(Integer departamentoId, Integer gastocomunId);

    @Query(value = "SELECT COALESCE(SUM(dc.monto), 0) FROM departamento_consumo dc, consumo c WHERE dc.consumo_id = c.id AND dc.departamento_id = ?1 AND c.gastocomun_id = ?2", nativeQuery = true)
    int getSumMontoByDepartamentoIdAndGastocomunId(Integer departamentoId, Integer gastocomunId);
}
