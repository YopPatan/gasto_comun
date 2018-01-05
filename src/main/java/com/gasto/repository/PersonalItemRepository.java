package com.gasto.repository;

import com.gasto.model.PersonalItem;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PersonalItemRepository extends CrudRepository<PersonalItem, Integer> {
    List<PersonalItem> findByPersonalId(Integer personalId);
    List<PersonalItem> findByPersonalIdAndTipo(Integer personalId, Integer tipo);
}
