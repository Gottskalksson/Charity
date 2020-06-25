package pl.coderslab.charity.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repositories.DonationRepository;
import pl.coderslab.charity.repositories.InstitutionRepository;

import java.util.List;


@Controller
public class HomeController {

    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    @Autowired
    public HomeController(final InstitutionRepository institutionRepository, final DonationRepository donationRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

    @RequestMapping("/")
    public String homeAction(Model model){

        List<Institution> institutionList = institutionRepository.findAll();
        model.addAttribute("institutionList", institutionList);

        int donationsCount = donationRepository.findAll().size();
        model.addAttribute("donationsCount", donationsCount);

        Integer bagsCount = donationRepository.sumQuantity();
        if (bagsCount == null) {
            bagsCount = 0;
        }
        model.addAttribute("bagsCount", bagsCount);

        return "index";
    }
}
