<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원 목록</title>
</head>
<body>
<header>
    <h1>일반회원 목록</h1>
</header>
<main>
    <table>
        <thead>
            <tr>
                <th>회원 번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>이메일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="member" items="${members}">
                <tr>
                    <td>${member.mem_no}</td>
                    <td><a href="<c:url value='/admin/members/${member.mem_no}'/>">${member.mem_id}</a></td>
                    <td>${member.mem_name}</td>
                    <td>${member.mem_email}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</main>
</body>
</html>
