package com.gasto.repository;

import com.gasto.model.BoletaPago;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BoletaPagoRepository extends CrudRepository<BoletaPago, Integer> {
    List<BoletaPago> findByBoletaCuentaId(Integer cuentaId);
}
