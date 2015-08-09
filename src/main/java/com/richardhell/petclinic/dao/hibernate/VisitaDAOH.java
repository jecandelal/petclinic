package com.richardhell.petclinic.dao.hibernate;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import com.richardhell.petclinic.dao.VisitaDAO;
import com.richardhell.petclinic.model.Visita;

@Repository
public class VisitaDAOH extends HibernateTemplate implements VisitaDAO {

    @Autowired
    public VisitaDAOH(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

    @Override
    public Visita find(Visita t) {
        Criteria criteria = this.getSession().createCriteria(Visita.class);
        criteria.add(Restrictions.eq("id", t.getId()));
        return (Visita) criteria.uniqueResult();
    }

    @Override
    public List<Visita> all() {
        Criteria criteria = this.getSession().createCriteria(Visita.class);
        return criteria.list();
    }

    @Override
    public void saveDAO(Visita t) {
        this.save(t);
    }

    @Override
    public void updateDAO(Visita t) {
        this.merge(t);
    }

    @Override
    public void deleteDAO(Visita t) {
        this.delete(t);
    }

    @Override
    public List<Visita> allFinalizada() {
        Criteria criteria = this.getSession().createCriteria(Visita.class);
        criteria.add(Restrictions.isNotNull("fechaSalida"));
        return criteria.list();
    }

}
