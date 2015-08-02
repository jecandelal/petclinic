package com.richardhell.petclinic.controller.comercial.atencion;

import com.richardhell.petclinic.model.Visita;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("visita")
@RequestMapping("com/atencion")
public class AtencionController {

    @Autowired
    AtencionService service;

    @InitBinder
    public void initBinder(WebDataBinder webDataBinder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(true);
        webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @RequestMapping(method = RequestMethod.GET)
    public String index(Model model) {

        model.addAttribute("visitas", service.allVisita());
        model.addAttribute("propietarios", service.allPropietario());
        model.addAttribute("mascotas", service.allMascota());
        model.addAttribute("veterinarios", service.allVeterinario());
        model.addAttribute("visita", new Visita());

        return "comercial/atencion/atencion";
    }

    @RequestMapping("show")
    public String show(@RequestParam("id") Long id, Model model) {

        Visita visita = service.findVisita(new Visita(id));
        model.addAttribute("visita", visita);

        if (visita.getFechaSalida() == null) {
            return "comercial/atencion/proceso";
        }

        return "comercial/atencion/show";
    }

    @RequestMapping("save")
    public String save(@ModelAttribute("visita") Visita visita) {

        service.saveVisita(visita);
        return "redirect:/com/atencion";
    }

    @RequestMapping("exportar")
    public String exportar(Model model) {

        model.addAttribute("visitas", service.allVisitaFinalizada());
        return "reporteAtencion";
    }

}
