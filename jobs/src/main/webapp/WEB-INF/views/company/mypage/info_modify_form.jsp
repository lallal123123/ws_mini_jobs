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
    <div class="col-9 mb-5">
	    <p class="text-secondary d-flex">
	    	<a href="#" class="nav-link text-secondary">마이페이지</a> <span class="mx-3">></span>
	    	<a href="#" class="nav-link text-secondary">기업 소개 관리</a> <span class="mx-3">></span>
	    	<a href="" class="nav-link text-black fw-bolder font-size-">기업 소개 수정</a>
	    </p>
    
        <div class="border p-5 rounded">
        
        	<form id="info_modify_form" action="/company/mypage/infoModify" method="post" enctype="multipart/form-data" onsubmit="return numberCheck()">
        		<input type="hidden" name="com_no" value="${comInfoDetail.com_no}">
				<div class="mb-3">
					<label for="" class="form-label">소개글</label>
					<textarea class="form-control" name="introduction" id="introduction" placeholder="기업에 대한 소개글을 작성해주세요">${comInfoDetail.introduction}</textarea>
			 	</div>
				
				<div class="mb-3">
					<label for="" class="form-label">업종</label>
					<select class="form-select" name="sectors" id="sectors" value="${comInfoDetail.sectors}">
						<option value="서비스업">서비스업</option>
					  	<option value="금융·은행업">금융·은행업</option>
					  	<option value="IT·정보통신업">IT·정보통신업</option>
					  	<option value="판매·유통업">판매·유통업</option>
					  	<option value="제조·생산·화학업">제조·생산·화학업</option>
					  	<option value="교육업">교육업</option>
					  	<option value="건설업">건설업</option>
					 	<option value="의료·제약업">의료·제약업</option>
					  	<option value="미디어·광고업">미디어·광고업</option>
					  	<option value="문화·예술·디자인업">문화·예술·디자인업</option>
					  	<option value="기관·협회">기관·협회</option>
					</select>
			  </div>
				<div class="mb-3">
					<label for="" class="form-label">연금보험</label>
					<textarea class="form-control" name="pension" id="pension" placeholder="의무가입하는 연금보험 내용을 작성해주세요">${comInfoDetail.pension}</textarea>
			 	</div>
				<div class="mb-3">
					<label for="" class="form-label">보수/지원/수당</label>
					<textarea class="form-control" name="compensation" id="compensation" placeholder="보수/지원/수당 내용을 작성해주세요">${comInfoDetail.compensation}</textarea>
			 	</div>
				<div class="mb-3">
					<label for="" class="form-label">사내시설</label>
					<textarea class="form-control" name="facilities" id="facilities" placeholder="사내시설에 대해 작성해주세요">${comInfoDetail.facilities}</textarea>
			 	</div>
				<div class="mb-3">
					<label for="" class="form-label">사내제도/성장</label>
					<textarea class="form-control" name="policy" id="policy" placeholder="사내제도/성장에 대해 작성해주세요">${comInfoDetail.policy}</textarea>
			 	</div>
				 <div class="mb-3">
					<label for="" class="form-label">편의/여가/건강</label>
					<textarea class="form-control" name="convenience" id="convenience" placeholder="편의/여가/건강에 대해 작성해주세요">${comInfoDetail.convenience}</textarea>
			 	</div>
				 <div class="mb-3">
					<label for="" class="form-label">설립연도</label>
					<input type="number" class="form-control" name="establishment" id="establishment" placeholder="설립연도" value="${comInfoDetail.establishment}">
			 	</div>
        		<div class="mb-3">
			  		<label for="" class="form-label">사원수</label>
			  		<input type="number" class="form-control" name="p_number" id="p_number" placeholder="사원수" value="${comInfoDetail.p_number}">
				</div>
				<div class="mb-3">
					<label for="" class="form-label">연혁</label>
					<textarea class="form-control" name="history" id="history" placeholder="연혁 내용을 작성해주세요">${comInfoDetail.history}</textarea>
			 	</div>
				 <div class="mb-3">
					<label for="" class="form-label">인재상</label>
					<textarea class="form-control" name="ideal_talent" id="ideal_talent" placeholder="인재상에 대해 작성해주세요">${comInfoDetail.ideal_talent}</textarea>
			 	</div>
				
				<input type="submit" class="btn btn-jobs w-100"  value="수정하기">
        
        	</form>
        </div>
    </div>
   
</div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../../footer.jsp"></jsp:include>
<script>
const info_write_form=document.querySelector("#info_modify_form");
const establishment=document.querySelector("#establishment");
const p_number=document.querySelector("#p_number");

function numberCheck(){
	
	if(establishment.value.length == 0){
		establishment.value = 0;
	}
	if(p_number.value.length == 0){
		p_number.value = 0;
	}
	//alert(establishment.value);
	//alert(p_number.value);
	
};
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>