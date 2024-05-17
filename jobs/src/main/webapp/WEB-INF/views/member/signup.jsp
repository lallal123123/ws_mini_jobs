<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <h2>회원가입</h2>
    <form:form action="${pageContext.request.contextPath}/members/insertMember" method="post" modelAttribute="member">
        <div>
            <label for="mem_id">아이디</label>
            <form:input path="mem_id" id="mem_id"/>
        </div>
        <div>
            <label for="mem_pw">비밀번호</label>
            <form:password path="mem_pw" id="mem_pw"/>
        </div>
        <div>
            <label for="mem_name">이름</label>
            <form:input path="mem_name" id="mem_name"/>
        </div>
        <div>
            <label for="mem_birth">생년월일</label>
            <form:input path="mem_birth" id="mem_birth"/>
        </div>
        <div>
            <label for="mem_tel">전화번호</label>
            <form:input path="mem_tel" id="mem_tel"/>
        </div>
        <div>
            <label for="mem_email">이메일</label>
            <form:input path="mem_email" id="mem_email"/>
        </div>
        <div>
            <label for="mem_gender">성별</label>
            <form:input path="mem_gender" id="mem_gender"/>
        </div>
        <div>
            <button type="submit">회원가입</button>
        </div>
    </form:form>
</body>
</html>