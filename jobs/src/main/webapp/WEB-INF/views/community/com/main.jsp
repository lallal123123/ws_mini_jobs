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
					<div>실시간 전체글 ${cnt }개</div>
					<div id="hotListAndCom">
					링크 다 달아주고 스크립트 완성하기!!!!!!!!!!!!!
						<span> <label>HOT 전체 인기 글 </label> <a href="">더보기></a><br>
							<hr>
							<table>
								<c:forEach var="dto" items="${ hList}">
									<tr>
										<td>${dto.title }</td>
										<td>${dto.replyCnt }</td>
										<td>${dto.views }</td>
									</tr>
								</c:forEach>
							</table>
						</span> <span> <span>사진공강</span><span>${loggedInCommany.com_id }</span><br>
							<button>게시글작성</button>

						</span>
					</div>
					<div id="categoryList">
						<div>주제별 커뮤니티</div>
						<div id="category">
							<c:forEach var="c" items="${ cList}">
								<button onclick="category(event)">${c.ch_category }></button>
							</c:forEach>

						</div>
						<span>
							<div>
								<div id="categoryName">
									${category } <a href=""> 더보기> </a>
								</div>
								
								<table class="table">
								
									<c:forEach var="dto" items="${chList}">
										<tr>
											<td>${dto.title }</td>
											<td>${dto.replyCnt }</td>
											<td>${dto.views }</td>
										</tr>
									</c:forEach>
								</table>
							</div>

						</span>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- 작업공간 영역 끝 -->
	<jsp:include page="../../footer.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	

</body>
</html>