<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jobs 휴먼 클라우드 이력관리플렛폼</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet">
<style>
    .btn-notification {
        position: relative;
        border: none;
        background: none;
        padding: 0;
    }
    .btn-notification:focus {
        outline: none;
        box-shadow: none;
    }
    .notification-bell {
        font-size: 24px;
        color: rgb(56, 56, 53);
    }
    .notification-count {
        position: absolute;
        top: -10px;
        right: -10px;
        background-color: red;
        color: white;
        border-radius: 50%;
        padding: 2px 6px;
        font-size: 12px;
    }
    .modal-header, .modal-footer {
        border: none;
    }
    .modal-content {
        border: none;
        box-shadow: none;
    }
</style>
</head>
<body>
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
                <div class="float-end d-flex align-items-center">
                    <c:choose>
                        <c:when test="${not empty sessionScope.loggedInMember || not empty sessionScope.loggedInCompany}">
                            <button class="btn btn-notification" data-bs-toggle="modal" data-bs-target="#notificationModal" onclick="loadJobPostings('${sessionScope.loggedInMember.mem_id}')">
                                <i class="bi bi-bell notification-bell"></i>
                                <c:if test="${notificationCount > 0}">
                                    <span class="notification-count">${notificationCount}</span>
                                </c:if>
                            </button>
                        </c:when>
                    </c:choose>
                    <c:choose>
                        <c:when test="${not empty sessionScope.loggedInMember}">
                            <c:if test="${sessionScope.isAdmin == true}">
                                <a href="/admin99/getTotalRegistrations" class="btn btn-jobs ms-2">관리자 모드</a>
                            </c:if>
                            <a href="/members/mypage" class="btn btn-jobs ms-2">마이 페이지</a>
                            <a href="/members/logout" class="btn btn-jobs ms-2">로그아웃</a>
                            <span>환영합니다, ${sessionScope.loggedInMember.mem_id}님!</span>
                        </c:when>
                        <c:when test="${not empty sessionScope.loggedInCompany}">
                            <a href="/companies/mypage" class="btn btn-jobs">마이 페이지</a>
                            <a href="/companies/logout" class="btn btn-jobs ms-2">로그아웃</a>
                            <span>환영합니다, ${sessionScope.loggedInCompany.com_id}님!</span>
                        </c:when>
                        <c:otherwise>
                            <a href="/members/loginForm" class="btn btn-jobs">로그인</a>
                            <a href="/members/signup" class="btn btn-jobs ms-2">회원가입</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <ul class="nav nav-pills nav-jobs mt-2 justify-content-end">
            <li class="nav-item"><a href="#" class="nav-link" aria-current="page">채용정보</a></li>
            <li class="nav-item"><a href="#" class="nav-link">공고캘린더</a></li>
            <li class="nav-item"><a href="${pageContext.request.contextPath}/companies" class="nav-link">기업정보</a></li>
            <c:if test="${loggedInCompany ne null}">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/community/company/main" class="nav-link">커뮤니티</a></li>
            </c:if>
             <c:if test="${loggedInMember ne null}">
            <li class="nav-item"><a href="${pageContext.request.contextPath}/community/member/main" class="nav-link">커뮤니티</a></li>
            </c:if>
            <li class="nav-item"><a href="/cs_list_99" class="nav-link">고객센터</a></li>
        </ul>
    </div>
</header>

<!-- 알림 모달 -->
<div class="modal fade" id="notificationModal" tabindex="-1" aria-labelledby="notificationModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="notificationModalLabel">알림</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" id="jobPostingsBody">
                관심 등록한 회사의 채용 공고가 등록되었습니다.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"></script>
<script>
    function loadJobPostings(mem_id) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '${pageContext.request.contextPath}/api/jobPostings?mem_id=' + encodeURIComponent(mem_id), true);
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var jobPostings = JSON.parse(xhr.responseText);
                var jobPostingsBody = document.getElementById('jobPostingsBody');
                jobPostingsBody.innerHTML = '';

                jobPostings.forEach(function(job) {
                    jobPostingsBody.innerHTML += `
                        <div class="card mb-2">
                            <div class="card-body">
                                <h5 class="card-title">${job.title}</h5>
                                <p class="card-text">${job.description}</p>
                                <a href="${pageContext.request.contextPath}/recruit_detail.jsp?id=${job.recruit_no}" class="btn btn-primary">자세히 보기</a>
                            </div>
                        </div>
                    `;
                });
            }
        };
        xhr.send();
    }
</script>
</body>
</html>
