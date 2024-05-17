<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
<h2>Login</h2>
<form:form action="${pageContext.request.contextPath}/members/login" modelAttribute="member" method="post">
    <div>
        <label for="mem_id">아이디:</label>
        <form:input path="mem_id" id="mem_id"/>
    </div>
    <div>
        <label for="mem_pw">비밀번호:</label>
        <form:input type="password" path="mem_pw" id="mem_pw"/>
    </div>
    <div>
        <button type="submit">로그인</button>
    </div>
    <div>
        <c:if test="${not empty error}">
            <span style="color: red;">${error}</span>
        </c:if>
    </div>
</form:form>
</body>
</html>
