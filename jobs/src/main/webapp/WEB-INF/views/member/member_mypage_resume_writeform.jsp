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
<body>
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

			<form action="member_mypage_resume_write" method="post">
					<div class="mb-3">
						<label for="" class="form-label">제목</label>
						 <input type="text"	class="form-control" name="title" placeholder="이력서 제목">
					</div>
					<div class="mb-3">
						<label for="" class="form-label">이름</label>
						 <input type="text"	class="form-control" name="mem_name" placeholder="이름">
					</div>
					<div class="mb-3">
  						<label for="formFileMultiple" class="form-label">사진</label>
  						<input class="form-control" type="file" name="img_url" multiple>
					</div>
					<div class="mb-3">
						<label for="" class="form-label">주소</label>
						 <input type="text"	class="form-control" name="addr" placeholder="주소">
					</div>
					<div class="mb-3">
						<label for="" class="form-label">자격증</label>
						 <input type="text"	class="form-control" name="licence_name" placeholder="일단보류">
					</div>
					<div class="mb-3">
						<label for="" class="form-label">경력사항</label>
						 <input type="text"	class="form-control" name="company" placeholder="일단보류">
					</div>
					<div class="mb-3">
						<label for="" class="form-label">학력사항</label>
						 <input type="text"	class="form-control" name="school" placeholder="일단보류">
					</div>
					<div class="mb-3">
						<label for="" class="form-label">지원분야</label>
						 <input type="text"	class="form-control" name="part" placeholder="지원분야">
					</div>
					<div class="mb-3">
						<label for="" class="form-label">병역사항</label>
						<input type="text"	class="form-control" name="military" placeholder="필/미필">
					</div>
					<div class="mb-3">
  						<label for="formFileMultiple" class="form-label">기타첨부자료</label>
  						<input class="form-control" type="file" name="etc" multiple>
					</div>
					<div class="mb-3">
                 		<label for="" class="form-label">지원동기</label>
                 		<textarea class="form-control" name="title" id="title"></textarea>
            		</div>
					
					<div class="mb-3">
                 		<label for="" class="form-label">성격 장단점</label>
                 		<textarea class="form-control" name="title" id="title"></textarea>
            		</div>
					
					<div class="mb-3">
                 		<label for="" class="form-label">입사 후 포부</label>
                 		<textarea class="form-control" name="title" id="title"></textarea>
            		</div>
					
					<div class="mb-3">
                 		<label for="" class="form-label">성장 과정</label>
                 		<textarea class="form-control" name="title" id="title"></textarea>
            		</div>
            		<input type="submit" class="btn btn-jobs w-100"  value="이력서 저장하기">

					</form>

				</div>	<!-- 끝나는 부분 -->
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