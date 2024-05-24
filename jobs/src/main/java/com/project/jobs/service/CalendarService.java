package com.project.jobs.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CalendarService {

    public List<Event> getAllEvents() {
        return Arrays.asList(
            new Event("1", "Company Meeting", "2024-06-01"),
            new Event("2", "Project Deadline", "2024-06-10"),
            new Event("3", "Team Building Activity", "2024-06-15")
        );
    }

    public static class Event {
        private String id;
        private String title;
        private String start;

        public Event(String id, String title, String start) {
            this.id = id;
            this.title = title;
            this.start = start;
        }

        public String getId() {
            return id;
        }

        public String getTitle() {
            return title;
        }

        public String getStart() {
            return start;
        }
    }
}

