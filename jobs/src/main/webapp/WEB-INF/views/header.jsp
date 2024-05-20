<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jobs 휴먼 클라우드 이력관리플렛폼</title>
</head>

<header class="py-3 mb-4 border-bottom">
    <div class="container">
        <div class="d-flex flex-wrap justify-content-center">
            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                <img class="header_logo_size" src="/images/common/logo.png" alt="로고">
            </a>

            <div class="ms-auto overflow-hidden">
                <div class="input-group search-box float-start me-2">
                    <input type="text" class="form-control" placeholder="통합검색" aria-label="통합검색" aria-describedby="button-addon2">
                    <button class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
                </div>
                <div class="float-end">
                    <c:choose>
                        <c:when test="${not empty sessionScope.loggedInMember}">
                            <a href="/members/mypage" class="btn btn-jobs">마이 페이지</a>
                            <a href="/members/logout" class="btn btn-jobs">로그아웃</a>
                            <span>환영합니다, ${sessionScope.loggedInMember.mem_id}님!</span>
                            <c:if test="${sessionScope.isAdmin == true}">
                                <a href="/admin/dashboard" class="btn btn-jobs">관리자 모드</a>
                            </c:if>
                        </c:when>
                        <c:when test="${not empty sessionScope.loggedInCompany}">
                            <a href="/companies/mypage" class="btn btn-jobs">마이 페이지</a>
                            <a href="/companies/logout" class="btn btn-jobs">로그아웃</a>
                            <span>환영합니다, ${sessionScope.loggedInCompany.com_id}님!</span>
                        </c:when>
                        <c:otherwise>
                            <a href="/members/loginForm" class="btn btn-jobs">로그인</a>
                            <a href="/members/signup" class="btn btn-jobs">회원가입</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <ul class="nav nav-pills nav-jobs mt-2 justify-content-end">
            <li class="nav-item"><a href="#" class="nav-link" aria-current="page">채용정보</a></li>
            <li class="nav-item"><a href="#" class="nav-link">공고캘린더</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/companies" class="nav-link">기업정보</a></li>
            <li class="nav-item"><a href="#" class="nav-link">커뮤니티</a></li>
            <li class="nav-item"><a href="#" class="nav-link">고객센터</a></li>
        </ul>
    </div>
</header>

</html>
