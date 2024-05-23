<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jobs 휴먼 클라우드 이력관리플렛폼</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
<style>
    .text-center {
        text-align: center;
    }
</style>
<script>
    function fetchInterestMemberCount(com_no, elementId) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '${pageContext.request.contextPath}/companies/interestMemberCount?com_no=' + com_no, true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var count = xhr.responseText;
                document.getElementById(elementId).innerText = count;
            }
        };
        xhr.send();
    }

    window.onload = function() {
        <c:forEach var="company" items="${companies}">
            fetchInterestMemberCount(${company.com_no}, 'interestMemberCount_${company.com_no}');
        </c:forEach>
    };
</script>
</head>
<body class="d-flex flex-column h-100">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<!-- 작업공간 영역 -->
<div class="container">
 	<h4>기업 리스트</h4>
    <table class="table jobs-table text-center table-hover mt-3 mb-5">
        <thead>
            <tr>
                <th>기업 번호</th>
                <th>회사명</th>
                <th>대표자</th>
                <th>주소</th>
                <th class="text-center">관심 등록 회원 수</th>
                <th>기업상세</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="company" items="${companies}">
                <tr class="border-bottom">
                    <td>${company.com_no}</td>
                    <td>${company.com_name}</td>
                    <td>${company.com_ceo}</td>
                    <td>${company.com_addr}</td>
                    <td id="interestMemberCount_${company.com_no}" class="text-center">로딩 중...</td>
                    <td><a href="${pageContext.request.contextPath}/companies/${company.com_no}" class="btn btn-sm btn-primary">기업상세</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
            <c:if test="${currentPage > 1}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/companies?page=${currentPage - 1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
            <c:forEach var="i" begin="1" end="${totalPages}">
                <li class="page-item ${i == currentPage ? 'active' : ''}">
                    <a class="page-link" href="${pageContext.request.contextPath}/companies?page=${i}">${i}</a>
                </li>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <li class="page-item">
                    <a class="page-link" href="${pageContext.request.contextPath}/companies?page=${currentPage + 1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
