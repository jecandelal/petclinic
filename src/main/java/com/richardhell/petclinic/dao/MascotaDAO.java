package com.richardhell.petclinic.dao;

import com.richardhell.petclinic.helper.GenericDAO;
import com.richardhell.petclinic.model.Mascota;
import com.richardhell.petclinic.model.Propietario;
import java.util.List;

public interface MascotaDAO extends GenericDAO<Mascota> {

    List<Mascota> allByPropietario(Propietario propietario);
    
}
