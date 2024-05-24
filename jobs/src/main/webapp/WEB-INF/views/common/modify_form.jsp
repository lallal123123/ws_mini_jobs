<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
              <li>
                	<div class="nav-link link-body-emphasis">FAQ</div>
              	</li>
              	<li class="nav-item">
	                <a href="../admin99/faqMemberList" class="nav-link link-body-emphasis">· 일반 회원</a>
	            </li>
	            <li class="nav-item">
	                <a href="../admin99/faqCompanyList" class="nav-link link-body-emphasis">· 기업 회원</a>
	            </li>
	            <li>
                	<div class="nav-link link-body-emphasis">고객센터</div>
              	</li>
            	<li class="nav-item">
	                <a href="../cs_list_99" class="nav-link active" aria-current="page">· 문의·신고</a>
	            </li>
	            <li>
                	<a href="../notice_list_99" class="nav-link link-body-emphasis">· 공지사항</a>
              	</li>
               </ul>
        </div>
    </div>
    
    <div class="col-9 mb-5">
    	<p class="text-secondary d-flex">
	    	<a href="#" class="nav-link text-secondary">고객센터</a> <span class="mx-3">></span>
	    	<a href="#" class="nav-link text-secondary">문의·신고</a> <span class="mx-3">></span>
	    	<a href="" class="nav-link text-black fw-bolder">문의·신고 수정</a>
	    </p>
        <div class="border p-5">
        	<form action="/modify_99?cs_no=${dto.cs_no }" method="post" onsubmit="return csRegForm()">
	      		<div class="mb-1">문의·신고 종류(필수)</div>
			  	<select class="form-select" name="category" id="category">
			  	<option value="">선택하세요</option>
			  	<option value="서비스 이용 문의" ${dto.category  == '서비스 이용 문의' ? 'selected' : ''}>서비스 이용 문의</option>
			  	<option value="불량정보·오류 신고" ${dto.category  == '불량정보·오류 신고' ? 'selected' : ''}>불량정보·오류 신고</option>
			  	<option value="서비스 제안·칭찬" ${dto.category  == '서비스 제안·칭찬' ? 'selected' : ''}>서비스 제안·칭찬</option>
			  	<option value="커뮤니티 관련사항" ${dto.category  == '커뮤니티 관련사항' ? 'selected' : ''}>커뮤니티 관련사항</option>
			  	</select>
	 			<div class="mb-3">
                	<label for="" class="form-label mt-3">제목</label>
                	<textarea class="form-control mb-3" name="title" id="title" placeholder="제목">${dto.title }</textarea>
                	<label for="" class="form-label">내용</label>
                	<textarea class="form-control" name="content" id="content" placeholder="내용">${dto.content }</textarea>
           		</div>
           		<div class="mb-1">글 비공개 여부</div>
	 			<input type="radio" value="1" ${dto.ch_private == '1' ? 'checked' : ''} name="ch_private" id="public">공개
	 			<input type="radio" value="0" ${dto.ch_private == '1' ? 'checked' : ''} name="ch_private" id="private">비공개<br>
           		<input type="submit" class="btn btn-jobs w-100 mt-3" value="수정하기">
			</form>
        </div>
    </div>
</div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="../js/csScript.js"></script>
</body>
</html>
</body>
</html>