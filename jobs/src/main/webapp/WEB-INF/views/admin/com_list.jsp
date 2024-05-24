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
                <a href="/admin99/getTotalRegistrations" class="nav-link link-body-emphasis">
                  My home
                </a>
              </li>
              <li>
                <a href="/admin/members" class="nav-link link-body-emphasis">
                 개인회원 관리
                </a>
              </li>
              <li>
                <a href="/admin/companies" class="nav-link active" aria-current="page">
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
    	<div class="border p-3">
    	<p class="text-secondary d-flex">
	    	<a href="#" class="nav-link text-secondary">마이페이지</a> <span class="mx-3">&gt;</span>
	    	<a href="" class="nav-link text-black fw-bolder">기업회원 조회</a>
	    </p>
        	<table class="table jobs-table text-center">
			  <thead>
			    <tr>
			      <th scope="col">기업 번호</th>
			      <th scope="col">가입 일자</th>
			      <th scope="col">아이디</th>
			      <th scope="col">기업명</th>
			      <th scope="col">담당연락처</th>
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
				<c:forEach var="company" items="${companies}">
                <tr class="border-bottom">
                    <td>${company.com_no}</td>
                    <td><fmt:formatDate value="${company.make_date}" pattern="yyyy-MM-dd"/></td>
                    <td><a href="<c:url value='/admin/companies/${company.com_no}'/>">${company.com_id}</a></td>
                    <td>${company.com_name}</td>
                    <td>${company.com_tel}</td>
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