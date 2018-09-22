package com.idan.partmanager.service;

import com.idan.partmanager.dao.PartDao;
import com.idan.partmanager.model.Part;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PartServiceImpl implements PartService {

    private PartDao partDao;

    public void setPartDao(PartDao partDao) {
        this.partDao = partDao;
    }

    @Override
    @Transactional
    public void addPart(Part part) {
        this.partDao.addPart(part);
    }

    @Override
    @Transactional
    public void updatePart(Part part) {
        this.partDao.updatePart(part);
    }

    @Override
    @Transactional
    public void removePart(int id) {
        this.partDao.removePart(id);
    }

    @Override
    @Transactional
    public Part getPartById(int id) {
        return this.partDao.getPartById(id);
    }

    @Override
    @Transactional
    public List<Part> listParts(int page) {
        return this.partDao.listParts(page);
    }

    @Override
    @Transactional
    public List<Part> listParts(int page, boolean isNecessary) {
        return this.partDao.listParts(page, isNecessary);
    }

    @Override
    @Transactional
    public List<Part> listParts(boolean isNecessary) {
        return this.partDao.listParts(isNecessary);
    }

    @Override
    @Transactional
    public List<Part> listParts(String search) {
        return this.partDao.listParts(search);
    }

    @Override
    @Transactional
    public List<Part> listParts() {
        return this.partDao.listParts();
    }

}
