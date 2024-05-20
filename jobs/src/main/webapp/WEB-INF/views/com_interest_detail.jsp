<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관심 기업 상세 정보</title>
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
            margin-top: 20px;
            padding: 5px 10px;
            font-size: 14px;
            color: white;
            background-color: green;
            border: none;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
            text-align: left;
        }
        td {
            text-align: left;
        }
    </style>
</head>
<body>
    <header>
        <h1>${company.com_name} 상세 정보</h1>
    </header>
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
            <th>설립일</th>
            <td>${company.make_date}</td>
        </tr>
        <tr>
            <th>관심 기업</th>
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
</body>
</html>
