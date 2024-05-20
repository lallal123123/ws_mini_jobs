/*package com.project.jobs.controller;

package com.project.jobs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.jobs.dto.Notification;
import com.project.jobs.service.NotificationService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/notifications")
public class Notification_controller {

    @Autowired
    private NotificationService notificationService;

    @GetMapping
    public String getNotifications(HttpSession session, Model model) {
        Long mem_no = (Long) session.getAttribute("loggedInMemberMemNo");
        List<Notification> notifications = notificationService.getNotificationsByMemberId(mem_no);
        model.addAttribute("notifications", notifications);
        return "notifications";
    }

    @GetMapping("/markAsRead/{id}")
    public String markAsRead(@PathVariable Long id) {
        notificationService.markNotificationAsRead(id);
        return "redirect:/notifications";
    }
}*/

