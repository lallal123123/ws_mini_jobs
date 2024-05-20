<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<script>
    function toggleInterest(com_no, starElement) {
        var action = starElement.classList.contains('interested') ? 'remove' : 'add';
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '${pageContext.request.contextPath}/companies/toggleInterest', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                if (action === 'add') {
                    starElement.classList.add('interested');
                    starElement.innerText = '★';
                } else {
                    starElement.classList.remove('interested');
                    starElement.innerText = '☆';
                }
            }
        };
        xhr.send('com_no=' + com_no + '&action=' + action);
    }
</script>
<style>
    .star {
        cursor: pointer;
        font-size: 20px;
        color: gold;
    }
    .interested {
        color: red;
    }
</style>
</head>
<body>
<header>
    <h1>마이 페이지</h1>
</header>
<h2>관심 기업 목록</h2>
<table>
    <thead>
        <tr>
            <th>회사명</th>
            <th>대표자</th>
            <th>주소</th>
            <th>관심 기업</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="company" items="${interestCompanies}">
            <tr>
                <td>${company.com_name}</td>
                <td>${company.com_ceo}</td>
                <td>${company.com_addr}</td>
                <td>
                    <span class="star interested" onclick="toggleInterest(${company.com_no}, this)">
                        ★
                    </span>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
