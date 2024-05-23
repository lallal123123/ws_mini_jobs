<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/css/common.css" rel="stylesheet">
    <style>
        .sidebar {
            width: 200px;
            height: 100vh;
            position: fixed;
        }
        .content {
            margin-left: 220px;
        }
        .form-container {
            max-width: 600px;
            margin: auto;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
    <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
    <!-- 작업공간 영역 -->
    <div class="container-fluid">
        <div class="row">
            
            <!-- 사이드빠 CSS -->
            <jsp:include page="../mypagesidebar.jsp"></jsp:include>
            
            <div class="col content">
                <div class="container">
                    <p class="text-secondary d-flex">
                        <a href="#" class="nav-link text-secondary">마이페이지</a> <span class="mx-3">></span>
                        <a href="#" class="nav-link text-secondary">내 정보 보기</a> <span class="mx-3">></span>
                        <a href="" class="nav-link text-black fw-bolder">내 정보 수정하기</a>
                    </p>
                    <div class="form-container">
                        <h1>내 정보 수정</h1>
                        <form action="<c:url value='/members/updateProfile'/>" method="post">
                            <div class="mb-3">
                                <label for="mem_id" class="form-label">아이디</label>
                                <input type="text" class="form-control" id="mem_id" name="mem_id" value="${member.mem_id}" readonly>
                            </div>
                            <div class="mb-3">
                                <label for="mem_pw" class="form-label">비밀번호</label>
                                <input type="password" class="form-control" id="mem_pw" name="mem_pw" value="${member.mem_pw}">
                            </div>
                            <div class="mb-3">
                                <label for="mem_name" class="form-label">이름</label>
                                <input type="text" class="form-control" id="mem_name" name="mem_name" value="${member.mem_name}">
                            </div>
                            <div class="mb-3">
                                <label for="mem_birth" class="form-label">생년월일</label>
                                <input type="text" class="form-control" id="mem_birth" name="mem_birth" value="${member.mem_birth}">
                            </div>
                            <div class="mb-3">
                                <label for="mem_tel" class="form-label">전화번호</label>
                                <input type="text" class="form-control" id="mem_tel" name="mem_tel" value="${member.mem_tel}">
                            </div>
                            <div class="mb-3">
                                <label for="mem_email" class="form-label">이메일</label>
                                <input type="email" class="form-control" id="mem_email" name="mem_email" value="${member.mem_email}">
                            </div>
                            <div class="mb-3">
                                <label for="mem_gender" class="form-label">성별</label>
                                <input type="text" class="form-control" id="mem_gender" name="mem_gender" value="${member.mem_gender}">
                            </div>
                            <button type="submit" class="btn btn-primary">수정하기</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 작업공간 영역 끝 -->
    <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
