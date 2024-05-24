
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
	<jsp:include page="../../header.jsp"></jsp:include>
	<!-- 작업공간 영역 -->
	<div class="container">
		<div class="row">
			<div class="col-12 mb-5">
				<div class="border p-5">
					<a class="btn btn-jobs" href="list">전체게시글</a>
					<c:if test="${loggedInMember.mem_id eq dto.mem_id}">
						<a class="btn btn-info text-white" href="modify_form?no=${dto.mem_community_no}">수정</a>
						<a class="btn btn-secondary" href="delete?no=${dto.mem_community_no}">삭제</a>
					</c:if>
					<div class="mb-3 mt-3 fs-5 fw-bold" id="title">${dto.title}</div>
					<div class="mb-3" id="writerBox">
						<c:if test="${dto.secret eq 0}">
							
							<div id="writer">${dto.mem_id}<br>${dto.s_reg_date}</div>
						</c:if>
						<c:if test="${dto.secret eq 1}">
							<!-- 
							<div id="img">비공개이미지위치</div>
							 -->
							<div class="text-secondary" id="writer">
								비공개 | ${dto.s_reg_date}</div>
						</c:if>
					</div>
					<div class="mb-3 border-top border-bottom py-4" id="content">${dto.content}</div>
					<div class="mb-3" id="category">#${dto.category}</div>
					<c:if test="${ loggedInMember ne null}">
						<form action="reply" method="post">
							<div id="reply_id" name="mem_id">${loggedInMember.mem_id}</div>
							<input type="hidden" name="mem_community_no"
								value="${dto.mem_community_no}"> <input type="hidden"
								name="mem_no" value="${loggedInMember.mem_no}">

							<textarea name="content" class="form-control"></textarea>
							<br>
							<button class="btn btn-jobs w-100">댓글등록</button>
						</form>
					</c:if>
					<hr>
					<div id="replyList">
							<c:forEach var="reply" items="${rList}">
								<div class="p-4 border mb-2">
									<div>
									${reply.content}
									</div>
									<div class="d-flex justify-content-end text-secondary">
									${reply.mem_id}
									${reply.s_regdate}
									<c:if test="${reply.mem_id eq loggedInMember.mem_id}">
										<a class="btn btn-sm btn-secondary ms-3" href="delete_reply?no=${reply.mem_reply_no}&community_no=${dto.mem_community_no}">삭제</a>
									</c:if>
									</div>
								</div>
							</c:forEach>
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