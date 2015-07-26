package com.richardhell.petclinic.dao.hibernate;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import com.richardhell.petclinic.dao.RazaDAO;
import com.richardhell.petclinic.model.Raza;

@Repository
public class RazaDAOH extends HibernateTemplate implements RazaDAO{

    @Autowired
    public RazaDAOH(SessionFactory sessionFactory){
        super(sessionFactory);
    }

    @Override
    public Raza find(Raza t){
        Criteria criteria = this.getSession().createCriteria(Raza.class);
        criteria.add(Restrictions.eq("id", t.getId()));
        return (Raza) criteria.uniqueResult();
    }

    @Override
    public List<Raza> all(){
        Criteria criteria = this.getSession().createCriteria(Raza.class);
        return criteria.list();
    }

    @Override
    public void saveDAO(Raza t){
        this.save(t);
    }

    @Override
    public void updateDAO(Raza t){
        this.merge(t);
    }

    @Override
    public void deleteDAO(Raza t){
        this.delete(t);
    }
}