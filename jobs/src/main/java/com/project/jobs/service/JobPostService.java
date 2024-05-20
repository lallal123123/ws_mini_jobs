/*package com.project.jobs.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jobs.dao.JobPostDao3854;
import com.project.jobs.dao.NotificationDao3854;

import com.project.jobs.dto.Member;
import com.project.jobs.dto.Notification;

@Service
public class JobPostService {
    
    @Autowired
    private JobPostDao3854 jobPostDao;

    @Autowired
    private CompanyService3854 companyService;

    @Autowired
    private NotificationDao3854 notificationDao;

    public void createJobPost(JobPost jobPost) {
        jobPost.setCreated_at(new Date());
        jobPostDao.insertJobPost(jobPost);
        notifyInterestedMembers(jobPost.getCom_no(), jobPost.getTitle());
    }

    private void notifyInterestedMembers(Long com_no, String jobTitle) {
        List<Member> interestedMembers = companyService.getInterestedMembers(com_no);
        for (Member member : interestedMembers) {
            String message = "관심 기업이 새로운 채용 공고를 올렸습니다: " + jobTitle;
            Notification notification = new Notification();
            notification.setMem_no(member.getMem_no());
            notification.setMessage(message);
            notification.setIs_read(false);
            notification.setCreated_at(new Date());
            notificationDao.insertNotification(notification);
        }
    }
}*/

