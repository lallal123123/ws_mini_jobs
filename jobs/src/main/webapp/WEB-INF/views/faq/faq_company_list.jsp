<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 고객센터</title>
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
              <li>
                	<div class="nav-link link-body-emphasis">FAQ</div>
              	</li>
              	<li class="nav-item">
	                <a href="/admin99/faqMemberList" class="nav-link link-body-emphasis">· 일반 회원</a>
	            </li>
	            <li class="nav-item">
	                <a href="/admin99/faqCompanyList" class="nav-link active" aria-current="page">· 기업 회원</a>
	            </li>
	            <li>
                	<div class="nav-link link-body-emphasis">고객센터</div>
              	</li>
            	<li class="nav-item">
	                <a href="/cs_list_99" class="nav-link link-body-emphasis">· 문의·신고</a>
	            </li>
	            <li>
                	<a href="/notice_list_99" class="nav-link link-body-emphasis">· 공지사항</a>
              	</li>
              </ul>
        </div>
    </div>
    <div class="col-9">
        <div class="border p-3">
        <p class="text-secondary d-flex">
	    	<a href="#" class="nav-link text-secondary">FAQ</a> <span class="mx-3">&gt;</span>
	    	<a href="#" class="nav-link text-black fw-bolder">기업 회원</a>
	    </p>
        	<h3 style="text-align:center;">FAQ</h3>
        	<form action="#" method="post">
			  	<select class="form-select" name="category" id="category">
			  	<option value="">전체보기</option>
			  	<option value="회원가입·정보">회원가입·정보</option>
			  	<option value="이력서 관리·활용">이력서 관리·활용</option>
			  	<option value="입사지원">입사지원</option>
			  	<option value="채용정보">채용정보</option>
			  	<option value="기타">기타</option>
			  	</select>
           		<input type="submit" class="btn btn-jobs w-100" value="검색하기">
			</form>
        	<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">번호</th>
			      <th scope="col">카테고리</th>
			      <th scope="col">제목</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
			  
			  <c:forEach var="list" items="${list }" varStatus="status">
			  	<tr>
			      <td scope="row">${status.count }</td>
			      <td>${list.category }</td>
			      <td><a href="#">${list.title }</a></td>
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
</body>
</html>