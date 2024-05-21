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
        xhr.send('com_no=' + encodeURIComponent(com_no) + '&action=' + encodeURIComponent(action));
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
    .back-to-main {
        display: inline-block;
        margin-top: 10px;
        margin-bottom: 10px;
        padding: 5px 10px;
        font-size: 12px;
        color: white;
        background-color: gray;
        border: none;
        border-radius: 5px;
        text-align: center;
        text-decoration: none;
        cursor: pointer;
    }
    .table-container {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        margin-top: 20px;
    }
    table {
        width: 50%; /* 표의 너비를 줄임 */
        border-collapse: collapse;
        margin-top: 20px;
        table-layout: fixed; /* 열 너비를 균등하게 설정 */
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center; /* 글자를 가운데 정렬 */
        word-wrap: break-word; /* 긴 단어를 줄 바꿈 */
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body class="d-flex flex-column h-100">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<header>
    <h1 class="text-center">${company.com_name} 상세 정보</h1>
</header>
<div class="table-container">
    <table>
        <tr>
            <th>기업 번호</th>
            <td>${company.com_no}</td>
        </tr>
        <tr>
            <th>회사명</th>
            <td>${company.com_name}</td>
        </tr>
        <tr>
            <th>대표자</th>
            <td>${company.com_ceo}</td>
        </tr>
        <tr>
            <th>주소</th>
            <td>${company.com_addr}</td>
        </tr>
        <tr>
            <th>회사 번호</th>
            <td>${company.com_companynum}</td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td>${company.com_tel}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${company.com_email}</td>
        </tr>
        <tr>
            <th>웹사이트</th>
            <td>${company.com_url}</td>
        </tr>
        <tr>
            <th>관심 기업 등록|해제</th>
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
    </table>
    <a href="${pageContext.request.contextPath}/companies" class="back-to-main">이전으로 돌아가기</a>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
