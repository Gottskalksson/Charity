package pl.coderslab.charity.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.coderslab.charity.entity.Role;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repositories.RoleRepository;
import pl.coderslab.charity.repositories.UserRepository;

import java.util.List;

@Controller
@RequestMapping(value = "/admin", produces = "text/plain;charset=utf-8")
public class AdminController {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public AdminController(final UserRepository userRepository, final RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    @GetMapping
    public String adminMenu(Model model) {
        Role role_admin = roleRepository.findByName("ROLE_ADMIN");
        List<User> usersByRoles = userRepository.findUsersByRoles(role_admin);
        model.addAttribute("admins", usersByRoles);
        return "admin";
    }
}
