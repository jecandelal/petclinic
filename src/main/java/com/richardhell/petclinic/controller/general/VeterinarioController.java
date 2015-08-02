package com.richardhell.petclinic.controller.general;

import com.richardhell.petclinic.dao.PersonaDAO;
import com.richardhell.petclinic.dao.VeterinarioDAO;
import com.richardhell.petclinic.model.Persona;
import com.richardhell.petclinic.model.Veterinario;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Transactional
@RequestMapping("gen/veterinario")
public class VeterinarioController {

    @Autowired
    VeterinarioDAO veterinarioDAO;

    @Autowired
    PersonaDAO personaDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {

        model.addAttribute("veterinarios", veterinarioDAO.all());
        return "general/persona/veterinario";
    }

    @RequestMapping("new")
    public String create(Model model) {

        model.addAttribute("veterinario", new Veterinario());
        model.addAttribute("persona", new Persona());
        return "general/persona/veterinarioForm";
    }

    @RequestMapping("update/{id}")
    public String update(@PathVariable("id") Long id, Model model) {

        Veterinario vet = veterinarioDAO.find(new Veterinario(id));
        model.addAttribute("veterinario", vet);
        model.addAttribute("persona", vet.getPersona());
        return "general/persona/veterinarioForm";
    }

    @RequestMapping("save")
    public String save(Veterinario vet) {

        if (vet.getId() == null) {
            Persona persona = vet.getPersona();
            personaDAO.saveDAO(persona);

            vet.setFechaRegistro(new Date());
            veterinarioDAO.saveDAO(vet);
        } else {
            
            Persona persona = vet.getPersona();
            personaDAO.updateDAO(persona);

        }
        return "redirect:/gen/veterinario";
    }

    @RequestMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id) {

        veterinarioDAO.deleteDAO(new Veterinario(id));
        return "redirect:/gen/veterinario";
    }

}
