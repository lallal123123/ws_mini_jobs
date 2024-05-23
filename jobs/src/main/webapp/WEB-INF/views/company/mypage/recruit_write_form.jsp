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
        	<div class="text-center mb-2">${company.com_name} 님</div>

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
	    	<a href="#" class="nav-link text-secondary">마이페이지</a> <span class="mx-3">></span>
	    	<a href="#" class="nav-link text-secondary">채용 공고 관리</a> <span class="mx-3">></span>
	    	<a href="" class="nav-link text-black fw-bolder font-size-">채용 공고 작성</a>
	    </p>
    
        <div class="border p-5 rounded">
        
        	<form id="recruit_write_form" action="/company/mypage/registRecruit" method="post" onsubmit="return numberCheck()">
        		<input type="hidden" name="com_no" value="${company.com_no }">
        		<div class="mb-3">
			  		<label for="" class="form-label">공고제목</label>
			  		<input type="text" class="form-control" name="title" id="title" placeholder="공고제목">
				</div>
	        	<div class="mb-3">
			  		<label for="" class="form-label">공고 마감일</label>
			  		<input type="date" class="form-control" name="deadline_date" id="deadline_date" placeholder="ex)2024-00-00">
				</div>
				<div class="mb-5">
			  		<label for="" class="form-label">직급</label>
			  		<input type="text" class="form-control" name="rank" id="rank" placeholder="직급">
				</div>
				<h4 class="mt-2 fs-5">지원자격</h4>
				<div class="mb-3">
			  		<label for="" class="form-label">경력</label>
			  		<input type="text" class="form-control" name="career" id="career" placeholder="경력">
				</div>
				<div class="mb-3">
			  		<label for="" class="form-label">학력</label>
			  		<input type="text" class="form-control" name="education " id="education " placeholder="학력">
				</div>
				<div class="mb-5">
			  		<label for="" class="form-label">스킬</label>
			  		<input type="text" class="form-control" name="skill " id="skill " placeholder="스킬">
				</div>
				
				<h4 class="mt-2 fs-5">근무조건</h4>
				<div class="mb-3">
			  		<label for="" class="form-label">고용형태</label>
			  		<select class="form-select" name="field" id="field">
				  		<option value="정규직">정규직</option>
						<option value="계약직">계약직</option>
						<option value="인턴">인턴</option>
						<option value="파견직">파견직</option>
						<option value="도급">도급</option>
						<option value="프리랜서">프리랜서</option>
						<option value="아르바이트">아르바이트</option>
						<option value="연수생/교육생">연수생/교육생</option>
						<option value="병역특례">병역특례</option>
						<option value="위촉직/개인사업자">위촉직/개인사업자</option>
			  		</select>
				</div>
				<div class="mb-3">
			  		<label for="" class="form-label">급여</label>
			  		<input type="number" class="form-control" name="pay" id="pay" placeholder="급여">
				</div>
				<div class="mb-3">
			  		<label for="" class="form-label">지역</label>
			  		
			  		<select class="form-select" name="location" id="location">
				  		<c:forEach var="region" items="${regionList}">
				  			<option value="${region.region_name}">${region.region_name}</option>
				  		</c:forEach>
			  		</select>
			  		
				</div>
				<div class="mb-3">
			  		<label for="" class="form-label">시간</label>
			  		<input type="text" class="form-control" name="working_time" id="working_time" placeholder="시간">
				</div>
				<div class="mb-5">
			  		<label for="" class="form-label">모집인원</label>
			  		<input type="number" class="form-control" name="p_number" id="p_number" placeholder="모집인원">
				</div>
				
				<h4 class="mt-2 fs-5">상세요건</h4>
				<div class="mb-3">
			  		<label for="" class="form-label">자격요건</label>
			  		<textarea class="form-control" name="qualification" id="qualification" placeholder="자격요건를 자세히 적어주세요"></textarea>
				</div>
				<div class="mb-3">
			  		<label for="" class="form-label">전형절차</label>
			  		<textarea class="form-control" name="seprocedure" id="seprocedure" placeholder="전형절차를 자세히 적어주세요"></textarea>
				</div>
				<div class="mb-3">
			  		<label for="" class="form-label">복지</label>
			  		<textarea class="form-control" name="welfare" id="welfare" placeholder="복지내용을 자세히 적어주세요"></textarea>
				</div>
				<div class="mb-3">
			  		<label for="" class="form-label">유의사항</label>
			  		<textarea class="form-control" name="notice" id="notice" placeholder="유의사항을 자세히 적어주세요"></textarea>
				</div>
				<input type="submit" class="btn btn-jobs w-100"  value="저장하기">
        
        	</form>
        </div>
    </div>
   
</div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../../footer.jsp"></jsp:include>
<script>
const info_write_form=document.querySelector("#recruit_write_form");
const pay=document.querySelector("#pay");
const p_number=document.querySelector("#p_number");
const deadline_date=document.querySelector("#deadline_date");

function numberCheck(){
	
	if(pay.value.length == 0){
		pay.value = 0;
	}
	if(p_number.value.length == 0){
		p_number.value = 0;
	}
	//alert(establishment.value);
	//alert(p_number.value);
	if(deadline_date.value.length == 0){
		 alert("마감일을 등록해주세요");
		return false;
	}
	return true;
};
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>