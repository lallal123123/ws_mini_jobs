package com.example.goshopping.controller;

import com.example.goshopping.domain.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private CartRepository cartRepository;

    @GetMapping("/add")
    public String showOrderForm(@RequestParam("productId") Long productId, @RequestParam("quantity") int quantity, Model model) {
        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid product Id:" + productId));
        model.addAttribute("product", product);
        model.addAttribute("quantity", quantity);
        model.addAttribute("order", new Order());
        return "order/form";
    }

    @PostMapping("/add")
    public String placeOrder(@RequestParam("productId") Long productId,
                             @RequestParam("quantity") int quantity,
                             @RequestParam("address") String address,
                             @RequestParam("paymentMethod") String paymentMethod,
                             HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        User user = userRepository.findByUid(userId);

        Product product = productRepository.findById(productId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid product Id:" + productId));

        if (product.getPStock() < quantity) {
            model.addAttribute("errorMessage", "재고가 부족합니다. 현재 재고: " + product.getPStock());
            return "order/form";
        }

        product.setPStock(product.getPStock() - quantity);
        productRepository.save(product);

        Order order = Order.builder()
                .user(user)
                .product(product)
                .quantity(quantity)
                .address(address)
                .paymentMethod(paymentMethod)
                .build();

        orderRepository.save(order);

        return "order/confirmation";
    }

    @GetMapping("/myorders")
    public String viewOrders(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        User user = userRepository.findByUid(userId);

        model.addAttribute("orderList", orderRepository.findByUser(user));
        return "user/orders";
    }

    @PostMapping("/cancel/{id}")
    public String cancelOrder(@PathVariable("id") Long id, HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        User user = userRepository.findByUid(userId);

        Order order = orderRepository.findById(id).orElse(null);

        if (order == null) {
            model.addAttribute("errorMessage", "Invalid order Id: " + id);
            return "order/error";
        }

        if (!order.getUser().equals(user)) {
            model.addAttribute("errorMessage", "You are not authorized to cancel this order.");
            return "order/error";
        }

        orderRepository.deleteById(id);
        return "redirect:/order/myorders";
    }

    @PostMapping("/order/{id}")
    public String orderProduct(@PathVariable("id") Long id, HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        User user = userRepository.findByUid(userId);

        Cart cart = cartRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid cart Id:" + id));

        Product product = cart.getProduct();
        int quantity = cart.getQuantity();

        if (product.getPStock() < quantity) {
            model.addAttribute("errorMessage", "재고가 부족합니다. 현재 재고: " + product.getPStock());
            return "user/cart";
        }

        model.addAttribute("product", product);
        model.addAttribute("quantity", quantity);

        return "order/form";
    }
}
