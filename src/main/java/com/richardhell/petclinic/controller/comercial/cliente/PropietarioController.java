package com.richardhell.petclinic.controller.comercial.cliente;

import java.util.Date;
import com.richardhell.petclinic.dao.PersonaDAO;
import com.richardhell.petclinic.dao.PropietarioDAO;
import com.richardhell.petclinic.model.Persona;
import com.richardhell.petclinic.model.Propietario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Transactional
@RequestMapping("com/propietario")
public class PropietarioController {

    @Autowired
    PropietarioDAO propiertarioDAO;

    @Autowired
    PersonaDAO personaDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {

        model.addAttribute("props", propiertarioDAO.all());
        return "comercial/cliente/propietario";
    }

    @RequestMapping("new")
    public String create(Model model) {

        model.addAttribute("propietario", new Propietario());
        model.addAttribute("persona", new Persona());
        return "comercial/cliente/propietarioForm";
    }

    @RequestMapping("update/{id}")
    public String update(@PathVariable("id") Long id, Model model) {

        Propietario vet = propiertarioDAO.find(new Propietario(id));
        model.addAttribute("propietario", vet);
        model.addAttribute("persona", vet.getPersona());

        return "comercial/cliente/propietarioForm";
    }

    @RequestMapping("save")
    public String save(Propietario vet) {

        if (vet.getId() == null) {
            Persona persona = vet.getPersona();
            personaDAO.saveDAO(persona);

            vet.setFechaRegistro(new Date());
            propiertarioDAO.saveDAO(vet);
        } else {

            Persona persona = vet.getPersona();
            personaDAO.updateDAO(persona);

        }
        return "redirect:/com/propietario";
    }

    @RequestMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id) {

        propiertarioDAO.deleteDAO(new Propietario(id));
        return "redirect:/com/propietario";
    }
}