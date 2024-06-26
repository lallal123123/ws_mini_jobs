<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<jsp:include page="../../header.jsp"></jsp:include>
<!-- 작업공간 영역 -->
<div class="container">
<div class="row">
	<div class="col-3">
        <div class="border p-3 rounded">
            <ul class="nav nav-pills flex-column mb-auto">
            <!-- 여기에 메뉴를 나열해주세요 -->
            	<li class="nav-item">
                	<a href="#" class="nav-link link-body-emphasis border-bottom rounded-0" aria-current="page">
                  	My 홈
                	</a>
              	</li>
              	<li>
                	<a href="#" class="nav-link link-body-emphasis  border-bottom rounded-0">
                 	기업 소개 관리
                	</a>
              	</li> 
              	<li>
              		<div class="accordion" id="accordionPanelsStayOpenExample">
			      		<a class="nav-link link-body-emphasis text-weight-bold border-bottom rounded-0" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
			        		구인 공고 관리
			      		</a>
			   	  		<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
			      			<div class="accordion-body py-0 pe-0">
			       				<a href="#" class="d-block nav-link link-body-emphasis border-bottom rounded-0">구인 공고 리스트</a>
			       				<a href="#" class="d-block nav-link link-body-emphasis border-bottom rounded-0">구인 공고 작성</a>
			      			</div>
			    		</div>
			 		</div> 
              	</li>   
              	<li>
                	<a href="#" class="nav-link link-body-emphasis  border-bottom rounded-0">
                	스크랩 구직자 
                	</a>
              	</li>   
            </ul>
        </div>
    </div>
    <div class="col-9">
	    <p class="text-secondary d-flex">
	    	<a href="#" class="nav-link text-secondary">마이페이지</a> <span class="mx-3">></span>
	    	<a href="#" class="nav-link text-secondary">구인 공고 관리</a> <span class="mx-3">></span>
	    	<a href="" class="nav-link text-black fw-bolder">구인 공고 작성</a>
	    </p>
    
        <div class="border p-5 rounded">
        
        	<c:forEach var="comInfoJoinRecruit" items="${comInfoJoinRecruitAllList }">
	        <div class="border p-3">
	        	<div class="row">
	        		<div class="col-md-4">
	        			<div>공고번호 :${comInfoJoinRecruit.recruit_no } </div>
	        			<div>회사명 : ${comInfoJoinRecruit.com_name }</div>
	        			<div>공고제목 : ${comInfoJoinRecruit.title }</div>
	        		</div>
	        		<div class="col-md-4">
	        				정규직
	        				학력무관
	        				회사내규에 따름
	        				주소
	        				마감일
	        				현재 지원자 <a href="#"></a>
	        		</div>
	        		<div class="col-md-4">
	        			<a class="btn btn-secondary" href="">공고 마감하기</a>
	        		</div>
	        		<div></div>
	        	</div>
	        </div>
        	</c:forEach>>
        </div>
    </div>
</div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../../footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>