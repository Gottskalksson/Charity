package pl.coderslab.charity.controllers;

import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repositories.UserRepository;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping(value = "/admin", produces = "text/plain;charset=utf-8")
public class AdminController {

    private final UserRepository userRepository;

    public AdminController(final UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @GetMapping
    public String adminMenu(Model model) {
        List<User> role_admin = userRepository.findAllByRoles(2);
        model.addAttribute("admins", role_admin);
        return "admin";
    }
}
