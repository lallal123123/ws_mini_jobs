<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet">
<style>
#searchBox {
	text-align: center;
}

#pageBox {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<!-- 작업공간 영역 -->
	<div class="container">
		<div class="row">

			<div class="col-12">
				<div class="border p-3">
					<h1>관신 구직자 리스트</h1>

					<table class="table">
						<thead>
							<tr>
								<th scope="col">이름</th>
								<th scope="col">정보</th>
								<th scope="col">해제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td>${dto. }</td>
									<td><a href="detail?no=${dto.com_community_no}">
											${dto.title } </a></td>
									<c:if test="${dto.secret eq 0}">
										<td>${dto.com_id}</td>
									</c:if>
									<c:if test="${dto.secret eq 1}">
										<td>비공개</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					
</body>
</html>