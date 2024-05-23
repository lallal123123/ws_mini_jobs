<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Page - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/css/common.css" rel="stylesheet">
    <style>
        .sidebar {
            width: 200px;
            height: 100vh;
            position: fixed;
        }
        .content {
            margin-left: 220px;
        }
        .form-container {
            max-width: 600px;
            margin: auto;
        }
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
    </style>
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

        function toggleNotInterest(com_no, starElement) {
            var action = starElement.classList.contains('not-interested') ? 'remove' : 'add';
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
            xhr.send('com_no=' + com_no + '&action=' + action);
        }
    </script>
</head>
<body class="d-flex flex-column h-100">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div class="container">
    <div class="row">
        <!-- 사이드빠 CSS -->
            <jsp:include page="../mypagesidebar.jsp"></jsp:include>
        

            <div class="col-9 mb-5">
                <p class="text-secondary d-flex">
                    <a href="#" class="nav-link text-secondary">마이페이지</a> <span class="mx-3">></span>
                    <a href="" class="nav-link text-black fw-bolder">관심기업 리스트</a>
                </p>
                <div class="border p-3 mb-3  rounded">
                
                <div class="row">
                <div class="col-12">
                    <h5 class="fw-bold fs-5 mt-2">관심 기업 목록</h5>
                    <table class="table jobs-table text-center">
                        <thead>
                            <tr>
                                <th>회사명</th>
                                <th>대표자</th>
                                <th>주소</th>
                                <th>관심 기업 해제</th>
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
                </div>
               </div>
               <hr/>
               <div class="col-12">
                <div>
                    <h5 class="fw-bold fs-5 mt-5">관심 없음 기업 목록</h5>
                    <table class="table jobs-table text-center">
                        <thead>
                            <tr>
                                <th>회사명</th>
                                <th>대표자</th>
                                <th>주소</th>
                                <th>관심 없음 기업 해제</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="company" items="${notInterestCompanies}">
                                <tr>
                                    <td>${company.com_name}</td>
                                    <td>${company.com_ceo}</td>
                                    <td>${company.com_addr}</td>
                                    <td>
                                        <span class="star not-interested" onclick="toggleNotInterest(${company.com_no}, this)">
                                            ◆
                                        </span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                </div>
            </div>
       </div>
    </div>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>