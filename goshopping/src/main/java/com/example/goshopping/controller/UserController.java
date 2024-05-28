package com.example.goshopping.controller;

import com.example.goshopping.domain.Product;
import com.example.goshopping.domain.ProductRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.example.goshopping.domain.User;
import com.example.goshopping.domain.UserRepository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProductRepository productRepository;

    @GetMapping("/")
    public String mainPage(Model model, HttpSession session) {
        Iterable<Product> productList = productRepository.findAll();
        model.addAttribute("productList", productList);

        String userId = (String) session.getAttribute("userId");
        if (userId != null) {
            model.addAttribute("loggedIn", true);
            model.addAttribute("userRole", session.getAttribute("userRole"));
        } else {
            model.addAttribute("loggedIn", false);
        }

        return "user/main";
    }

    @GetMapping("/signup")
    public String signupForm(Model model) {
        model.addAttribute("user", new User());
        return "user/signup";
    }

    @PostMapping("/signup")
    public String signupSubmit(@ModelAttribute User user) {
        if ("manager3854".equals(user.getUid())) {
            user.setRole("Manager");
        } else {
            user.setRole("Member");
        }
        userRepository.save(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String loginForm(Model model) {
        model.addAttribute("user", new User());
        return "user/login";
    }

    @PostMapping("/login")
    public String loginSubmit(@ModelAttribute User user, HttpSession session, Model model) {
        User foundUser = userRepository.findByUidAndUpw(user.getUid(), user.getUpw());
        if (foundUser != null) {
            session.setAttribute("userId", foundUser.getUid());
            session.setAttribute("userRole", foundUser.getRole());
            return "redirect:/";
        } else {
            model.addAttribute("loginError", true);
            return "user/login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/mypage")
    public String myPage(Model model, HttpSession session) {
        String userRole = (String) session.getAttribute("userRole");
        if ("Manager".equals(userRole)) {
            Iterable<Product> productList = productRepository.findAll();
            model.addAttribute("productList", productList);
        }
        return "user/mypage";
    }
}

