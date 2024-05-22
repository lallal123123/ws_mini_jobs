<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <div class="col-3">
                <div class="border p-3">
                    <ul class="nav nav-pills flex-column mb-auto">
                        <!-- 여기에 메뉴를 나열해주세요 -->
                        <li class="nav-item"><a href="#" class="nav-link active" aria-current="page"> 메뉴1 </a></li>
                        <li><a href="#" class="nav-link link-body-emphasis"> 메뉴2 </a></li>
                    </ul>
                </div>
            </div>
            <div class="col-9">
        
                 <div class="border p-5 rounded">

                    
                    <!-- 검색창 -->
                    <div id="searchBox" >
                        <form action="siteresumesearch" method="post" placeholder="제목을 입력해주세요..">
                            <input type="text"  name="search">
                            <button>검색</button>
                        </form>
                    </div><hr>      
                    <!-- 검색창 --> 
                    <c:forEach var="memRecruitScrap" items="${memRecruitScrapList }">
			        <div class="border p-3 mb-3">
			        	<div class="row align-items-center">
			        		<input type="hidden" id="s_recruit_no" value="${memRecruitScrap.s_recruit_no }">
			        		<div class="col-md-4">
			        			<div class="fs-7 text-secondary">공고번호 : ${memRecruitScrap.recruit_no } </div>
			        			<div>[ ${memRecruitScrap.com_name } ]</div>
			        			<div class="fs-5 fw-bold w-100 text_ellipsis">
			        			<a class="link-dark link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover" href="/company/mypage/recruitDetail?recruit_no=${memRecruitScrap.recruit_no }">${memRecruitScrap.title }</a>
			        			</div>
			        		</div>
			        		<div class="col-md-5 text-secondary">
			        		${memRecruitScrap.field } | 
			        		<c:choose>
						        <c:when test="${memRecruitScrap.education ne null }">
						           ${memRecruitScrap.education } | 
						        </c:when>         
						        <c:otherwise>
						          학력무관 | 
						        </c:otherwise>
						    </c:choose>
						    <c:choose>
						        <c:when test="${memRecruitScrap.pay ne 0 }">
						          ${memRecruitScrap.pay } |<br/>
						        </c:when>         
						        <c:otherwise>
						          회사내규에 따름 |<br/>
						        </c:otherwise>
						    </c:choose> 
						    <c:choose>
						        <c:when test="${memRecruitScrap.com_addr ne null }">
						          ${memRecruitScrap.com_addr } | 
						        </c:when>         
						    </c:choose>      		
			        		마감일 ${memRecruitScrap.deadline_date } <br/>
			        		</div>
			        		<div class="col-md-3 text-center">
				        		<button type="button" class="btn btn-info text-white"  onclick="scrapDelete()">
					               <i class="bi bi-bookmark-star-fill fs-6"></i>
					            </button>
			        		</div>
			        		<div></div>
			        	</div>
			        </div>
		        	</c:forEach>
                </div>
                                
               </div>
            </div>


    </div>
    <!-- 작업공간 영역 끝 -->
    <jsp:include page="../footer.jsp"></jsp:include>
	<script>
	const s_recruit_no = document.querySelector("#s_recruit_no");

	function scrapDelete(){
		if(confirm("스크랩을 해제하시겠습니까?")){
			location.href="/member/deleteRecruitScrap?s_recruit_no=" + s_recruit_no.value;
		}else{
			alert("스크랩 해제를 취소하셨습니다.");
		}
	}
	</script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
