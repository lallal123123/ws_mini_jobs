/*package com.project.jobs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jobs.dao.NotificationDao3854;
import com.project.jobs.dto.Notification;

@Service
public class NotificationService {

    @Autowired
    private NotificationDao3854 notificationDao;

    public int getUnreadNotificationCount(Long mem_no) {
        return notificationDao.countUnreadNotifications(mem_no);
    }

    public List<Notification> getNotificationsByMemberId(Long mem_no) {
        return notificationDao.getNotificationsByMemberId(mem_no);
    }

    public void markNotificationAsRead(Long id) {
        notificationDao.markNotificationAsRead(id);
    }
}*/
