
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

</head>
<body>
	<div class="col-3">
		<div class="border p-3 rounded">
			<ul class="nav nav-pills flex-column mb-auto">
				<!-- 여기에 메뉴를 나열해주세요 -->
				<li class="nav-item">
					<div class="accordion" id="accordionPanelsStayOpenExample">
						<a href=""
							class="nav-link link-body-emphasis border-bottom rounded-0"
							aria-current="page">FAQ</a>
						<div id="panelsStayOpen-collapseOne"
							class="accordion-collapse collapse show">
							<div class="accordion-body py-0 pe-0">
								<a
									href="${pageContext.request.contextPath}/resume/member_mypage_resume_writeform"
									class="d-block nav-link link-body-emphasis border-bottom rounded-0">
									개인 회원
								</a>
								<a
									href="${pageContext.request.contextPath}/resume/member_mypage_resume_freeform"
									class="d-block nav-link link-body-emphasis border-bottom rounded-0">
									기업 회원
								</a>
							</div>
						</div>
					</div>
				</li>
				<li class="nav-item">
					<div class="accordion" id="accordionPanelsStayOpenExample">
						<a href="${pageContext.request.contextPath}/members/mypage/myhome"
							class="nav-link link-body-emphasis border-bottom rounded-0"
							aria-current="page">고객센터
						</a>
						<div id="panelsStayOpen-collapseOne"
							class="accordion-collapse collapse show">
							<div class="accordion-body py-0 pe-0">
								<a href="${pageContext.request.contextPath}/cs_list_99"
									class="nav-link link-body-emphasis  border-bottom rounded-0">
									문의·신고
								</a>
								<a
									href="${pageContext.request.contextPath}/notice_list_99"
									class="nav-link link-body-emphasis  border-bottom rounded-0">
									공지사항
								</a>
							</div>
						</div>
					</div>
				</li>
				
				<li class="nav-item"><a href="/member/getMemRecruitApplyList"
					class="nav-link link-body-emphasis border-bottom rounded-0"
					aria-current="page">지원 공고 내역</a></li>
			</ul>
		</div>
	</div>


</body>
</html>