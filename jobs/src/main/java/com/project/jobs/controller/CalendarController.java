package com.project.jobs.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.jobs.dto.Recruit;
import com.project.jobs.service.RecruitServiceWithCalendar;

@Controller
@RequestMapping("/calendar")
public class CalendarController {

    private final RecruitServiceWithCalendar recruitService;

    public CalendarController(RecruitServiceWithCalendar recruitService) {
        this.recruitService = recruitService;
    }

    @GetMapping
    public String getCalendarPage() {
        return "calendarRecruit";  
    }

    @GetMapping("/job-postings")
    @ResponseBody
    public List<Recruit> getJobPostings() {
        List<Recruit> recruits = recruitService.getAllRecruits();
        recruits.forEach(recruit -> {
            System.out.println("Title: " + recruit.getTitle());
            System.out.println("Company: " + recruit.getCompany().getCom_name());
            System.out.println("Deadline: " + recruit.getDeadline_date());
        });
        return recruits;
    }
}
