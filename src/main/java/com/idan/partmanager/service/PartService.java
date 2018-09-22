package com.idan.partmanager.service;

import com.idan.partmanager.model.Part;

import java.util.List;

public interface PartService {
    public void addPart(Part part);

    public void updatePart(Part part);

    public void removePart(int id);

    public Part getPartById(int id);

    public List<Part> listParts(int page);

    public List<Part> listParts(int page, boolean isNecessary);

    public List<Part> listParts(boolean isNecessary);

    public List<Part> listParts(String search);

    public List<Part> listParts();
}
