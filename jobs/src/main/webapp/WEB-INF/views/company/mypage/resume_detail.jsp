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
    <div class="col-9">
	    <p class="text-secondary d-flex">
	    	<a href="#" class="nav-link text-secondary">마이페이지</a> <span class="mx-3">></span>
	    	<a href="" class="nav-link text-black fw-bolder font-size-">이력서 상세보기</a>
	    </p>
    	
	            <div class="border p-5 rounded mb-3">
		        	<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">사진</div>
						<div class="col-md-9">
							<div class="img_box">
								<img src="/images/user/${siteMemByresume.img_url }">
							</div>
						</div>
					</div>
		  			<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">제목</div>
						<div class="col-md-9">${siteMemByresume.title}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">이름</div>
						<div class="col-md-9">${siteMemByresume.mem_name}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">생년월일</div>
						<div class="col-md-9">${siteMemByresume.mem_birth}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">전화번호</div>
						<div class="col-md-9">${siteMemByresume.mem_tel}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">이메일</div>
						<div class="col-md-9">${siteMemByresume.mem_email}</div>
					</div>
		            <div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">성별</div>
						<div class="col-md-9">${siteMemByresume.mem_gender}</div>
					</div>
		        	<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">희망직무</div>
						<div class="col-md-9">${siteMemByresume.hope_job}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">주소</div>
						<div class="col-md-9">${siteMemByresume.addr}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">지원분야</div>
						<div class="col-md-9">${siteMemByresume.part}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">병역사항</div>
						<div class="col-md-9">${siteMemByresume.military}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">기타</div>
						<div class="col-md-9">${siteMemByresume.etc}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">지원동기</div>
						<div class="col-md-9">${siteMemByresume.motive}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">성격</div>
						<div class="col-md-9">${siteMemByresume.personality}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">포부</div>
						<div class="col-md-9">${siteMemByresume.aspiration}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">성장</div>
						<div class="col-md-9">${siteMemByresume.growth}</div>
					</div>
					<div class="row mb-3 border-bottom pb-3">
						<div class="col-md-3 text-secondary">-</div>
						<div class="col-md-9">${siteMemByresume.site_res_name}</div>
					</div>
					
		        </div>
				<a href="" class="btn btn-jobs float-end mb-5">수정하기</a>
	        
       
    </div>
   
</div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../../footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>