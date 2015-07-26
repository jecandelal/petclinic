package com.richardhell.petclinic.dao;

import com.richardhell.petclinic.helper.GenericDAO;
import com.richardhell.petclinic.model.Usuario;

public interface UsuarioDAO extends GenericDAO<Usuario> {

    Usuario findByLogin(String usuario);
    
}
