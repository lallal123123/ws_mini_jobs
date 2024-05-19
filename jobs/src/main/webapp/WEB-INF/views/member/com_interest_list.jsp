<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관심기업 리스트</title>
    <style>
        .star {
            cursor: pointer;
            font-size: 24px;
        }
    </style>
</head>
<body>
    <header>
        <h1>관심기업 리스트</h1>
    </header>
    <main>
        <table>
            <thead>
                <tr>
                    <th>기업 번호</th>
                    <th>기업 이름</th>
                    <th>상세 보기</th>
                    <th>관심 해제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="company" items="${interestCompanies}">
                    <tr>
                        <td>${company.com_no}</td>
                        <td>${company.com_name}</td>
                        <td><a href="${pageContext.request.contextPath}/companies/${company.com_no}">상세 보기</a></td>
                        <td>
                            <span class="star" onclick="toggleInterest(${company.com_no}, this)">★</span>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </main>
    <script>
        function toggleInterest(companyId, starElement) {
            fetch('${pageContext.request.contextPath}/companies/toggleInterest/' + companyId, {
                method: 'POST'
            }).then(response => response.json())
              .then(data => {
                  if (data.success) {
                      location.reload();
                  }
              });
        }
    </script>
</body>
</html>
