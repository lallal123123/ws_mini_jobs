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
                <a href="../admin99/admin_dashboard_99" class="nav-link link-body-emphasis">
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
    <div class="col-9 mb-5">
    	<p class="text-secondary d-flex">
	    	<a href="#" class="nav-link text-secondary">관리자 모드</a> <span class="mx-3">&gt;</span>
	    	<a href="#" class="nav-link text-secondary">기업회원 조회</a> <span class="mx-3">&gt;</span>
	    	<a href="" class="nav-link text-black fw-bolder">기업회원 상세 조회</a>
	    </p>
        <div class="border p-5">
        <table class="table border-none-table">
       			<tbody>
       				<tr class="border-bottom">
       					<td>기업 번호</td>
       					<td>${company.com_no}</td>
       				</tr>
       				<tr class="border-bottom">
       					<td>아이디</td>
       					<td>${company.com_id}</td>
       				</tr>
       				<tr class="border-bottom">
       					<td>이름</td>
       					<td>${company.com_name}</td>
       				</tr>
       				<tr class="border-bottom">
       					<td>대표</td>
       					<td>${company.com_ceo}</td>
       				</tr>
       				<tr class="border-bottom">
       					<td>주소</td>
       					<td>${company.com_addr}</td>
       				</tr>
       				<tr class="border-bottom">
       					<td>사업자 번호</td>
       					<td>${company.com_companynum}</td>
       				</tr>
       				<tr class="border-bottom">
       					<td>전화번호</td>
       					<td>${company.com_tel}</td>
       				</tr>
       				<tr class="border-bottom">
       					<td>이메일</td>
       					<td>${company.com_email}</td>
       				</tr>
       				<tr class="border-bottom">
       					<td>웹사이트</td>
       					<td>${company.com_url}</td>
       				</tr>
       				<tr class="border-bottom">
       					<td>가입 날짜</td>
       					<td><fmt:formatDate value="${company.make_date}" pattern="yyyy-MM-dd"/></td>
       				</tr>
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