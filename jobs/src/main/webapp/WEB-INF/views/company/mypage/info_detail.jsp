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
                 	<h1>My Page</h1>
            <h2>${member.com_name} 님</h2>
        <a href="${pageContext.request.contextPath}/companies/editProfile">내 정보 수정</a>
            	<li class="nav-item">
                	<a href="/companies/mypage" class="nav-link link-body-emphasis border-bottom rounded-0" aria-current="page">
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
    <div class="col-9">
	    <p class="text-secondary d-flex">
	    	<a href="#" class="nav-link text-secondary">마이페이지</a> <span class="mx-3">></span>
	    	<a href="" class="nav-link text-black fw-bolder font-size-">기업 소개 관리</a>
	    </p>
    	<c:choose>
	        <c:when test="${com_detail ne null}">
	            <div class="border p-5 rounded mb-3">
		        	<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">대표사진</div>
						<div class="col-md-9">
							<div class="img_box">
								<img src="/images/user/${comInfoDetail.img_url }">
							</div>
						</div>
					</div>
		  
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">회사명</div>
						<div class="col-md-9">${comInfoDetail.com_name}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">업종</div>
						<div class="col-md-9">${comInfoDetail.sectors}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">기업구분</div>
						<div class="col-md-9">${comInfoDetail.com_size}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">대표자</div>
						<div class="col-md-9">${comInfoDetail.com_ceo}</div>
					</div>
		            <div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">주소</div>
						<div class="col-md-9">${comInfoDetail.com_addr}</div>
					</div>
		        	<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">설립연도</div>
						<div class="col-md-9">${comInfoDetail.establishment}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">홈페이지</div>
						<div class="col-md-9">${comInfoDetail.com_url}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">기업소개</div>
						<div class="col-md-9">${comInfoDetail.introduction}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">연금보험</div>
						<div class="col-md-9">${comInfoDetail.pension}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">보상/수당/지원</div>
						<div class="col-md-9">${comInfoDetail.compensation}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">사내시설</div>
						<div class="col-md-9">${comInfoDetail.facilities}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">사내제도/성장</div>
						<div class="col-md-9">${comInfoDetail.policy}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">편의/여가/건강</div>
						<div class="col-md-9">${comInfoDetail.convenience}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">사원수</div>
						<div class="col-md-9">${comInfoDetail.p_number}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">연혁</div>
						<div class="col-md-9">${comInfoDetail.history}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">인재상</div>
						<div class="col-md-9">${comInfoDetail.ideal_talent}</div>
					</div>
		        </div>
				<a href="/company/mypage/info_modify_form" class="btn btn-jobs float-end mb-5">수정하기</a>
	        </c:when>         
	        <c:otherwise>
	           <div class="border p-5 rounded mb-3 text-center text-secondary">
	           	작성된 기업정보가 없습니다.</br> 기업정보를 작성해주세요.</br>
	           	</br>
	           	<a href="/company/mypage/info_write_form" class="btn btn-jobs">작성하기</a>
	           </div>
	         </c:otherwise>
	    </c:choose>
       
    </div>
   
</div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../../footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>