package com.richardhell.petclinic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Principal {

    @RequestMapping("/")
    public String index() {
        return "redirect:/com/atencion";
    }

    @RequestMapping("login")
    public String login(@RequestParam(required = false, value = "error") String error, Model model) {

        if (error != null) {
            model.addAttribute("loginError", true);
        }
        return "security/login";
    }

}
