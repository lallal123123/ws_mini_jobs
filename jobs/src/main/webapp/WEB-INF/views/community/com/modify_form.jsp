
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
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<!-- 작업공간 영역 -->
	<div class="container">
		<div class="row">

			<div class="col-12">
				<div class="border p-3">
					<h1>커뮤니티 게시글 수정</h1>

					<form action="modify" method="post">
						<div class="mb-3">
							<label for="" class="form-label">카테고리</label> 
							<select class="form-control" name="category">
								<option value="">선택해주세요</option>
								<c:forEach var="dto" items="${clist}">									
									<option class="option_category" value="${dto.ch_category}">${dto.ch_category}</option>
								</c:forEach>
							</select>
						</div>

						<div class="mb-3">
							<label for="" class="form-label">제목</label> <input type="text"
								class="form-control" name="title" value="${dto.title}">
						</div>
						<div class="mb-3">
							<label for="" class="form-label">내용</label>
							<textarea class="form-control" name="content" >${dto.content}</textarea>
						</div>
						<div class="mb-3">
							<label for="" class="form-label">작성자 비공개 여부</label>
							<input type="radio" name="secret" value="0">
  							<label for="option1">공개</label>
  							<input type="radio"  name="secret" value="1">
  							<label for="option1">비공개</label>
						</div>
                        <input type="hidden" name="com_community_no" value="${dto.com_community_no}">
						<button class="btn btn-jobs w-100">수정하기</button>



					</form>

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

        <script>
            document.addEventListener("DOMContentLoaded", function() {
                let c_options = document.querySelectorAll(".option_category");
                let radios = document.querySelectorAll("input[type='radio']");
                
                c_options.forEach(option => {
                    if (option.value == "${dto.category}") {
                        option.selected = true;
                    }
                });
                
                radios.forEach(radio => {
                    if (radio.value == "${dto.secret}") {
                        radio.checked = true;
                    }
                });
            });
        </script>
            
</body>
</html>