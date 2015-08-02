package com.richardhell.petclinic.controller.admin;

import com.richardhell.petclinic.dao.PersonaDAO;
import com.richardhell.petclinic.dao.UsuarioDAO;
import com.richardhell.petclinic.helper.EstadoEnum;
import com.richardhell.petclinic.model.Persona;
import com.richardhell.petclinic.model.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("usuario")
@Transactional
@RequestMapping("adm/personal")
public class PersonalController {

    @Autowired
    UsuarioDAO usuarioDAO;

    @Autowired
    PersonaDAO personaDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {

        model.addAttribute("usuarios", usuarioDAO.all());
        return "admin/personal/personal";
    }

    @RequestMapping("new")
    public String create(Model model) {

        model.addAttribute("usuario", new Usuario());
        model.addAttribute("persona", new Persona());
        return "admin/personal/personalForm";
    }

    @RequestMapping("update/{id}")
    public String update(@PathVariable("id") Long id, Model model) {

        Usuario usuario = usuarioDAO.find(new Usuario(id));
        model.addAttribute("usuario", usuario);
        model.addAttribute("persona", usuario.getPersona());
        return "admin/personal/personalForm";
    }

    @RequestMapping("save")
    public String save(@ModelAttribute("usuario") Usuario user) {

        if (user.getId() == null) {
            Persona persona = user.getPersona();
            personaDAO.saveDAO(persona);

            user.setEmail(persona.getEmail());
            user.setPassword(persona.getEmail());
            user.setEstado(EstadoEnum.ACT.name());
            usuarioDAO.saveDAO(user);
        } else {
            Persona persona = user.getPersona();
            personaDAO.updateDAO(persona);

            user.setEmail(persona.getEmail());
            usuarioDAO.updateDAO(user);
        }
        return "redirect:/adm/personal";
    }

    @RequestMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id) {

        usuarioDAO.deleteDAO(new Usuario(id));
        return "redirect:/adm/personal";
    }

}
