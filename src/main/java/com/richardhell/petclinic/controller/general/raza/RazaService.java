package com.richardhell.petclinic.controller.general.raza;

import com.richardhell.petclinic.model.Especie;
import com.richardhell.petclinic.model.Raza;
import java.util.List;

public interface RazaService {

    List<Raza> allRaza();

    Raza findRaza(Long id);

    void save(Raza raza);

    void delete(Raza raza);
    
    List<Especie> allEspecie();

}
