package pl.coderslab.charity.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repositories.InstitutionRepository;

import java.util.List;

@Controller
@RequestMapping(value = "/admin/institutions", produces = "text/plain;charset=utf-8")
public class InstitutionController {

    private final InstitutionRepository institutionRepository;

    @Autowired
    public InstitutionController(final InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    @GetMapping
    public String getInstitutionList (Model model) {
        List<Institution> institutionList = institutionRepository.findAll();
        model.addAttribute("institutionList", institutionList);

        return "institutions";
    }

    @GetMapping("/add")
    public String addNewInstitution(Model model) {
        model.addAttribute("institution", new Institution());
        return "form-institution";
    }

    @PostMapping("/add")
    public String saveInstitutionDate(@ModelAttribute Institution institution, BindingResult result) {

        if (!result.hasErrors()) {
            institutionRepository.save(institution);
            return "redirect:/admin/institutions";
        } else {
            return "form-institution";
        }
    }

    @GetMapping("/edit/{id}")
    public String editInstitution (@PathVariable long id, Model model) {
        Institution institution = institutionRepository.findById(id).orElse(new Institution());
        model.addAttribute("institution", institution);
        return "form-institution";
    }

    @GetMapping("/delete/{id}")
    public String deleteInstitution(@PathVariable long id) {
            institutionRepository.deleteById(id);
            return "redirect:/admin/institutions";
    }
}
