<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jobs 휴먼 클라우드 이력관리플렛폼</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet">
</head>
<body class="d-flex flex-column h-100">
    <jsp:include page="../header.jsp"></jsp:include>
    <!-- 작업공간 영역 -->
    <div class="container">
        <div class="row">
            <!-- 사이드빠 CSS -->
            <jsp:include page="../mypagesidebar.jsp"></jsp:include>
            
            <div class="col-9">
                <div class="border p-3">
                <!-- 작업시작 -->
                         
                 <div class="border p-5 rounded">
                 <h2>사이트 이력서</h2>
                    
                    <!-- 검색창 -->
                    
                          
                    <!-- 검색창 --> 
                    <c:forEach var="siteList" items="${siteList}">
                    <div class="border p-2 mb-2">
                        <div class="row align-items-center">
                            <div class="col-md-4">
                                <div>이력서 제목 :${siteList.title } </div>
                            </div>
                            <div class="col-md-5 text-secondary">
                            <div class="col-md-3 d-flex flex-row-reverse">
                                <c:choose>        
                                    <c:when test="${not empty siteList.title}">
                                        <a class="btn btn-secondary" href="/resume/member_mypage_resume_sitelist?s_resume_no=${siteList.s_resume_no }">삭제</a>
                                        <a class="btn btn-jobs me-2" href="">수정</a>
                                    </c:when>
                                 
                                </c:choose> 
                            </div>
                            <div>
                            </div>
                        </div>
                    </div></div>
                    </c:forEach>
                </div>
                                
               <div class="border p-5 rounded">
                <h2>자유양식 이력서</h2>
                                          
                <c:forEach var="freeList" items="${freeList}">
                    <div class="border p-2 mb-2">
                        <div class="row align-items-center">
                            <div class="col-md-4">
                                <div>이력서 제목 :${freeList.title } </div>
                            </div>
                            <div class="col-md-5 text-secondary">
                            <div class="col-md-3 d-flex flex-row-reverse">
                                <c:choose>        
                                    <c:when test="${not empty freeList.title}">
                                        <a class="btn btn-secondary" href="/resume/member_mypage_resume_freedelete?r_resume_no=${freeList.r_resume_no }">삭제</a>
                                        <a class="btn btn-jobs me-2" href="">수정</a>
                                    </c:when>
                                </c:choose> 
                            </div>
                            <div>
                            </div>
                        </div>
                    </div>
                    </div>
                    </c:forEach>
                

                <!-- 작업끝 -->
                </div>
            </div>

        </div>
    </div>
    <!-- 작업공간 영역 끝 -->
    <jsp:include page="../footer.jsp"></jsp:include>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
