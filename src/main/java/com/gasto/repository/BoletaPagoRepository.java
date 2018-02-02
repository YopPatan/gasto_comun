package com.gasto.repository;

import com.gasto.model.BoletaPago;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BoletaPagoRepository extends CrudRepository<BoletaPago, Integer> {
    List<BoletaPago> findByBoletaCuentaId(Integer cuentaId);
    List<BoletaPago> findByBoletaId(Integer boletaId);
    List<BoletaPago> findByGastocomunId(Integer gastocomunId);
    List<BoletaPago> findByGastocomunIdAndBoletaCuentaTipo(Integer gastocomunId, Integer tipo);
    List<BoletaPago> findByGastocomunIdAndConsumoId(Integer gastocomunId, Integer consumoId);
    List<BoletaPago> findByConsumoId(Integer consumoId);
}
