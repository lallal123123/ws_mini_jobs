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
<jsp:include page="../../header.jsp"></jsp:include>
<!-- 작업공간 영역 -->
<div class="container-fluid">
<div class="row">
     <div class="col-3">
        <div class="border p-3 rounded">
            <ul class="nav nav-pills flex-column mb-auto">
            <!-- 여기에 메뉴를 나열해주세요 -->
                 	<h1>My Page</h1>
            <h2>${member.com_name} 님</h2>
        <a href="${pageContext.request.contextPath}/companies/editProfile">내 정보 수정</a>
            	<li class="nav-item">
                	<a href="/companies/mypage" class="nav-link link-body-emphasis border-bottom rounded-0" aria-current="page">
                  	My 홈
                	</a>
              	</li>
              	<li>
                	<a href="/company/mypage/info_detail" class="nav-link link-body-emphasis  border-bottom rounded-0">
                 	기업 소개 관리
                	</a>
              	</li> 
              	<li>
              		<div class="accordion" id="accordionPanelsStayOpenExample">
			      		<a class="nav-link link-body-emphasis text-weight-bold border-bottom rounded-0" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
			        		채용 공고 관리
			      		</a>
			   	  		<div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show">
			      			<div class="accordion-body py-0 pe-0">
			       				<a href="/company/mypage/getComRecruitList" class="d-block nav-link link-body-emphasis border-bottom rounded-0">채용 공고 리스트</a>
			       				<a href="/company/mypage/recruit_write_form" class="d-block nav-link link-body-emphasis border-bottom rounded-0">채용 공고 작성</a>
			      			</div>
			    		</div>
			 		</div> 
              	</li>   
              	<li>
                	<a href="#" class="nav-link link-body-emphasis  border-bottom rounded-0">
                	스크랩 구직자 
                	</a>
              	</li>   
            </ul>
        </div>
    </div>
    <div class="col-9">
        <h3>기업정보수정</h3>
        <form action="${pageContext.request.contextPath}/companies/updateProfile" method="post" class="needs-validation" novalidate>
            <div class="mb-3">
                <label for="com_id" class="form-label">아이디:</label>
                <input type="text" id="com_id" name="com_id" class="form-control" value="${company.com_id}" readonly/>
            </div>
            <div class="mb-3">
                <label for="com_pw" class="form-label">비밀번호:</label>
                <input type="password" id="com_pw" name="com_pw" class="form-control" value="${company.com_pw}" required/>
                <div class="invalid-feedback">
                    비밀번호를 입력해 주세요.
                </div>
            </div>
            <div class="mb-3">
                <label for="com_name" class="form-label">기업명:</label>
                <input type="text" id="com_name" name="com_name" class="form-control" value="${company.com_name}" required/>
                <div class="invalid-feedback">
                    기업명을 입력해 주세요.
                </div>
            </div>
            <div class="mb-3">
                <label for="com_size" class="form-label">기업규모:</label>
                <input type="text" id="com_size" name="com_size" class="form-control" value="${company.com_size}" required/>
                <div class="invalid-feedback">
                    기업규모를 입력해 주세요.
                </div>
            </div>
            <div class="mb-3">
                <label for="com_ceo" class="form-label">대표자:</label>
                <input type="text" id="com_ceo" name="com_ceo" class="form-control" value="${company.com_ceo}" required/>
                <div class="invalid-feedback">
                    대표자를 입력해 주세요.
                </div>
            </div>
            <div class="mb-3">
                <label for="com_addr" class="form-label">주소:</label>
                <input type="text" id="com_addr" name="com_addr" class="form-control" value="${company.com_addr}" required/>
                <div class="invalid-feedback">
                    주소를 입력해 주세요.
                </div>
            </div>
            <div class="mb-3">
                <label for="com_companynum" class="form-label">사업자번호:</label>
                <input type="text" id="com_companynum" name="com_companynum" class="form-control" value="${company.com_companynum}" required/>
                <div class="invalid-feedback">
                    사업자번호를 입력해 주세요.
                </div>
            </div>
            <div class="mb-3">
                <label for="com_tel" class="form-label">전화번호:</label>
                <input type="text" id="com_tel" name="com_tel" class="form-control" value="${company.com_tel}" required/>
                <div class="invalid-feedback">
                    전화번호를 입력해 주세요.
                </div>
            </div>
            <div class="mb-3">
                <label for="com_email" class="form-label">Email:</label>
                <input type="email" id="com_email" name="com_email" class="form-control" value="${company.com_email}" required/>
                <div class="invalid-feedback">
                    이메일을 입력해 주세요.
                </div>
            </div>
            <div class="mb-3">
                <label for="com_url" class="form-label">홈페이지:</label>
                <input type="url" id="com_url" name="com_url" class="form-control" value="${company.com_url}" required/>
                <div class="invalid-feedback">
                    홈페이지 주소를 입력해 주세요.
                </div>
            </div>
            <div>
                <button type="submit" class="btn btn-primary">수정하기</button>
            </div>
        </form>
    </div>
    
    <script>
        // Bootstrap의 폼 유효성 검사를 활성화하는 스크립트
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
        })()
    </script>
<!-- 작업공간 영역 끝 -->
<jsp:include page="../../footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>