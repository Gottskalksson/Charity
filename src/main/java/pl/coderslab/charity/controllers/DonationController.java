package pl.coderslab.charity.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repositories.CategoryRepository;
import pl.coderslab.charity.repositories.DonationRepository;
import pl.coderslab.charity.repositories.InstitutionRepository;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Controller
@RequestMapping(value = "/donations", produces = "text/plain;charset=utf-8")
public class DonationController {

    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    @Autowired
    public DonationController(final CategoryRepository categoryRepository, final InstitutionRepository institutionRepository,
                              final DonationRepository donationRepository) {
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

    @GetMapping("/add")
    public String viewForm (Model model) {
        List<Category> categoryList = categoryRepository.findAll();
        model.addAttribute("categoryList", categoryList);

        List<Institution> institutionList = institutionRepository.findAll();
        model.addAttribute("institutionList", institutionList);

        LocalDate date = LocalDate.now();
        model.addAttribute("nowDate", date);

        LocalTime time = LocalTime.now().truncatedTo(ChronoUnit.MINUTES);
        model.addAttribute("time", time);

        model.addAttribute("donation", new Donation());

        return "form";
    }

    @PostMapping("/add")
    public String formConfirmation (@ModelAttribute Donation donation, BindingResult result) {

        if (!result.hasErrors()) {
            donationRepository.save(donation);
            return "form-confirmation";
        } else {
            return "form";
        }
    }
}
