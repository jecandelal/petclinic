package com.richardhell.petclinic.controller.comercial.cliente;

import com.richardhell.petclinic.dao.EspecieDAO;
import com.richardhell.petclinic.dao.MascotaDAO;
import com.richardhell.petclinic.dao.PropietarioDAO;
import com.richardhell.petclinic.dao.RazaDAO;
import com.richardhell.petclinic.model.Mascota;
import com.richardhell.petclinic.model.Propietario;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@Transactional
@SessionAttributes("mascota")
@RequestMapping("com/mascota")
public class MascotaController {

    @Autowired
    RazaDAO razaDAO;

    @Autowired
    EspecieDAO especieDAO;

    @Autowired
    PropietarioDAO propietarioDAO;

    @Autowired
    MascotaDAO mascotaDAO;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {

        model.addAttribute("mascotas", mascotaDAO.all());
        return "comercial/cliente/mascota";
    }

    @RequestMapping("list/{propietario}")
    public String list(@PathVariable("propietario") Long propietario, Model model) {

        Propietario prop = propietarioDAO.find(new Propietario(propietario));

        model.addAttribute("propietario", prop);
        model.addAttribute("mascotas", mascotaDAO.allByPropietario(prop));
        return "comercial/cliente/mascota";
    }

    @RequestMapping("new")
    public String create(Model model) {

        model.addAttribute("propietarios", propietarioDAO.all());
        model.addAttribute("razas", razaDAO.all());
        model.addAttribute("especies", especieDAO.all());
        model.addAttribute("mascota", new Mascota());
        return "comercial/cliente/mascotaForm";
    }

    @RequestMapping("update/{id}")
    public String update(@PathVariable("id") Long id, Model model) {

        model.addAttribute("propietarios", propietarioDAO.all());
        model.addAttribute("razas", razaDAO.all());
        model.addAttribute("especies", especieDAO.all());
        model.addAttribute("mascota", mascotaDAO.find(new Mascota(id)));
        return "comercial/cliente/mascotaForm";
    }

    @RequestMapping("save")
    public String save(@ModelAttribute("mascota") Mascota mas) {

        if (mas.getId() == null) {
            mascotaDAO.saveDAO(mas);
        } else {
            mascotaDAO.updateDAO(mas);
        }
        return "redirect:/com/mascota";
    }

    @RequestMapping("delete/{id}")
    public String delete(@PathVariable("id") Long id) {

        mascotaDAO.deleteDAO(new Mascota(id));
        return "redirect:/com/mascota";
    }

    @ExceptionHandler(Exception.class)
    public String handleConflict(Exception ex) {
        ex.printStackTrace();
        return "redirect:/com/mascota";
    }

}
