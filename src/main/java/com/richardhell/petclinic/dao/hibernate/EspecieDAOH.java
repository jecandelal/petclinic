package com.richardhell.petclinic.dao.hibernate;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import com.richardhell.petclinic.dao.EspecieDAO;
import com.richardhell.petclinic.model.Especie;

@Repository
public class EspecieDAOH extends HibernateTemplate implements EspecieDAO{

    @Autowired
    public EspecieDAOH(SessionFactory sessionFactory){
        super(sessionFactory);
    }

    @Override
    public Especie find(Especie t){
        Criteria criteria = this.getSession().createCriteria(Especie.class);
        criteria.add(Restrictions.eq("id", t.getId()));
        return (Especie) criteria.uniqueResult();
    }

    @Override
    public List<Especie> all(){
        Criteria criteria = this.getSession().createCriteria(Especie.class);
        return criteria.list();
    }

    @Override
    public void saveDAO(Especie t){
        this.save(t);
    }

    @Override
    public void updateDAO(Especie t){
        this.merge(t);
    }

    @Override
    public void deleteDAO(Especie t){
        this.delete(t);
    }
}