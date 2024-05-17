<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>로그인</h2>
    <ul class="nav nav-tabs" id="loginTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="member-tab" data-toggle="tab" href="#member" role="tab" aria-controls="member" aria-selected="true">회원 로그인</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="company-tab" data-toggle="tab" href="#company" role="tab" aria-controls="company" aria-selected="false">기업 로그인</a>
        </li>
    </ul>
    <div class="tab-content" id="loginTabContent">
        <!-- 회원 로그인 폼 -->
        <div class="tab-pane fade show active" id="member" role="tabpanel" aria-labelledby="member-tab">
            <form:form action="${pageContext.request.contextPath}/members/login" modelAttribute="member" method="post">
                <div class="form-group">
                    <label for="mem_id">아이디:</label>
                    <form:input path="mem_id" id="mem_id" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="mem_pw">비밀번호:</label>
                    <form:input type="password" path="mem_pw" id="mem_pw" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">로그인</button>
                </div>
                <div>
                    <c:if test="${not empty error}">
                        <span style="color: red;">${error}</span>
                    </c:if>
                </div>
            </form:form>
        </div>
        <!-- 기업 로그인 폼 -->
        <div class="tab-pane fade" id="company" role="tabpanel" aria-labelledby="company-tab">
            <form:form action="${pageContext.request.contextPath}/companies/login" modelAttribute="company" method="post">
                <div class="form-group">
                    <label for="com_id">아이디:</label>
                    <form:input path="com_id" id="com_id" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="com_pw">비밀번호:</label>
                    <form:input type="password" path="com_pw" id="com_pw" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">로그인</button>
                </div>
                <div>
                    <c:if test="${not empty error}">
                        <span style="color: red;">${error}</span>
                    </c:if>
                </div>
            </form:form>
        </div>
    </div>
    <a href="${pageContext.request.contextPath}/members/index">메인으로 돌아가기</a>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
