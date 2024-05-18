<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jobs 휴먼 클라우드 이력관리플렛폼</title>
<a href="community/">이준형</a>
<a href="member/index">김경민</a>
<a href="/cs_list_99">배서원</a>
<a href="members/index">추창민</a>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<!-- 작업공간 영역 -->
<div class="container">
<div class="row">
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
    <div class="col-9">
        <div class="border p-3">
        여기에는 메뉴에 따른 페이지를 구현해주세요
        </div>
    </div>
    
   
    
    
    <div class="col-12">
        <div class="border p-3">
        사이드 메뉴가 없는 회면이면 요거 쓰세요
        </div>
    </div>
</div>
</div>
<!-- 작업공간 영역 끝 -->
<jsp:include page="footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>