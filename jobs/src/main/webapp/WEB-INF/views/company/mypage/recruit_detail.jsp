<%@page import="com.project.jobs.dto.Company"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jobs 휴먼 클라우드 이력관리플렛폼</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet">
</head>
<body class="d-flex flex-column h-100 position-relative">
<jsp:include page="../../header.jsp"></jsp:include>
<!-- 작업공간 영역 -->
<div class="container">
	<h4>채용 정보</h4>
	<div class="border rounded p-4">
		<div class="row">
			<div class="col-md-8 border-end">
				<div class="fs-7 text-secondary">공고 번호 : <span id="recruit_no">${recruitDetail.recruit_no}</span></div>
				<div class="f-5 fw-bold">${recruitDetail.com_name}</div>
				<h3 class="border-bottom py-2">${recruitDetail.title}</h3>
				<table class="w-100">
					<tbody>
						<tr>
							<td class="p-1 text-secondary w-50" colspan=2>지원자격</td>
							<td class="p-1 text-secondary w-50" colspan=2>근무조건</td>
						</tr>
						<tr>
							<td class="p-1 text-secondary">경력</td>
							<td class="p-1">${recruitDetail.career}</td>
							<td class="p-1 text-secondary">고용형태</td>
							<td class="p-1">${recruitDetail.field}</td>
						</tr>
						<tr>
							<td class="p-1 text-secondary">학력</td>
							<td class="p-1">${recruitDetail.education}</td>
							<td class="p-1 text-secondary">급여</td>
							<td class="p-1">${recruitDetail.pay}</td>
						</tr>
						<tr>
							<td class="p-1 text-secondary">스킬</td>
							<td class="p-1">${recruitDetail.skill}</td>
							<td class="p-1 text-secondary">지역</td>
							<td class="p-1">${recruitDetail.location}</td>
						</tr>
						<tr>
							<td class="p-1 text-secondary">모집기간</td>
							<td class="p-1">${recruitDetail.reg_date} ~ ${recruitDetail.deadline_date}</td>
							<td class="p-1 text-secondary">시간</td>
							<td class="p-1">${recruitDetail.working_time}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-4">
				<div>
					<a href="">구독</a>
					<a href="">숨기기</a>
				</div>
				<table class="w-100 mb-2">
					<tbody>
						<tr>
							<td class="p-1 text-secondary" colspan=2>기업정보</td>
						</tr>
						<tr>
							<td class="p-1 text-secondary">업종</td>
							<td class="p-1">${com_detail.sectors}</td>
							
						</tr>
						<tr>
							<td class="p-1 text-secondary">사원수</td>
							<td class="p-1">${com_detail.p_number}</td>

						</tr>
						<tr>
							<td class="p-1 text-secondary">설립연도</td>
							<td class="p-1">${com_detail.establishment}</td>
						</tr>
						<tr>
							<td class="p-1 text-secondary">기업형태</td>
							<td class="p-1">${recruitDetail.com_size}</td>
						</tr>
						<tr>
							<td class="p-1 text-secondary">홈페이지</td>
							<td class="p-1">${recruitDetail.com_url}</td>
						</tr>
					</tbody>
				</table>
				<a href="/companies/${recruitDetail.com_no }" class="btn btn-jobs w-100">기업 정보 상세보기</a>
			</div>
		</div>
	</div>
	<div class="border rounded p-4 mt-3 mb-5">
		<div class="row">
			<div class="col-md-12">
				<div class="border-bottom pb-3">
					${com_detail.introduction }
				</div>
				<div>
					<h5 class="mb-3 mt-4">◆ 자격요건</h5>
					<div class="mb-5">${recruitDetail.qualification}</div>
					<h5 class="mb-3">◆ 전형절차</h5>
					<div class="mb-5">${recruitDetail.seprocedure}</div>
					<h5 class="mb-3">◆ 유의사항</h5>
					<div class="mb-5">${recruitDetail.notice}</div>
					<h5 class="mb-3">◆ 공고기간</h5>
					<div class="mb-5">${recruitDetail.reg_date} ~ ${recruitDetail.deadline_date}</div>
					<h5 class="mb-3">◆ 모집인원</h5>
					<div class="mb-5">${recruitDetail.p_number} 명</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:if test="${sessionScope.loggedInCompany eq null}">
	<div class="d-flex justify-content-center sticky-bottom pb-5">
		<a href="#" class="btn btn-lg text-white btn-warning px-5 me-1">지원하기</a>
		<button class="btn btn-lg text-white btn-info px-5 ms-1" onclick="addRecruitScrap()">스크랩하기</button>
	</div>
</c:if>




<!-- 작업공간 영역 끝 -->
<jsp:include page="../../footer.jsp"></jsp:include>
<script>
const recruit_no = document.querySelector("#recruit_no");

function addRecruitScrap(){
	if(confirm("해당 공고를 스크랩하시겠습니까?")){
		location.href="/member/addRecruitScrap?recruit_no=" + recruit_no.innerHTML;
	}else{
		alert("공고 스크랩을 취소하였습니다.");
	}
}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>