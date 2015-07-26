package com.richardhell.petclinic.dao.hibernate;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import com.richardhell.petclinic.dao.UsuarioDAO;
import com.richardhell.petclinic.helper.EstadoEnum;
import com.richardhell.petclinic.model.Usuario;

@Repository
public class UsuarioDAOH extends HibernateTemplate implements UsuarioDAO {

    @Autowired
    public UsuarioDAOH(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

    @Override
    public Usuario find(Usuario t) {
        Criteria criteria = this.getSession().createCriteria(Usuario.class);
        criteria.add(Restrictions.eq("id", t.getId()));
        return (Usuario) criteria.uniqueResult();
    }

    @Override
    public List<Usuario> all() {
        Criteria criteria = this.getSession().createCriteria(Usuario.class);
        return criteria.list();
    }

    @Override
    public void saveDAO(Usuario t) {
        this.save(t);
    }

    @Override
    public void updateDAO(Usuario t) {
        this.merge(t);
    }

    @Override
    public void deleteDAO(Usuario t) {
        this.delete(t);
    }

    @Override
    public Usuario findByLogin(String usuario) {
        Criteria criteria = this.getSession().createCriteria(Usuario.class);
        criteria.add(Restrictions.eq("email", usuario));
        criteria.add(Restrictions.eq("estado", EstadoEnum.ACT.name()));
        return (Usuario) criteria.uniqueResult();
    }

}
