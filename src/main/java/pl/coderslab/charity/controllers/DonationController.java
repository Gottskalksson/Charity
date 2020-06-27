package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Donation;

@Controller
@RequestMapping(value = "/donations", produces = "text/plain;charset=utf-8")
public class DonationController {

    @GetMapping("/add")
    public String viewForm (Model model) {
        model.addAttribute("donation", new Donation());
        return "form";
    }
}
