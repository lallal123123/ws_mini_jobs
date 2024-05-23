<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jobs 휴먼 클라우드 이력관리플렛폼</title>
<link href="/css/common.css" rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
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
    <h1>My Page</h1>
        <h2>${company.com_name} 님</h2>

        <a href="${pageContext.request.contextPath}/companies/editProfile">내 정보 수정</a>
            	<li class="nav-item">
                	<a href="/mainPage/com_mainPage" class="nav-link link-body-emphasis border-bottom rounded-0" aria-current="page">
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
                	<a href="/interest92/memInterestList" class="nav-link link-body-emphasis  border-bottom rounded-0">
                	스크랩 구직자 
                	</a>
              	</li>   
            </ul>
        </div>
    </div>
    
    <div class="col-9">
	    <p class="text-secondary d-flex">
	    	<a href="#" class="nav-link text-secondary">마이페이지</a> <span class="mx-3">></span>
	    	<a href="" class="nav-link text-black fw-bolder">My 홈</a>
	    </p>
	    <!-- 진행중인 공고 시작 -->
	    <h3>진행중인 공고</h3>
	    <a href="/company/mypage/getComRecruitList">더보기 ></a>
	    <c:forEach var="recruit" items="${recruitList }">
	        <div class="border p-3 mb-3">
	        	<div class="row align-items-center">
	        		<div class="col-md-4">
	        			<div>[ ${company.com_name } ]</div>
	        			<div class="fs-5 fw-bold w-100 text_ellipsis">
	        			<a class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="/company/mypage/recruitDetail?recruit_no=${recruit.recruit_no }">${recruit.title }</a>
	        			</div>
	        		</div>
	        		<div class="col-md-5 text-secondary">
	        		마감일 ${recruit.deadline_date }
	        		</div>
	        		<div class="col-md-3 d-flex flex-row-reverse">
	        			<c:choose>
					        <c:when test="${recruit.mem_count ne 0}">
					         	<a class="btn btn-secondary" href="">공고중</a>
					        </c:when>         
					        <c:otherwise>
					        	<a class="btn btn-jobs me-2" href="/company/mypage/recruit_modify_form?recruit_no=${recruit.recruit_no }">공고마감</a>
					        </c:otherwise>
					    </c:choose> 
	        		</div>
	        	</div>
	        </div>
        </c:forEach>
        <!-- 진행중인 공고 종료 -->
        <h3>지원 구직자 현황</h3>
        <a href="/mainPage/mem_recruit_list99">더보기 ></a>
        <c:forEach var="memRecruit" items="${memRecruitList }">
	        <div class="border p-3 mb-3">
	        	<div class="row align-items-center">
	        		<div class="col-md-4">
	        			<div class="fs-5 fw-bold w-100 text_ellipsis">
	        			<a class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="/company/mypage/getResumeDetail1?s_resume_no=${memRecruit.s_resume_no }">${memRecruit.mem_name } 이력서</a>
	        			</div>
	        		</div>
	        		<div class="col-md-5 text-secondary">
	        		
	        		</div>
	        		<div class="col-md-3 d-flex flex-row-reverse">
	        			<a href="/company/mypage/recruitDetail?recruit_no=${memRecruit.recruit_no }">공고번호 ${memRecruit.recruit_no }</a>
	        		</div>
	        	</div>
	        </div>
        </c:forEach>
        
        <h3>스크랩한 구직자 리스트</h3>
        <a href="/interest92/memInterestList">더보기 ></a>
        <c:forEach var="memInterestList" items="${list }">
	        <div class="border p-3 mb-3">
	        	<div class="row align-items-center">
	        		<div class="col-md-4">
	        			<div class="fs-5 fw-bold w-100 text_ellipsis">
	        			<a class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="/company/mypage/getResumeDetail1?s_resume_no=${memInterestList.s_resume_no }">${memInterestList.mem_name }</a>
	        			</div>
	        		</div>
	        		<div class="col-md-5 text-secondary">
	        			${memInterestList.mem_birth }
	        		</div>
	        		<div class="col-md-5 text-secondary">
	        			
	        		</div>
	        		<div class="col-md-3 d-flex flex-row-reverse">
	        		<div>
						찜하기
						${memInterestList.mem_interest_no }
						<div class="heartIcon">
							<c:if test="${memInterestList.mem_interest_no eq 1 }">
								<a
									href="/interest92/mem_notInterest?mem_no=${resume.mem_no}&recruit_no=${recruit_no}"><i
									class="bi bi-heart-fill 1"></i></a>
							</c:if>
							<c:if test="${memInterestList.mem_interest_no eq 0 }">
								<a
									href="/interest92/mem_interest?mem_no=${resume.mem_no}&recruit_no=${recruit_no}"><i
									class="bi bi-heart 0"></i></a>
							</c:if>
						</div>
					</div>
	        		</div>
	        	</div>
	        </div>
        </c:forEach>
    </div>
 </div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../../footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>