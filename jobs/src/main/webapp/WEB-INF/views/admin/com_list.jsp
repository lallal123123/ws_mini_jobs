<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 목록</title>
</head>
<body>
<header>
    <h1>기업 목록</h1>
</header>
<main>
    <table>
        <thead>
            <tr>
                <th>기업 번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>이메일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="company" items="${companies}">
                <tr>
                    <td>${company.com_no}</td>
                    <td><a href="<c:url value='/admin/companies/${company.com_no}'/>">${company.com_id}</a></td>
                    <td>${company.com_name}</td>
                    <td>${company.com_email}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</main>
</body>
</html>
