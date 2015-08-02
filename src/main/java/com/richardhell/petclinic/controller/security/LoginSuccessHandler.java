package com.richardhell.petclinic.controller.security;

import com.richardhell.petclinic.dao.UsuarioDAO;
import com.richardhell.petclinic.model.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class LoginSuccessHandler  extends SimpleUrlAuthenticationSuccessHandler {

    @Autowired
    UsuarioDAO usuarioDAO;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
            HttpServletResponse response,
            Authentication auth) throws IOException, ServletException {
        
        Usuario usuario = usuarioDAO.findByLogin(auth.getName());
        
        request.getSession().setAttribute("USUARIO_AUTENTICADO", usuario);
        
        this.setDefaultTargetUrl("/com/atencion");
        
        
        super.onAuthenticationSuccess(request, response, auth);
    }
}
