<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구직자 고객센터</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet">
</head>
<body class="d-flex flex-column h-100" data-logged-in="${sessionScope.loggedInMember != null}">
<jsp:include page="../header.jsp"></jsp:include>
<!-- 작업공간 영역 -->
<div class="container">
<div class="row">
    <div class="col-3">
        <div class="border p-3">
            <ul class="nav nav-pills flex-column mb-auto">
            <!-- 여기에 메뉴를 나열해주세요 -->
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
	    	<a href="#" class="nav-link text-secondary">고객센터</a> <span class="mx-3">></span>
	    	<a href="" class="nav-link text-black fw-bolder">문의·신고</a>
	    </p>

        <div class="border p-5">
        	<div class="overflow-auto">
	        	<form class="d-flex float-end" action="/csSearchData_99">
			      <input class="form-control me-2" value="${searchData }" type="search" name="searchData" placeholder="제목 검색" aria-label="제목 검색" style="width: 150px;">
			      <button class="btn btn-light" type="submit">검색</button>
			    </form>
			    <form class="d-flex float-start" action="/csCategory_99" method="post">
				  	<select class="form-select" name="category" id="category">
				  	<option value="">전체보기</option>
				  	<option value="서비스 이용 문의">서비스 이용 문의</option>
				  	<option value="불량정보·오류 신고">불량정보·오류 신고</option>
				  	<option value="서비스 제안·칭찬">서비스 제안·칭찬</option>
				  	<option value="커뮤니티 관련사항">커뮤니티 관련사항</option>
				  	</select>
	           		<input type="submit" class="btn btn-jobs" value="검색하기">
				</form>
			</div>
        	<a class="btn btn-outline-primary mt-3" href="../write_Form_99" role="button" onclick="return isLoggedIn()">문의·신고 글 작성하기</a>
        	<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">번호</th>
			      <th scope="col">카테고리</th>
			      <th scope="col">제목</th>
			      <th scope="col">작성일</th>
			      <th scope="col">답변여부</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
			  
			  <c:forEach var="csList" items="${list }" varStatus="status">
			  	<tr>
			      <td scope="row">${status.count }</td>
			      <td>${csList.category }</td>
				  <td><a href="../cs_detail_99?cs_no=${csList.cs_no}">${csList.title }</a></td>
			      <td>
			      	<fmt:formatDate value="${list.reg_date }" pattern="yyyy-MM-dd"/>
			      </td>
			      <td>${ }</td>
			    </tr>
			  </c:forEach>
			  </tbody>
			</table>
        </div>
    </div>
</div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="../js/csScript.js"></script>
</body>
</html>