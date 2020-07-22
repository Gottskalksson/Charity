package pl.coderslab.charity.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repositories.InstitutionRepository;

import java.util.List;
import java.util.Optional;

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

    @GetMapping("/institutions/add")
    public String addNewInstitution(Model model) {
        model.addAttribute("institution", new Institution());
        return "form-institution";
    }

    @PostMapping("/institutions/add")
    public String saveInstitutionDate(@ModelAttribute Institution institution, BindingResult result) {

        if (!result.hasErrors()) {
            institutionRepository.save(institution);
            return "redirect:/admin/institutions";
        } else {
            return "form-institution";
        }
    }

    @GetMapping("/institutions/edit/{id}")
    public String editInstitution (@PathVariable long id, Model model) {
        Institution institution = institutionRepository.findById(id).orElse(new Institution());
        model.addAttribute("institution", institution);
        return "form-institution";
    }

    @GetMapping("/institutions/delete/{id}")
    public String deleteInstitution(@PathVariable long id) {
//        Institution institution = institutionRepository.findById(id).orElse(null);
//        if (id != null) {
            institutionRepository.deleteById(id);
            return "redirect:/admin/institutions";
//        }
    }
}
