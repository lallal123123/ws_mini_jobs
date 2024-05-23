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
<body class="d-flex flex-column h-100">
<jsp:include page="../header.jsp"></jsp:include>
<!-- 작업공간 영역 -->
<div class="container">
    <div class="row">
        <!-- 왼쪽 컬럼 -->
        <div class="col-3">
            <div class="border p-3">
                <ul class="nav nav-pills flex-column mb-auto">
                    <!-- 여기에 메뉴를 나열해주세요 -->
                    <li class="nav-item">
                        <a href="#" class="nav-link active" aria-current="page">
                            메뉴1
                        </a>
                    </li>
                    <li>
                        <a href="#" class="nav-link link-body-emphasis">
                            메뉴2
                        </a>
                    </li>   
                </ul>
            </div>
        </div>
        <!-- 오른쪽 컬럼 -->
        <div class="col-9">
            <div class="border p-3" style="display: flex; flex-direction: row;">
                 <div class = "col-5"style="border: 1px solid #ced4da; padding: 10px; margin-right: 10px;">
                 <h5>지원공고 내역</h5><hr>
                     <c:forEach var="memRecruitApply" items="${memRecruitApplyList }">
			        <div class="border p-3 mb-3">
			        	<div class="row align-items-center">
			        	<input type="hidden" id="mem_recruit_no" value="${memRecruitApply.mem_recruit_no }">
			        		<div class="col-md-4">
			        			<div class="fs-7 text-secondary">공고번호 : ${memRecruitApply.recruit_no } </div>
			        			<div>[ ${memRecruitApply.com_name } ]</div>
			        			<div class="fs-5 fw-bold w-100 text_ellipsis">
			        			<a class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="/company/mypage/recruitDetail?recruit_no=${memRecruitApply.recruit_no }">${memRecruitApply.title }</a>
			        			</div>
			        		</div>
			        		<div class="col-md-5 text-secondary">
			        		${memRecruitApply.field } | 
			        		<c:choose>
						        <c:when test="${memRecruitApply.education ne null }">
						           ${memRecruitApply.education } | 
						        </c:when>         
						        <c:otherwise>
						          학력무관 | 
						        </c:otherwise>
						    </c:choose>
						    <c:choose>
						        <c:when test="${memRecruitApply.pay ne 0 }">
						          ${memRecruitApply.pay } |<br/>
						        </c:when>         
						        <c:otherwise>
						          회사내규에 따름 |<br/>
						        </c:otherwise>
						    </c:choose> 
						    <c:choose>
						        <c:when test="${memRecruitApply.com_addr ne null }">
						          ${memRecruitApply.com_addr } | 
						        </c:when>         
						    </c:choose>      		
			        		마감일 ${memRecruitApply.deadline_date } <br/>
			        		</div>
			        		<div class="col-md-3 text-center">
			        		<c:choose>
						        <c:when test="${memRecruitApply.pass eq true }">
						          <span class="text-primary fw-bold">합격</span>
						        </c:when>  
						        <c:when test="${memRecruitApply.pass eq false }">
						          <span class="text-danger fw-bold">불합격</span>
						        </c:when>         
						        <c:otherwise>
						          대기중
						        </c:otherwise>
						    </c:choose> 
						    <c:if test="${memRecruitApply.pass eq null }">
				        		<button type="button" class="btn btn-info text-white ms-2"  onclick="applyDelete()">
					               취소하기
					            </button>
					        </c:if>
			        		</div>
			        		<div></div>
			        	</div>
			        </div>
		        	</c:forEach>
                </div>
                <div class="col-5" style="border: 1px solid #ced4da; padding: 10px;">
                    <h5>이력서 리스트</h5><hr>
                    <c:forEach var="siteList" items="${siteList}">
                    <div class="border p-2 mb-2">
                        <div class="row align-items-center">
                            <div class="col-md-4">
                                <div>이력서 제목 : ${siteList.title } </div>
                            </div>
                            <div class="col-md-5 text-secondary">
                            <div class="col-md-3 d-flex flex-row-reverse">
                                
                            </div>
                            <div>
                            </div>
                        </div>
                    </div></div>
                    </c:forEach>
                    
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../footer.jsp"></jsp:include>
<script>
	const mem_recruit_no = document.querySelector("#mem_recruit_no");

	function applyDelete(){
		if(confirm("지원을 취소하시겠습니까?")){
			location.href="/member/deleteRecruitApply?mem_recruit_no=" + mem_recruit_no.value;
			console.log("/member/deleteRecruitApply?mem_recruit_no=" + mem_recruit_no.value);
		}
	}
	</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html> 