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
                	<a href="/company/mypage/info_detail" class="nav-link link-body-emphasis  border-bottom rounded-0">
                 	기업 소개 관리
                	</a>
              	</li> 
              	<li>
              		<div class="accordion" id="accordionPanelsStayOpenExample">
			      		<a class="nav-link link-body-emphasis text-weight-bold border-bottom rounded-0" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
			        		채용 공고 관리
			      		</a>
			   	  		<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
			      			<div class="accordion-body py-0 pe-0">
			       				<a href="/company/mypage/getComRecruitList" class="d-block nav-link link-body-emphasis border-bottom rounded-0">채용 공고 리스트</a>
			       				<a href="/company/mypage/recruit_write_form" class="d-block nav-link link-body-emphasis border-bottom rounded-0">채용 공고 작성</a>
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
    <div class="col-9 mb-5">
	    <p class="text-secondary d-flex">
	    	<a href="#" class="nav-link text-secondary">마이페이지</a> <span class="mx-3">></span>
	    	<a href="#" class="nav-link text-secondary">채용 공고 관리</a> <span class="mx-3">></span>
	    	<a href="" class="nav-link text-black fw-bolder">채용 공고 작성</a>
	    </p>
    
        <div class="border p-5 rounded">
        	<a class="btn btn-jobs mb-2" href="/company/mypage/recruit_write_form">채용 공고 작성</a>
        	<c:forEach var="recruit" items="${recruitList }">
	        <div class="border p-3 mb-3">
	        	<div class="row align-items-center">
	        		<div class="col-md-4">
	        			<div class="fs-7 text-secondary" id=${recruit.recruit_no } >공고번호 :${recruit.recruit_no } </div>
	        			<div>[ ${company.com_name } ]</div>
	        			<div class="fs-5 fw-bold w-100 text_ellipsis">${recruit.title }</div>
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
	        		현재 지원자 <a class="link-info fw-bold" href="#">${recruit.mem_count }</a>
	        		</div>
	        		<div class="col-md-3 d-flex flex-row-reverse">
	        			<c:choose>
					        <c:when test="${recruit.mem_count ne 0}">
					         	<a class="btn btn-secondary" href="">공고 마감하기</a>
					        </c:when>         
					        <c:otherwise>
					        	<a class="btn btn-secondary" href="">삭제</a>
					        	<a class="btn btn-jobs me-2" href="">수정</a>
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
<jsp:include page="../../footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>