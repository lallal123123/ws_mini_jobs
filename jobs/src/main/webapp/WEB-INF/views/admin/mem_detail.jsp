<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 상세 정보</title>
</head>
<body>
    <header>
        <h1>회원 상세 정보</h1>
    </header>
    <main>
        <p><strong>회원 번호:</strong> <span>${member.mem_no}</span></p>
        <p><strong>아이디:</strong> <span>${member.mem_id}</span></p>
        <p><strong>이름:</strong> <span>${member.mem_name}</span></p>
        <p><strong>생년월일:</strong> <span>${member.mem_birth}</span></p>
        <p><strong>전화번호:</strong> <span>${member.mem_tel}</span></p>
        <p><strong>이메일:</strong> <span>${member.mem_email}</span></p>
        <p><strong>성별:</strong> <span>${member.mem_gender}</span></p>
        <p><strong>가입 날짜:</strong> <span>${member.make_date}</span></p>
    </main>
</body>
</html>
