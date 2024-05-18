<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit My Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            padding: 20px;
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #333;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>내 정보 수정</h1>
        <form action="<c:url value='/members/update/${member.mem_no}'/>" method="post">
            <div class="form-group">
                <label for="mem_id">아이디</label>
                <input type="text" id="mem_id" name="mem_id" value="${member.mem_id}" readonly>
            </div>
            <div class="form-group">
                <label for="mem_pw">비밀번호</label>
                <input type="password" id="mem_pw" name="mem_pw" value="${member.mem_pw}">
            </div>
            <div class="form-group">
                <label for="mem_name">이름</label>
                <input type="text" id="mem_name" name="mem_name" value="${member.mem_name}">
            </div>
            <div class="form-group">
                <label for="mem_birth">생년월일</label>
                <input type="text" id="mem_birth" name="mem_birth" value="${member.mem_birth}">
            </div>
            <div class="form-group">
                <label for="mem_tel">전화번호</label>
                <input type="text" id="mem_tel" name="mem_tel" value="${member.mem_tel}">
            </div>
            <div class="form-group">
                <label for="mem_email">이메일</label>
                <input type="email" id="mem_email" name="mem_email" value="${member.mem_email}">
            </div>
            <div class="form-group">
                <label for="mem_gender">성별</label>
                <input type="text" id="mem_gender" name="mem_gender" value="${member.mem_gender}">
            </div>
            <div class="form-group">
                <button type="submit">수정하기</button>
            </div>
        </form>
    </div>
</body>
</html>
