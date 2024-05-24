<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jobs 휴먼 클라우드 이력관리플렛폼</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet">
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
        	<div class="text-center mb-2">${sessionScope.loggedInCompany.com_name} 님</div>

        	<a class="btn btn-jobs" href="${pageContext.request.contextPath}/companies/editProfile">내 정보 수정</a>
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
			<div class="col-9 mb-5">
				<p class="text-secondary d-flex">
					<a href="#" class="nav-link text-secondary">마이페이지</a> <span
						class="mx-3">></span> <a href="#" class="nav-link text-secondary">채용
						공고 관리</a> <span class="mx-3">></span> <a href=""
						class="nav-link text-black fw-bolder">지원자 현황</a>
				</p>

				<div class="border p-5 rounded">
					<div class="overflow-hidden mb-3">
						<div class="input-group search-box float-end">
							<input type="text" class="form-control" placeholder="제목 검색"
								aria-label="제목 검색" id="keyword" aria-describedby="getSearchList">
							<button class="btn btn-outline-secondary" type="button"
								onclick="getSearchList()">검색</button>
						</div>
					</div>
					<c:forEach var="resume" items="${list }">
						<div class="border p-3 mb-3">
							<div class="row align-items-center">
								<div class="col-md-4">
									<div class="fs-5 fw-bold w-100 text_ellipsis">
										${resume.title }</div>
								</div>
								<div class="col-md-5 text-secondary">${resume.mem_name } |
									${resume.mem_gender } | ${resume.mem_birth }
									<div>
										찜하기
										<span class="heartIcon">
											<c:if test="${resume.interest eq 1 }">
												<a
													href="/interest92/mem_notInterest?mem_no=${resume.mem_no}&recruit_no=${recruit_no}"><i
													class="bi bi-heart-fill 1"></i></a>
											</c:if>
											<c:if test="${resume.interest eq 0 }">
												<a
													href="/interest92/mem_interest?mem_no=${resume.mem_no}&recruit_no=${recruit_no}"><i
													class="bi bi-heart 0"></i></a>
											</c:if>
										</span>
									</div>	
								</div>
								
								<div class="col-md-3 d-flex flex-row-reverse">
									<a
										href="/company/mypage/getResumeDetail?s_resume_no=${resume.s_resume_no }&mem_recruit_no=${resume.mem_recruit_no }"
										class="btn btn-info text-white">이력서 보기</a>
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
	<script>



</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>