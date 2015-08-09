package com.richardhell.petclinic.dao.hibernate;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import com.richardhell.petclinic.dao.MascotaDAO;
import com.richardhell.petclinic.model.Mascota;
import com.richardhell.petclinic.model.Propietario;

@Repository
public class MascotaDAOH extends HibernateTemplate implements MascotaDAO {

    @Autowired
    public MascotaDAOH(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

    @Override
    public Mascota find(Mascota t) {
        Criteria criteria = this.getSession().createCriteria(Mascota.class);
        criteria.add(Restrictions.eq("id", t.getId()));
        return (Mascota) criteria.uniqueResult();
    }

    @Override
    public List<Mascota> all() {
        Criteria criteria = this.getSession().createCriteria(Mascota.class);
        return criteria.list();
    }

    @Override
    public void saveDAO(Mascota t) {
        this.save(t);
    }

    @Override
    public void updateDAO(Mascota t) {
        this.merge(t);
    }

    @Override
    public void deleteDAO(Mascota t) {
        this.delete(t);
    }

    @Override
    public List<Mascota> allByPropietario(Propietario propietario) {
        Criteria criteria = this.getSession().createCriteria(Mascota.class);
        criteria.add(Restrictions.eq("propietario", propietario));
        return criteria.list();
    }

}
