<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>알림</title>
    <style>
        .unread {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <header>
        <h1>알림</h1>
    </header>
    <div>
        <c:forEach var="notification" items="${notifications}">
            <div class="${notification.is_read ? '' : 'unread'}">
                <p>${notification.message}</p>
                <a href="${pageContext.request.contextPath}/notifications/markAsRead/${notification.id}">Mark as read</a>
            </div>
        </c:forEach>
    </div>
</body>
</html>
