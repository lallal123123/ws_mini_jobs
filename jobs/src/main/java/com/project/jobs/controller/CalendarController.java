package com.project.jobs.controller;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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
        return "calendarRecruit";  // JSP 파일명과 일치해야 합니다.
    }




}
