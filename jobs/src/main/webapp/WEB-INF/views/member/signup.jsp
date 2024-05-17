<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
<div class="container">
    <h2>회원가입</h2>
    <ul class="nav nav-tabs" id="signupTab" role="tablist">
        <li class="nav-item">
            <a class="nav-link active" id="member-tab" data-toggle="tab" href="#member" role="tab" aria-controls="member" aria-selected="true">회원가입</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" id="company-tab" data-toggle="tab" href="#company" role="tab" aria-controls="company" aria-selected="false">기업 회원가입</a>
        </li>
    </ul>
    <div class="tab-content" id="signupTabContent">
        <!-- 일반 회원 가입 폼 -->
        <div class="tab-pane fade show active" id="member" role="tabpanel" aria-labelledby="member-tab">
            <form:form action="${pageContext.request.contextPath}/members/insertMember" method="post" modelAttribute="member">
                <div class="form-group">
                    <label for="mem_id">아이디</label>
                    <form:input path="mem_id" id="mem_id" cssClass="form-control"/>
                    <button type="button" id="checkMemIdBtn" class="btn btn-secondary">중복 체크</button>
                    <span id="idCheckResultMember"></span>
                </div>
                <div class="form-group">
                    <label for="mem_pw">비밀번호</label>
                    <form:password path="mem_pw" id="mem_pw" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="mem_name">이름</label>
                    <form:input path="mem_name" id="mem_name" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="mem_birth">생년월일</label>
                    <form:input path="mem_birth" id="mem_birth" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="mem_tel">전화번호</label>
                    <form:input path="mem_tel" id="mem_tel" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="mem_email">이메일</label>
                    <form:input path="mem_email" id="mem_email" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="mem_gender">성별</label>
                    <form:input path="mem_gender" id="mem_gender" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">회원가입</button>
                </div>
            </form:form>
        </div>
        <!-- 기업 회원 가입 폼 -->
        <div class="tab-pane fade" id="company" role="tabpanel" aria-labelledby="company-tab">
            <form:form action="${pageContext.request.contextPath}/companies/insertCompany" method="post" modelAttribute="company">
                <div class="form-group">
                    <label for="com_id">아이디</label>
                    <form:input path="com_id" id="com_id" cssClass="form-control"/>
                    <button type="button" id="checkComIdBtn" class="btn btn-secondary">중복 체크</button>
                    <span id="idCheckResultCompany"></span>
                </div>
                <div class="form-group">
                    <label for="com_pw">비밀번호</label>
                    <form:password path="com_pw" id="com_pw" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="com_name">회사 이름</label>
                    <form:input path="com_name" id="com_name" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="com_size">회사 규모</label>
                    <form:input path="com_size" id="com_size" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="com_ceo">대표자</label>
                    <form:input path="com_ceo" id="com_ceo" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="com_addr">주소</label>
                    <form:input path="com_addr" id="com_addr" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="com_companynum">사업자 번호</label>
                    <form:input path="com_companynum" id="com_companynum" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="com_tel">전화번호</label>
                    <form:input path="com_tel" id="com_tel" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="com_email">이메일</label>
                    <form:input path="com_email" id="com_email" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label for="com_url">홈페이지</label>
                    <form:input path="com_url" id="com_url" cssClass="form-control"/>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">기업 회원가입</button>
                </div>
            </form:form>
        </div>
    </div>
    <a href="${pageContext.request.contextPath}/members/index">메인으로 돌아가기</a>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
    $('#checkMemIdBtn').click(function() {
        var mem_id = $('#mem_id').val();
        $.ajax({
            url: '${pageContext.request.contextPath}/members/checkId',
            type: 'GET',
            data: { id: mem_id },
            success: function(response) {
                if(response) {
                    $('#idCheckResultMember').text('아이디가 이미 존재합니다.').css('color', 'red');
                } else {
                    $('#idCheckResultMember').text('사용 가능한 아이디입니다.').css('color', 'green');
                }
            }
        });
    });
    
    $('#checkComIdBtn').click(function() {
        var com_id = $('#com_id').val();
        $.ajax({
            url: '${pageContext.request.contextPath}/members/checkId',
            type: 'GET',
            data: { id: com_id },
            success: function(response) {
                if(response) {
                    $('#idCheckResultCompany').text('아이디가 이미 존재합니다.').css('color', 'red');
                } else {
                    $('#idCheckResultCompany').text('사용 가능한 아이디입니다.').css('color', 'green');
                }
            }
        });
    });
});
</script>
</body>
</html>

