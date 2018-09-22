package com.idan.partmanager.dao;

import com.idan.partmanager.model.Part;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PartDaoImpl implements PartDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addPart(Part part) {
        Session session = this.sessionFactory.getCurrentSession();
        session.persist(part);
    }

    @Override
    public void updatePart(Part part) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(part);
    }

    @Override
    public void removePart(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Part part = (Part) session.load(Part.class, new Integer(id));
        if (part != null) {
            session.delete(part);
        }
    }

    @Override
    public Part getPartById(int id) {
        Session session = this.sessionFactory.getCurrentSession();
        Part part = (Part) session.load(Part.class, new Integer(id));
        System.out.println(part);
        return part;
    }

    @Override
    public List<Part> listParts() {
        Session session = this.sessionFactory.getCurrentSession();
        List<Part> partList = session.createQuery("from Part").list();
        return partList;
    }

    @Override
    public List<Part> listParts(boolean isNecessary) {
        Session session = this.sessionFactory.getCurrentSession();
        List<Part> partList = session.createQuery("from Part where isNecessary is " + isNecessary).list();
        return partList;
    }

    @Override
    public List<Part> listParts(String search) {
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Part where name like :paramName");
        query.setParameter("paramName", "%" + search + "%");
        List<Part> partList = query.list();
        return partList;
    }

    @Override
    public List<Part> listParts(int page) {
        int pageSize = 10;
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Part");
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        List<Part> partList = query.list();
        return partList;
    }

    @Override
    public List<Part> listParts(int page, boolean isNecessary) {
        int pageSize = 10;
        Session session = this.sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Part where isNecessary is " + isNecessary);
        query.setFirstResult((page - 1) * pageSize);
        query.setMaxResults(pageSize);
        List<Part> partList = query.list();
        return partList;
    }

}
