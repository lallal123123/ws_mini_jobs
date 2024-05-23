<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jobs 휴먼 클라우드 이력관리플렛폼</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
</head>
<body class="d-flex flex-column h-100">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<!-- 작업공간 영역 -->
<div class="container">
    <div class="row">
        <h1>기업 리스트</h1>
    </div>

    <table class="table">
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
                    <td><a href="${pageContext.request.contextPath}/companies/${company.com_no}" class="btn btn-primary">기업상세</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
