package com.richardhell.petclinic.controller.general;

import com.richardhell.petclinic.dao.EspecieDAO;
import com.richardhell.petclinic.dao.RazaDAO;
import com.richardhell.petclinic.model.Raza;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("gen/raza")
public class RazaController {

    @Autowired
    RazaDAO razaDAO;

    @Autowired
    EspecieDAO especieDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {

        model.addAttribute("razas", razaDAO.all());
        model.addAttribute("especies", especieDAO.all());
        model.addAttribute("raza", new Raza());
        return "general/raza";
    }

    @RequestMapping("update/{id}")
    public String update(@PathVariable("id") Long id, Model model) {

        model.addAttribute("razas", razaDAO.all());
        model.addAttribute("especies", especieDAO.all());
        model.addAttribute("raza", razaDAO.find(new Raza(id)));
        return "general/raza";

    }

    @RequestMapping("save")
    public String save(Raza raza) {

        razaDAO.saveDAO(raza);
        return "redirect:/gen/raza";
    }

    @RequestMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id) {

        razaDAO.deleteDAO(new Raza(id));
        return "redirect:/gen/raza";
    }

    @ExceptionHandler(Exception.class)
    public String handleConflict() {
        return "redirect:/gen/raza";
    }

}
