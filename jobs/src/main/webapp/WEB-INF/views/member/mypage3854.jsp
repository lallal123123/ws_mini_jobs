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
</head>
<body class="d-flex flex-column h-100">
    <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
    <!-- 작업공간 영역 -->
    <div class="container">
        <div class="row">
            <div class="col-3">
                <div class="border p-3 rounded">
                    <ul class="nav nav-pills flex-column mb-auto">
                        <!-- 여기에 메뉴를 나열해주세요 -->
                        <li class="nav-item">
                            <a href="#" class="nav-link link-body-emphasis border-bottom rounded-0" aria-current="page">My 홈</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/members/editProfile">내 정보 수정</a>
                        </li> 
                        <li>
                            <div class="accordion" id="accordionPanelsStayOpenExample">
                                <a href="${pageContext.request.contextPath}/companies/interestCompanies">관심기업 리스트</a>
                            </div> 
                        </li>   
                        <li>
                            <a href="/member/recruitScrapList" class="nav-link link-body-emphasis border-bottom rounded-0">스크랩 공고 리스트</a>
                        </li> 
                        <li class="nav-item">
                            <a href="#" class="nav-link link-body-emphasis border-bottom rounded-0" aria-current="page">이력서</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/resume/member_mypage_resume_writeform">사이트 이력서</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/resume/member_mypage_resume_freeform">자유 이력서</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/resume/member_mypage_resume_list">이력서 리스트</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-9">
                <p class="text-secondary d-flex">
                    <a href="#" class="nav-link text-secondary">홈</a> <span class="mx-3">></span>
                    <a href="#" class="nav-link text-secondary">마이페이지</a> <span class="mx-3"></span>
                  
                </p>
            </div>
        </div>
    </div>
    <!-- 작업공간 영역 끝 -->
    <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <body class="d-flex flex-column h-100"></body>
</body>
</html>
