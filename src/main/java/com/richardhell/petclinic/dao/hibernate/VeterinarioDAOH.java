package com.richardhell.petclinic.dao.hibernate;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import com.richardhell.petclinic.dao.VeterinarioDAO;
import com.richardhell.petclinic.model.Veterinario;

@Repository
public class VeterinarioDAOH extends HibernateTemplate implements VeterinarioDAO{

    @Autowired
    public VeterinarioDAOH(SessionFactory sessionFactory){
        super(sessionFactory);
    }

    @Override
    public Veterinario find(Veterinario t){
        Criteria criteria = this.getSession().createCriteria(Veterinario.class);
        criteria.add(Restrictions.eq("id", t.getId()));
        return (Veterinario) criteria.uniqueResult();
    }

    @Override
    public List<Veterinario> all(){
        Criteria criteria = this.getSession().createCriteria(Veterinario.class);
        return criteria.list();
    }

    @Override
    public void saveDAO(Veterinario t){
        this.save(t);
    }

    @Override
    public void updateDAO(Veterinario t){
        this.merge(t);
    }

    @Override
    public void deleteDAO(Veterinario t){
        this.delete(t);
    }
}