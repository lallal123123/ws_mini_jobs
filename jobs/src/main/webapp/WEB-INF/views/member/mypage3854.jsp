<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page - Home</title>
</head>
<body>
    <header>
        <h1>My Page</h1>
    </header>
    <div>
        <h2>${member.mem_name} 님</h2>
        <a href="${pageContext.request.contextPath}/members/editProfile">내 정보 수정</a>
        <br>
        <a href="${pageContext.request.contextPath}/companies/interestCompanies">관심기업 리스트</a>
    </div>
</body>
</html>
