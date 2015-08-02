package com.richardhell.petclinic.dao;

import com.richardhell.petclinic.helper.GenericDAO;
import com.richardhell.petclinic.model.Visita;
import java.util.List;

public interface VisitaDAO extends GenericDAO<Visita> {

    List<Visita> allFinalizada();
    
}
