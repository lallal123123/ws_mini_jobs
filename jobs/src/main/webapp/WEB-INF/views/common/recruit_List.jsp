<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="col-12">
        <div class="border p-3">               
        
        <c:forEach var="recruit" items="${recruitList }">
	        <div class="border p-3 mb-3">
	        	<div class="row align-items-center">
	        		<div class="col-md-4">
	        			<div class="fs-7 text-secondary"> (회사명이 들어가야함) </div>
	        			<div>[ ${company.com_name } ] 사원모집</div>
	        			<div class="fs-5 fw-bold w-100 text_ellipsis">
	        			<a class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="/company/mypage/recruitDetail?recruit_no=${recruit.recruit_no }">${recruit.title }</a>
	        			</div>
	        		</div>
	        		<div class="col-md-5 text-secondary">
	        		${recruit.field } | 
	        		<c:choose>
				        <c:when test="${recruit.education ne null }">
				           ${recruit.education } | 
				        </c:when>         
				        <c:otherwise>
				          학력무관 | 
				        </c:otherwise>
				    </c:choose>
				    <c:choose>
				        <c:when test="${recruit.pay ne 0 }">
				          ${recruit.pay } |<br/>
				        </c:when>         
				        <c:otherwise>
				          회사내규에 따름 |<br/>
				        </c:otherwise>
				    </c:choose> 
				    <c:choose>
				        <c:when test="${company.com_addr ne null }">
				          ${company.com_addr } | 
				        </c:when>         
				    </c:choose>      		
	        		마감일 ${recruit.deadline_date } <br/>
	        		현재 지원자 <a class="link-info fw-bold" href="/company/mypage/mem_recruit_list?recruit_no=${recruit.recruit_no }">${recruit.mem_count }</a>
	        		</div>
	        		<div class="col-md-3 d-flex flex-row-reverse">
	        			<c:choose>
					        <c:when test="${recruit.mem_count ne 0}">
					         	<a class="btn btn-secondary" href="">공고 보러가기</a>
					        </c:when>         
					        <c:otherwise>
					        	<a class="btn btn-secondary" href="/company/mypage/deleteRecruit?recruit_no=${recruit.recruit_no }">삭제</a>
					        	
					        </c:otherwise>
					    </c:choose> 
	        		</div>
	        		<div></div>
	        	</div>
	        </div>
        	</c:forEach>
        
        
        
        
        
        
        
        
        </div>
    </div>
</div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>