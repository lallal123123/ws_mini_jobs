<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
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
<body  class="d-flex flex-column h-100">
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- 작업공간 영역 -->
	<div class="container">
		<div class="row">
			<jsp:include page="../mypagesidebar.jsp"></jsp:include>
			<!-- 여긴 내용 -->

			<div class="col-9">
				<div class="border p-3">

				<form action="member_mypage_resume_free" id="myButton" method="post" enctype="multipart/form-data">
					<input type="hidden" name="mem_no" value="${member.mem_no}">
					<div class="mb-3">
						<label for="" class="form-label">제목</label> 
						<input type="text" class="form-control" name="title" placeholder="이력서 제목">
					</div>

					<div class="mb-3">
						<label for="formFileMultiple" class="form-label">이력서 파일</label> 
						<input class="form-control" type="file" name="file" multiple>
					</div>
					<div class="mb-3">
						<label for="" class="form-label">포트폴리오 URL</label>
						<input type="text" class="form-control" name="url" placeholder="이력서 제목">
					</div>
					
					<input type="submit" class="btn btn-jobs w-100" value="이력서 저장하기">

					</form>

				</div>
			</div>
			<!-- 끝나는 부분 -->

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