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
            var notInterestElement = document.querySelector('.star.not-interested');
            if (action === 'add' && notInterestElement && notInterestElement.classList.contains('not-interested')) {
                alert('관심 없음 등록 해제 후 시도해 주세요.');
                return;
            }
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

        function toggleNotInterest(com_no, starElement) {
            var action = starElement.classList.contains('not-interested') ? 'remove' : 'add';
            var interestElement = document.querySelector('.star.interested');
            if (action === 'add' && interestElement && interestElement.classList.contains('interested')) {
                alert('관심 등록 해제 후 시도해 주세요.');
                return;
            }
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '${pageContext.request.contextPath}/companies/toggleNotInterest', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    if (action === 'add') {
                        starElement.classList.add('not-interested');
                        starElement.innerText = '◆';
                    } else {
                        starElement.classList.remove('not-interested');
                        starElement.innerText = '◇';
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
        .not-interested {
            color: blue;
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
        /* .table-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin-top: 20px;
        }
        table {
            width: 50%;
            border-collapse: collapse;
            margin-top: 20px;
            table-layout: fixed;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
            word-wrap: break-word;
        }
        th {
            background-color: #f2f2f2;
        } */
    </style>
</head>
<body class="d-flex flex-column h-100">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div class="container">
    <h4>${company.com_name} 상세 정보</h4>
    <div class="row">
		<div class="border p-5 rounded mb-5">
		
        <table class="table">
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
                <th>사업자 번호</th>
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
            <c:if test="${not empty sessionScope.loggedInMember || sessionScope.isAdmin == true}">
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
                <tr>
                    <th>관심 없음 기업 등록|해제</th>
                    <td>
                        <span class="star ${company.notInterest ? 'not-interested' : ''}" onclick="toggleNotInterest(${company.com_no}, this)">
                            <c:choose>
                                <c:when test="${company.notInterest}">
                                    ◆
                                </c:when>
                                <c:otherwise>
                                    ◇
                                </c:otherwise>
                            </c:choose>
                        </span>
                    </td>
                </tr>
            </c:if>
        </table>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html> 
