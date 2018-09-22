package com.idan.partmanager.controller;

import com.idan.partmanager.model.Part;
import com.idan.partmanager.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class PartController {

    private PartService partService;

    @Autowired(required = true)
    @Qualifier(value = "partService")
    public void setPartService(PartService partService) {
        this.partService = partService;
    }

    @RequestMapping(value = "parts", method = RequestMethod.GET)
    public String listParts(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                            @RequestParam(value = "isNecessary", required = false) Boolean isNecessary,
                            Model model) {
        model.addAttribute("noOfComps", findNoOfComps());
        int pageSize = 10;
        if (isNecessary == null) {
            int lastPage = (int) Math.ceil(this.partService.listParts().size() * 1.0 / pageSize);
            model.addAttribute("listParts", this.partService.listParts(page));
            model.addAttribute("lastPage", lastPage);
        } else {
            int lastPage = (int) Math.ceil(this.partService.listParts(isNecessary).size() * 1.0 / pageSize);
            model.addAttribute("listParts", this.partService.listParts(page, isNecessary));
            model.addAttribute("lastPage", lastPage);
        }
        model.addAttribute("part", new Part());
        model.addAttribute("currentPage", page);
        model.addAttribute("isNecessary", isNecessary);
        return "parts";
    }

    private int findNoOfComps() {
        int min = 0;
        List<Part> partList = this.partService.listParts(true);
        if (partList.size() != 0) {
            min = partList.get(0).getQuantity();
            for (Part part : partList) {
                if (part.getQuantity() < min) {
                    min = part.getQuantity();
                }
            }
        }
        return min;
    }

    @RequestMapping(value = "/parts/add", method = RequestMethod.POST)
    public String addPart(@ModelAttribute("part") Part part) {
        if (part.getId() == 0) {
            this.partService.addPart(part);
        } else {
            this.partService.updatePart(part);
        }
        return "redirect:/parts";
    }

    @RequestMapping("/remove/{id}")
    public String removePart(@PathVariable("id") int id) {
        this.partService.removePart(id);
        return "redirect:/parts";
    }

    @RequestMapping("edit/{id}")
    public String editPart(@PathVariable("id") int id, Model model) {
        model.addAttribute("part", this.partService.getPartById(id));
        return "edit";
    }

    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String searchParts(@RequestParam(value = "text", required = false) String search, Model model) {
        model.addAttribute("listParts", this.partService.listParts(search));
        model.addAttribute("part", new Part());
        return "search";
    }

}
