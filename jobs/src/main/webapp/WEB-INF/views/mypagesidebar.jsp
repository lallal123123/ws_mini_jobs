
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

</head>
<body>
	<div class="col-3">
		<div class="border p-3 rounded">
			<ul class="nav nav-pills flex-column mb-auto">
				<!-- 여기에 메뉴를 나열해주세요 -->
				<li class="nav-item">
					<div class="accordion" id="accordionPanelsStayOpenExample">
						<a href="${pageContext.request.contextPath}/members/mypage/myhome"
							class="nav-link link-body-emphasis border-bottom rounded-0"
							aria-current="page">My 홈
						</a>
						<div id="panelsStayOpen-collapseOne"
							class="accordion-collapse collapse show">
							<div class="accordion-body py-0 pe-0">
								<a href="${pageContext.request.contextPath}/members/editProfile"
									class="nav-link link-body-emphasis  border-bottom rounded-0">내정보
									수정
								</a>
								<a
									href="${pageContext.request.contextPath}/companies/interestCompanies"
									class="nav-link link-body-emphasis  border-bottom rounded-0">관심기업
									리스트
								</a>
								 <a
								 	href="/member/recruitScrapList"
									class="nav-link link-body-emphasis border-bottom rounded-0"
									aria-current="page">스크랩 공고 리스트
								</a>
							</div>
						</div>
					</div>
				</li>
				<li class="nav-item">
					<div class="accordion" id="accordionPanelsStayOpenExample">
						<a href=""
							class="nav-link link-body-emphasis border-bottom rounded-0"
							aria-current="page">이력서</a>
						<div id="panelsStayOpen-collapseOne"
							class="accordion-collapse collapse show">
							<div class="accordion-body py-0 pe-0">
								<a
									href="${pageContext.request.contextPath}/resume/member_mypage_resume_writeform"
									class="d-block nav-link link-body-emphasis border-bottom rounded-0">사이트
									이력서 작성
								</a>
								<a
									href="${pageContext.request.contextPath}/resume/member_mypage_resume_freeform"
									class="d-block nav-link link-body-emphasis border-bottom rounded-0">자유
									이력서 작성
								</a>
								<a
									href="${pageContext.request.contextPath}/resume/member_mypage_resume_list"
									class="d-block nav-link link-body-emphasis border-bottom rounded-0">이력서
									리스트
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