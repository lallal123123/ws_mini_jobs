<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 대시보드</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
              <li class="nav-item">
                <a href="../admin99/getTotalRegistrations" class="nav-link active" aria-current="page">
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
                <a href="#" class="nav-link link-body-emphasis">
                 신고 접수된 건
                </a>
              </li>    
             </ul>
        </div>
    </div>
    
    <div class="col-9 mb-5">
        <div class="border p-5">
        <h3 class="fs-5 fw-bold">월별 가입현황</h3>
        <canvas id="montlyRegistrationsChart" width="800" height="400"></canvas>
        <script src="../js/chartScript.js"></script>
        <script>
        	window.currentMonth = ${currentMemRegist.month};
        	window.pastMonth = ${pastMemRegist.month};
        	window.currentMemberRegistrations = ${currentMemRegist.total};
        	window.currentCompanyRegistrations = ${currentComRegist.total};
        	window.pastMemberRegistrations = ${pastMemRegist.total};
        	window.pastCompanyRegistrations = ${pastComRegist.total};
        </script>
        <h3 class="fs-5 fw-bold mt-5">미답변 문의·신고 </h3>
        <br>
        <table class="table jobs-table text-center">
			  <thead>
			    <tr>
			      <th scope="col">게시글번호</th>
			      <th scope="col">문의등록일</th>
			      <th scope="col">제목</th>
			      <th scope="col">작성자</th>
			      <th scope="col">답변 달기</th>			      
			    </tr>
			  </thead>
			  <tbody class="table-group-divider">
			  
			  <c:forEach var="list" items="${list }" varStatus="status">
			  	<tr class="border-bottom">
			      <td scope="row">${list.cs_no }</td>
			      <td><fmt:formatDate value="${list.reg_date }" pattern="yyyy-MM-dd"/></td>
			      <td>
			      	<c:choose>
			      		<c:when test="${list.answerStatus == '미답변' }">
			      			<a href="../admin99/cs_detail_99?cs_no=${list.cs_no}">${list.title}</a></td>
			      		</c:when>
			      		<c:otherwise>
			      			<a href="../admin99/cs_request_detail_99?cs_no=${list.cs_no }">${list.title}</div>
			      		</c:otherwise>
			      	</c:choose>
			      <c:choose>
			      	<c:when test='${list.com_id != null }'>
			      		<td>${list.com_id }</td>
			      	</c:when>
			      	<c:otherwise>
			      		<td>${list.mem_id }</td>
			      	</c:otherwise>
			      </c:choose>
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
			<a href="../admin99/cs_list_99">더보기></a>
		</div>
    </div>
</div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="../js/noticeScript.js"></script>
</body>
</html>
</body>
</html>
