package com.richardhell.petclinic.controller.general.raza;

import com.richardhell.petclinic.dao.EspecieDAO;
import com.richardhell.petclinic.dao.RazaDAO;
import com.richardhell.petclinic.model.Especie;
import com.richardhell.petclinic.model.Raza;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RazaServiceImp implements RazaService {

    @Autowired
    RazaDAO razaDAO;

    @Autowired
    EspecieDAO especieDAO;

    @Override
    public List<Raza> allRaza() {
        return razaDAO.all();
    }

    @Override
    public Raza findRaza(Long id) {
        return razaDAO.find(new Raza(id));
    }

    @Override
    public void save(Raza raza) {
        if (raza.getId() == null) {
            razaDAO.saveDAO(raza);
        } else {
            razaDAO.updateDAO(raza);
        }
    }

    @Override
    public void delete(Raza raza) {
        razaDAO.deleteDAO(raza);
    }

    @Override
    public List<Especie> allEspecie() {
        return especieDAO.all();
    }

}
