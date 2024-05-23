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
                <a href="../admin99/notice_list_99" class="nav-link link-body-emphasis">
                 공지사항 관리
                </a>
              </li>
              <li>
                <a href="../admin99/faqList" class="nav-link active" aria-current="page">
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
        <div class="border p-3">
        <p class="text-secondary d-flex">
	    	<a href="#" class="nav-link text-secondary">마이페이지</a> <span class="mx-3">&gt;</span>
	    	<a href="#" class="nav-link text-black fw-bolder">FAQ 관리</a>
	    </p>
        	<h3 style="text-align:center;">FAQ 목록</h3>
        	<form action="../csCategory_99" method="post">
			  	<select class="form-select" name="category" id="category">
			  	<option value="">전체보기</option>
			  	<option value="서비스 이용 문의">서비스 이용 문의</option>
			  	<option value="불량정보·오류 신고">불량정보·오류 신고</option>
			  	<option value="서비스 제안·칭찬">서비스 제안·칭찬</option>
			  	<option value="커뮤니티 관련사항">커뮤니티 관련사항</option>
			  	</select>
           		<input type="submit" class="btn btn-jobs w-100" value="검색하기">
			</form>
        	<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">번호</th>
			      <th scope="col">카테고리</th>
			      <th scope="col">제목</th>
			      <th scope="col">작성일</th>
			      <th scope="col">답변 여부</th>			      
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
			  
			  <c:forEach var="list" items="${list }" varStatus="status">
			  	<tr>
			      <td scope="row">${status.count }</td>
			      <td>${list.category }</td>
			      <td>
			      	<c:choose>
			      		<c:when test="${list.answerStatus == '미답변' }">
			      			<a href="../admin99/cs_detail_99?cs_no=${list.cs_no}">${list.title}</a></td>
			      		</c:when>
			      		<c:otherwise>
			      			<a href="../admin99/cs_request_detail_99?cs_no=${list.cs_no }">${list.title}</div><a href=""></a>
			      		</c:otherwise>
			      	</c:choose>
			      <td>
			      	<fmt:formatDate value="${list.reg_date }" pattern="yyyy-MM-dd"/>
			      </td>
			      <td>
			      	<c:choose>
			      		<c:when test="${list.answerStatus == '미답변' }">
			      			<a class="btn btn-light" href="../admin99/cs_detail_99?cs_no=${list.cs_no }" role="button">답변 등록하기</a>
			      		</c:when>
			      		<c:otherwise>
			      			<div class="btn btn-light" role="button">답변 완료</div>
			      		</c:otherwise>
			      	</c:choose>
			      </td>
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