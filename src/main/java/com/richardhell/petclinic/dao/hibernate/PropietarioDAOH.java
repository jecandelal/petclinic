package com.richardhell.petclinic.dao.hibernate;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import com.richardhell.petclinic.dao.PropietarioDAO;
import com.richardhell.petclinic.model.Propietario;

@Repository
public class PropietarioDAOH extends HibernateTemplate implements PropietarioDAO{

    @Autowired
    public PropietarioDAOH(SessionFactory sessionFactory){
        super(sessionFactory);
    }

    @Override
    public Propietario find(Propietario t){
        Criteria criteria = this.getSession().createCriteria(Propietario.class);
        criteria.add(Restrictions.eq("id", t.getId()));
        return (Propietario) criteria.uniqueResult();
    }

    @Override
    public List<Propietario> all(){
        Criteria criteria = this.getSession().createCriteria(Propietario.class);
        return criteria.list();
    }

    @Override
    public void saveDAO(Propietario t){
        this.save(t);
    }

    @Override
    public void updateDAO(Propietario t){
        this.merge(t);
    }

    @Override
    public void deleteDAO(Propietario t){
        this.delete(t);
    }
}