<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jobs 휴먼 클라우드 이력관리플렛폼</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet">
</head>
<body class="d-flex flex-column h-100">
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- 작업공간 영역 -->
	<div class="container">
		<div class="row">
			<div class="col-3">
				<div class="border p-3">
					<ul class="nav nav-pills flex-column mb-auto">
						<!-- 여기에 메뉴를 나열해주세요 -->
						<li class="nav-item"><a href="#" class="nav-link active"
							aria-current="page"> 메뉴1 </a></li>
						<li><a href="#" class="nav-link link-body-emphasis"> 메뉴2
						</a></li>
					</ul>
				</div>
			</div>
			<div class="col-9">
				<div class="border p-3">
					<!-- 작업시작 -->

					<div class="border p-5 rounded">
						<h2>관심 구직자 리스트</h2>


						<c:forEach var="dto" items="${list}">
							<div class="border p-2 mb-2">
								<div class="row align-items-center">
									<div class="col-md-4">
										<div>이름 :${dto.mem_name }</div>
										<div>지원분야 :${dto.part }</div>
										<div>희망직무 :${dto.hope_job }</div>
										<div>email :${dto.mem_email }</div>
										<div>출생년도 :${dto.mem_birth }</div>
										<div>성별 :${dto.mem_gender }</div>
									</div>
									<div class="col-md-5 text-secondary">
										<div class="col-md-3 d-flex flex-row">
											<a class="btn btn-secondary" href="#">이력서조회</a> 
											<a class="btn btn-jobs me-2" href="delete?no=${dto.mem_interest_no }">관심삭제</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>


						<!-- 작업끝 -->
					</div>
				</div>

			</div>
		</div>
		<!-- 작업공간 영역 끝 -->
		<jsp:include page="../footer.jsp"></jsp:include>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous"></script>
</body>
</html>