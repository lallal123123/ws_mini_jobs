<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 리스트</title>
<style>
    .detail-button {
        display: inline-block;
        padding: 5px 10px;
        font-size: 14px;
        color: white;
        background-color: blue;
        border: none;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
    }
    .back-to-main {
        display: inline-block;
        margin-bottom: 20px;
        padding: 5px 10px;
        font-size: 14px;
        color: white;
        background-color: green;
        border: none;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
    }
</style>
</head>
<body>
<header>
    <h1>기업 리스트</h1>
</header>




<table>
    <thead>
        <tr>
            <th>기업 번호</th>
            <th>회사명</th>
            <th>대표자</th>
            <th>주소</th>
            <th>기업상세</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="company" items="${companies}">
            <tr>
                <td>${company.com_no}</td>
                <td>${company.com_name}</td>
                <td>${company.com_ceo}</td>
                <td>${company.com_addr}</td>
                <td><a href="${pageContext.request.contextPath}/companies/${company.com_no}" class="detail-button">기업상세</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<a href="${pageContext.request.contextPath}/members/index" class="back-to-main">메인페이지로 돌아가기</a>
</body>
</html>
