package com.richardhell.petclinic.dao.hibernate;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import com.richardhell.petclinic.dao.PersonaDAO;
import com.richardhell.petclinic.model.Persona;

@Repository
public class PersonaDAOH extends HibernateTemplate implements PersonaDAO{

    @Autowired
    public PersonaDAOH(SessionFactory sessionFactory){
        super(sessionFactory);
    }

    @Override
    public Persona find(Persona t){
        Criteria criteria = this.getSession().createCriteria(Persona.class);
        criteria.add(Restrictions.eq("id", t.getId()));
        return (Persona) criteria.uniqueResult();
    }

    @Override
    public List<Persona> all(){
        Criteria criteria = this.getSession().createCriteria(Persona.class);
        return criteria.list();
    }

    @Override
    public void saveDAO(Persona t){
        this.save(t);
    }

    @Override
    public void updateDAO(Persona t){
        this.merge(t);
    }

    @Override
    public void deleteDAO(Persona t){
        this.delete(t);
    }
}