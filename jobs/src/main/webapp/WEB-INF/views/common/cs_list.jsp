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
	                <a href="../cs_list_99" class="nav-link active" aria-current="page">문의·신고</a>
	            </li>
	            <li>
                	<a href="../notice_list_99" class="nav-link link-body-emphasis">공지사항</a>
              	</li>
            </ul>
        </div>
    </div>
    <div class="col-9">
        <div class="border p-3">
        	<h3 style="text-align:center;">고객센터</h3>
        	<form class="d-flex" action="/csSearchData_99">
		      <input class="form-control me-2" value="${searchData }" type="search" name="searchData" placeholder="Search" aria-label="Search" style="width: 150px;">
		      <button class="btn btn-light" type="submit">Search</button>
		    </form>
		    <form action="/csCategory_99" method="post">
			  	<select class="form-select" name="category" id="category">
			  	<option value="">전체보기</option>
			  	<option value="서비스 이용 문의">서비스 이용 문의</option>
			  	<option value="불량정보·오류 신고">불량정보·오류 신고</option>
			  	<option value="서비스 제안·칭찬">서비스 제안·칭찬</option>
			  	<option value="커뮤니티 관련사항">커뮤니티 관련사항</option>
			  	</select>
           		<input type="submit" class="btn btn-jobs w-100" value="검색하기">
			</form>
        	<a class="btn btn-light" href="../write_Form_99" role="button" onclick="return isLoggedIn()">문의·신고 글 작성하기</a>
        	<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">번호</th>
			      <th scope="col">카테고리</th>
			      <th scope="col">제목</th>
			      <th scope="col">작성일</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
			  
			  <c:forEach var="list" items="${list }" varStatus="status">
			  	<tr>
			      <td scope="row">${status.count }</td>
			      <td>${list.category }</td>
				  <c:choose>
				  	<c:when test="${mem_no == '3' }">
					  	<td><a href="../cs_detail_99?cs_no=${list.cs_no}">${list.title}</a></td>
					</c:when>
					<c:when test="${list.ch_private == false and list.mem_no ne mem_no}">
						<td>비밀글입니다</td>
					</c:when>
				  	<c:otherwise>
						<td><a href="../cs_detail_99?cs_no=${list.cs_no}">${list.title}</a></td>
				  	</c:otherwise>
				  </c:choose>
			      <td>
			      	<fmt:formatDate value="${list.reg_date }" pattern="yyyy-MM-dd"/>
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
<script src="../js/csScript.js"></script>
</body>
</html>