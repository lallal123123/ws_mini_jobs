<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 전체 방</h1>

	<table>
		<thead>
			<tr>
				<th>카테고리</th>
				<th>제목+내용</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.category }</td>
					<td>${dto.title }<br>
					${dto.content }</td>
					
			</c:forEach>
				
			
		</tbody>

	</table>

</body>
</html>