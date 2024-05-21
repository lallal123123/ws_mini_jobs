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
	    <h1>기업정보수정</h1>
    <form action="${pageContext.request.contextPath}/companies/updateProfile" method="post">
        <div>
            <label for="com_id">아이디:</label>
            <input type="text" id="com_id" name="com_id" value="${company.com_id}" readonly/>
        </div>
        <div>
            <label for="com_pw">비밀번호:</label>
            <input type="password" id="com_pw" name="com_pw" value="${company.com_pw}" />
        </div>
        <div>
            <label for="com_name">기업명:</label>
            <input type="text" id="com_name" name="com_name" value="${company.com_name}" />
        </div>
        <div>
            <label for="com_size">기업규모:</label>
            <input type="text" id="com_size" name="com_size" value="${company.com_size}" />
        </div>
        <div>
            <label for="com_ceo">대표자:</label>
            <input type="text" id="com_ceo" name="com_ceo" value="${company.com_ceo}" />
        </div>
        <div>
            <label for="com_addr">주소:</label>
            <input type="text" id="com_addr" name="com_addr" value="${company.com_addr}" />
        </div>
        <div>
            <label for="com_companynum">사업자번호:</label>
            <input type="text" id="com_companynum" name="com_companynum" value="${company.com_companynum}" />
        </div>
        <div>
            <label for="com_tel">전화번호:</label>
            <input type="text" id="com_tel" name="com_tel" value="${company.com_tel}" />
        </div>
        <div>
            <label for="com_email">Email:</label>
            <input type="text" id="com_email" name="com_email" value="${company.com_email}" />
        </div>
        <div>
            <label for="com_url">홈페이지:</label>
            <input type="text" id="com_url" name="com_url" value="${company.com_url}" />
        </div>
        <div>
            <button type="submit">수정하기</button>
        </div>
    </form>
       
    </div>
 </div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../../footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>