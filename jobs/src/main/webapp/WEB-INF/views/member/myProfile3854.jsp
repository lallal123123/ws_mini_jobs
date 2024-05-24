<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jobs 휴먼 클라우드 이력관리플렛폼</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet" type="text/css">
<style>
@charset "UTF-8";

body{
	min-height:100vh;
	position:relative;
}
.header_logo_size{
    width:150px;
    height:auto;
}
.bg-jobs{
	background-color:#1c459a;
}
.btn-jobs {
    --bs-btn-color: #fff;
    --bs-btn-bg: #1c459a;
    --bs-btn-border-color: #1c459a;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #0b5ed7;
    --bs-btn-hover-border-color: #0a58ca;
    --bs-btn-focus-shadow-rgb: 49, 132, 253;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #0a58ca;
    --bs-btn-active-border-color: #0a53be;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #1c459a;
    --bs-btn-disabled-border-color: #1c459a;
}

.nav-jobs li a{
	color:#333;
}

.nav-jobs li a:hover{
	color:#1c459a;
	font-weight:bold;
}
.search-box{
	width:250px;
}
.img_box{
	
	border-radius:5px;
	overflow:hidden;
}
.img_box img{
	max-width:100%;
	height:auto;
}

.text_ellipsis{
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
}

.fs-7 {
    font-size: 0.8rem !important;
}

.btn-jobs-community {
    --bs-btn-color: #fff;
    --bs-btn-bg: #51e554;
    --bs-btn-border-color: #51e554;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #6bf66e;
    --bs-btn-hover-border-color: #6bf66e;
    --bs-btn-focus-shadow-rgb: 49, 132, 253;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #6bf66e;
    --bs-btn-active-border-color: #6bf66e;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #51e554;
    --bs-btn-disabled-border-color: #51e554;
}

.jobs-table{
	border-collapse: collapse;
  	border: 0;
}

.jobs-table > th, td {
  border-bottom: 1px solid #dee2e6;
  background-clip: padding-box;
  scroll-snap-align: start;
  vertical-align:middle;
}

.jobs-table > td {
  border-bottom: 1px solid #dee2e6;
  background-clip: padding-box;
  scroll-snap-align: start;
  vertical-align:middle;
}

.jobs-table th {
  padding: 10px;
  min-width: 6rem;
  margin: 0;
}

.jobs-table td {
  padding: 10px;
  min-width: 6rem;
  margin: 0;
}
.jobs-table thead{
	border-bottom: 3px solid #1c459a;
}

.border-none-table > th, td {
  border-bottom: none;
  background-clip: padding-box;
  scroll-snap-align: start;
  vertical-align:middle;
}

.border-none-table > td {
  border-bottom: 1px solid #dee2e6;
  background-clip: padding-box;
  scroll-snap-align: start;
  vertical-align:middle;
}

.border-none-table td {
  padding: 10px;
  min-width: 6rem;
  margin: 0;
}

</style>
</head>
<body class="d-flex flex-column h-100">
    <jsp:include page="../header.jsp"></jsp:include>
    <!-- 작업공간 영역 -->
    <div class="container">
        <div class="row">
            
            <!-- 사이드빠 CSS -->
            <jsp:include page="../mypagesidebar.jsp"></jsp:include>
            
   
                <div class="col-9 mb-5">
                    <p class="text-secondary d-flex">
                        <a href="#" class="nav-link text-secondary">마이페이지</a> <span class="mx-3">></span>
                        <a href="" class="nav-link text-black fw-bolder">내 정보 수정하기</a>
                    </p>
                    <div class="border p-5 rounded">
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
                            <button type="submit" class="btn btn-jobs w-100">수정하기</button>
                        </form>
                    </div>
                </div>
           
        </div>
    </div>
    <!-- 작업공간 영역 끝 -->
  <jsp:include page="../footer.jsp"></jsp:include>
	
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
