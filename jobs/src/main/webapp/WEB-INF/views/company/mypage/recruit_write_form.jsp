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
<body>
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
	    	<a href="" class="nav-link text-black fw-bolder font-size-">구인 공고 작성</a>
	    </p>
    
        <div class="border p-5 rounded">
        
        	<form>
	        	<div class="mb-5">
			  		<label for="" class="form-label">제목</label>
			  		<input type="text" class="form-control" name="title" id="title" placeholder="제목">
				</div>
				<h4 class="mt-2 fs-5">지원자격</h4>
				<div class="mb-3">
			  		<label for="" class="form-label">경력</label>
			  		<input type="text" class="form-control" name="title" id="title" placeholder="경력">
				</div>
				<div class="mb-3">
			  		<label for="" class="form-label">학력</label>
			  		<input type="text" class="form-control" name="title" id="title" placeholder="학력">
				</div>
				<div class="mb-5">
			  		<label for="" class="form-label">스킬</label>
			  		<input type="text" class="form-control" name="title" id="title" placeholder="스킬">
				</div>
				
				<h4 class="mt-2 fs-5">근무조건</h4>
				<div class="mb-3">
			  		<label for="" class="form-label">근무형태</label>
			  		<select class="form-select" name="title" id="title">
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
			  		<input type="text" class="form-control" name="title" id="title" placeholder="급여">
				</div>
				<div class="mb-3">
			  		<label for="" class="form-label">지역</label>
			  		<select class="form-select" name="title" id="title">
				  		<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="인천">인천</option>
						<option value="대전">대전</option>
						<option value="세종">세종</option>
						<option value="충남">충남</option>
						<option value="충북">충북</option>
						<option value="광주">광주</option>
						<option value="전남">전남</option>
						<option value="전북">전북</option>
						<option value="대구">대구</option>
						<option value="경북">경북</option>
						<option value="부산">부산</option>
						<option value="울산">울산</option>
						<option value="경남">경남</option>
						<option value="강원">강원</option>
						<option value="제주">제주</option>
						<option value="전국">전국</option>
			  		</select>
				</div>
				<div class="mb-3">
			  		<label for="" class="form-label">시간</label>
			  		<input type="text" class="form-control" name="title" id="title" placeholder="시간">
				</div>
				<div class="mb-5">
			  		<label for="" class="form-label">모집인원</label>
			  		<input type="number" class="form-control" name="title" id="title" placeholder="모집인원">
				</div>
				
				<h4 class="mt-2 fs-5">상세요건</h4>
				<div class="mb-3">
			  		<label for="" class="form-label">자격요건</label>
			  		<textarea class="form-control" name="title" id="title" placeholder="자격요건를 자세히 적어주세요"></textarea>
				</div>
				<div class="mb-3">
			  		<label for="" class="form-label">전형절차</label>
			  		<textarea class="form-control" name="title" id="title" placeholder="전형절차를 자세히 적어주세요"></textarea>
				</div>
				<div class="mb-3">
			  		<label for="" class="form-label">유의사항</label>
			  		<textarea class="form-control" name="title" id="title" placeholder="유의사항을 자세히 적어주세요"></textarea>
				</div>
				<input type="button" class="btn btn-jobs w-100"  value="저장하기">
        
        	</form>
        </div>
    </div>
   
</div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../../footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>