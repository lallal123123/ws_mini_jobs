<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 리스트</title>
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
    <h1>기업 리스트</h1>
</header>
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
        <c:forEach var="company" items="${companies}">
            <tr>
                <td>${company.com_name}</td>
                <td>${company.com_ceo}</td>
                <td>${company.com_addr}</td>
                <td>
                    <span class="star ${company.interest ? 'interested' : ''}" onclick="toggleInterest(${company.com_no}, this)">
                        <c:choose>
                            <c:when test="${company.interest}">
                                ★
                            </c:when>
                            <c:otherwise>
                                ☆
                            </c:otherwise>
                        </c:choose>
                    </span>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
