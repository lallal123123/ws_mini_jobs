<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <div class="col-3">
        <div class="border p-3">
             <ul class="nav nav-pills flex-column mb-auto">
            <!-- 여기에 메뉴를 나열해주세요 -->
            	<li>
                	<div class="nav-link link-body-emphasis">FAQ</div>
              	</li>
              	<li class="nav-item">
	                <a href="../admin99/faqMemberList" class="nav-link link-body-emphasis">· 일반 회원</a>
	            </li>
	            <li class="nav-item">
	                <a href="../admin99/faqCompanyList" class="nav-link link-body-emphasis">· 기업 회원</a>
	            </li>
	            <li>
                	<div class="nav-link link-body-emphasis">고객센터</div>
              	</li>
            	<li class="nav-item">
	                <a href="../cs_list_99" class="nav-link link-body-emphasis" aria-current="page">· 문의·신고</a>
	            </li>
	            <li>
                	<a href="../notice_list_99" class="nav-link active">· 공지사항</a>
              	</li>
            </ul>
        </div>
    </div>
    <div class="col-9">
        <div class="border p-5">
        	<div id="category">#${dto.category }</div>
        	<div class="fs-5 fw-bold my-3" id="title">${dto.title }</div>
        	<div class="py-3 border-top border-bottom mb-3" id="content">${dto.content }</div>
        	<c:if test="${mem_no == '4'}">
        		<a class="btn btn-light" href="../admin99/notice_modify_form?notice_no=${dto.notice_no }" role="button">수정</a>
        		<a class="btn btn-light" href="../admin99/noticeDelete_99?notice_no=${dto.notice_no }" role="button">삭제</a>
        	</c:if>
        	
        	<a class="btn btn-light" href="../notice_list_99" role="button">이전</a>
        	<a class="btn btn-light" href="#" role="button">TOP</a>
        </div>
    </div>
    
</div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>