package pl.coderslab.charity.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repositories.InstitutionRepository;

import java.util.List;

@Controller
@RequestMapping(value = "/admin", produces = "text/plain;charset=utf-8")
public class AdminController {

    private final InstitutionRepository institutionRepository;

    @Autowired
    public AdminController(final InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    @GetMapping("/institutions")
    public String getInstitutionList (Model model) {
        List<Institution> institutionList = institutionRepository.findAll();
        model.addAttribute("institutionList", institutionList);

        return "institutions";
    }
}
