package com.richardhell.petclinic.controller.security;

import com.richardhell.petclinic.dao.UsuarioDAO;
import com.richardhell.petclinic.model.Usuario;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDetailsService")
@Transactional(readOnly = true)
public class UserDetailsServiceImp implements UserDetailsService {

    @Autowired
    UsuarioDAO usuarioDAO;

    @Override
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {

        Usuario usuario = usuarioDAO.findByLogin(username);
                
        if (usuario == null) {
            throw new UsernameNotFoundException("Usuario no encontrado.");
        }

        String password = usuario.getPassword();

        List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
        roles.add(new SimpleGrantedAuthority(usuario.getPerfil()));

        return new User(username, password, roles);
    }

}