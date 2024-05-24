<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jobs 휴먼 클라우드 이력관리플렛폼</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet">
</head>
<body class="d-flex flex-column h-100">
<jsp:include page="../header.jsp"></jsp:include>
<!-- 작업공간 영역 -->
<div class="container">
<div class="row">
    <div class="col-3">
        <div class="border p-3">
            <ul class="nav nav-pills flex-column mb-auto">
            <!-- 여기에 메뉴를 나열해주세요 -->
     			<!-- 여기에 메뉴를 나열해주세요 -->
              <li class="nav-item">
                <a href="../admin99/getTotalRegistrations" class="nav-link link-body-emphasis">
                  My home
                </a>
              </li>
              <li>
                <a href="/admin/members" class="nav-link link-body-emphasis">
                 개인회원 관리
                </a>
              </li>
              <li>
                <a href="/admin/companies" class="nav-link link-body-emphasis">
                 기업회원 관리
                </a>
              </li> 
              <li>
                <a href="../admin99/cs_list_99" class="nav-link link-body-emphasis">
                 고객센터 관리
                </a>
              </li> 
              <li>
                <a href="../admin99/notice_list_99" class="nav-link active" aria-current="page">
                 공지사항 관리
                </a>
              </li>
              <li>
                <a href="../admin99/faqList" class="nav-link link-body-emphasis">
                 FAQ 관리
                </a>
              </li>
              <li>
                <a href="#" class="nav-link link-body-emphasis">
                 신고 접수된 건
                </a>
              </li>
            </ul>
        </div>
    </div>
    
    <div class="col-9">
    	<p class="text-secondary d-flex">
	    	<a href="#" class="nav-link text-secondary">관리자 모드</a> <span class="mx-3">></span>
	    	<a href="" class="nav-link text-black fw-bolder">공지사항 관리</a>
	    </p>
    	<div class="border p-5">
		  <div class="overflow-auto">
		    <form class="d-flex float-end" action="/noticeSearchData_99">
		      <input class="form-control me-2"  value="${searchData }" type="search" placeholder="제목 검색" aria-label="제목 검색" style="width: 150px;">
		      <button class="btn btn-light" type="submit">검색</button>
		    </form>
		    <form class="d-flex float-start" action="/noticeCategory_99" method="post">
			  	<select class="form-select" name="category" id="category">
			  	<option value="">전체보기</option>
			  	<option value="공지">공지</option>
			  	<option value="서비스 오픈">서비스 오픈</option>
			  	</select>
           		<input type="submit" class="btn btn-jobs" value="검색하기">
			</form>
		  </div>
        	<a class="btn btn-outline-primary mt-3" href="../admin99/notice_write_form_99" role="button" onclick="return isLoggedIn()">공지사항 작성하기</a>
        	<table class="table jobs-table">
			  <thead>
			    <tr>
			      <th scope="col">번호</th>
			      <th scope="col">카테고리</th>
			      <th scope="col">제목</th>
			      <th scope="col">작성일</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
			  
			  
							  <!-- 리스트 크기 계산 -->
				<c:set var="totalCount" value="${fn:length(list)}" />
				
				<!-- 역순 번호 매기기 -->
				<c:forEach var="item" items="${list}" varStatus="status">
				    <tr class="border-bottom">
				        <td scope="row">${totalCount - status.count + 1}</td>
				        <td>${item.category}</td>
				        <td><a href="../admin99/notice_detail_99?notice_no=${item.notice_no}">${item.title}</a></td>
				        <td>
				            <fmt:formatDate value="${item.reg_date}" pattern="yyyy-MM-dd"/>
				        </td>
				    </tr>
				</c:forEach>
			  		  
			  <!-- 
			  <c:forEach var="list" items="${list }" varStatus="status">
			  	<tr class="border-bottom">
			      <td scope="row">${status.count }</td>
			      <td>${list.category }</td>
				  <td><a href="../admin99/notice_detail_99?notice_no=${list.notice_no }">${list.title }</a></td>
			      <td>
			      	<fmt:formatDate value="${list.reg_date }" pattern="yyyy-MM-dd"/>
			      </td>
			    </tr>
			  </c:forEach> -->
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