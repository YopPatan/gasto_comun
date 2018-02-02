package com.gasto.repository;

import com.gasto.model.PersonalPago;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PersonalPagoRepository extends CrudRepository<PersonalPago, Integer> {
    List<PersonalPago> findByPersonalId(Integer personalId);
    List<PersonalPago> findByPersonalIdAndLiquidacionIdAndTipo(Integer personalId, Integer liquidacionId, Integer tipo);
    List<PersonalPago> findByGastocomunId(Integer gastocomunId);
    List<PersonalPago> findByLiquidacionId(Integer liquidacionId);
}
