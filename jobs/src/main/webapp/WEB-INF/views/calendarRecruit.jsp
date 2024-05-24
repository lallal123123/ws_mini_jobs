<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <title>jobs 휴먼 클라우드 이력관리플렛폼</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/css/common.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js"></script>
</head>
<body class="d-flex flex-column h-100">
<jsp:include page="header.jsp"></jsp:include>
<!-- 작업공간 영역 -->
<div class="container-sm">
    <div class="row">
        
        <div class="col-12 mb-5">
            <div class="border p-3">
                <!-- FullCalendar 영역 -->
                <div id="calendar"></div>
            </div>
        </div>
        
    </div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="footer.jsp"></jsp:include>

<script>
    $(document).ready(function() {
        $('#calendar').fullCalendar({
            events: function(start, end, timezone, callback) {
                $.ajax({
                    url: '/calendar/job-postings',
                    dataType: 'json',
                    success: function(data) {
                        var events = [];
                        $(data).each(function() {
                            events.push({
                                title: this.company.com_name + '마감일',
                                start: this.deadline_date,
                                allDay: true
                            });
                        });
                        callback(events);
                    }
                });
            },
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            locale: 'ko' // 한글 설정
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
