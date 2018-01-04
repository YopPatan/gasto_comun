package com.gasto.repository;

import com.gasto.model.Boleta;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BoletaRepository extends CrudRepository<Boleta, Integer> {
    List<Boleta> findByCuentaId(Integer cuentaId);
}
