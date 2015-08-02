package com.richardhell.petclinic.controller.general;

import com.richardhell.petclinic.dao.EspecieDAO;
import com.richardhell.petclinic.model.Especie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Transactional
@RequestMapping("gen/especie")
public class EspecieController {

    @Autowired
    EspecieDAO especieDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {

        model.addAttribute("especies", especieDAO.all());
        model.addAttribute("especie", new Especie());
        return "general/especie";
    }

    @RequestMapping("update/{id}")
    public String update(@PathVariable("id") Long id, Model model) {

        model.addAttribute("especies", especieDAO.all());
        model.addAttribute("especie", especieDAO.find(new Especie(id)));
        return "general/especie";
    }

    @RequestMapping("save")
    public String save(Especie especie) {

        if (especie.getId() == null) {
            especieDAO.saveDAO(especie);
        } else {
            especieDAO.updateDAO(especie);
        }
        return "redirect:/gen/especie";
    }

    @RequestMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id) {

        especieDAO.deleteDAO(new Especie(id));
        return "redirect:/gen/especie";
    }

    @ExceptionHandler(Exception.class)
    public String handleConflict() {
        return "redirect:/gen/especie";
    }
}