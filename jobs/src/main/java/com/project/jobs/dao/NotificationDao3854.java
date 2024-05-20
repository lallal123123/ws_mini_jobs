package com.project.jobs.dao;

import java.util.List;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import com.project.jobs.dto.Notification;

@Mapper
public interface NotificationDao3854 {

    @Insert("INSERT INTO notifications (mem_no, message, is_read, created_at) VALUES (#{mem_no}, #{message}, #{is_read}, #{created_at})")
    void insertNotification(Notification notification);

    @Select("SELECT COUNT(*) FROM notifications WHERE mem_no = #{mem_no} AND is_read = FALSE")
    int countUnreadNotifications(Long mem_no);

    @Select("SELECT * FROM notifications WHERE mem_no = #{mem_no} ORDER BY created_at DESC")
    List<Notification> getNotificationsByMemberId(Long mem_no);

    @Update("UPDATE notifications SET is_read = TRUE WHERE id = #{id}")
    void markNotificationAsRead(Long id);
}
