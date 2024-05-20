<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>jobs 휴먼 클라우드 이력관리플렛폼</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/css/common.css" rel="stylesheet">
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div class="col-3">
            <div class="border p-3">
                <ul class="nav nav-pills flex-column mb-auto">
                    <!-- 여기에 메뉴를 나열해주세요 사이드바-->
                    <li class="nav-item"><a href="#" class="nav-link active" aria-current="page"> 메뉴1 </a></li>
                    <li><a href="#" class="nav-link link-body-emphasis"> 메뉴2 </a></li>
                </ul>
            </div>
        </div>
        <!-- 여긴 내용 -->

        <div class="col-9">
            <div class="border p-3">

                <form id="resumeForm" action="member_mypage_resume_write" method="post">
                    <div class="mb-3">
                        <label for="" class="form-label">희망직무</label>
                        <select class="form-select" name="hope_job" onchange="toggleTitleInput()">
                            <option value="디자인">디자인</option>
                            <option value="교육">교육</option>
                            <option value="개발-데이터">개발-데이터</option>
                            <option value="공공-복지">공공-복지</option>
                            <option value="미디어-문화-스포츠">미디어-문화-스포츠</option>
                        </select>
                    </div>

                    <div class="mb-3" id="titleInput" style="display: none;">
                        <label for="" class="form-label">제목</label>
                        <input type="text" class="form-control" name="title" placeholder="이력서 제목">
                    </div>

                    <!-- 나머지 폼 요소들 -->

                    <input type="submit" class="btn btn-jobs w-100" value="이력서 저장하기">
                </form>

            </div>
        </div><!-- 끝나는 부분 -->
    </div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script>
    function toggleTitleInput() {
        var selectBox = document.getElementsByName("hope_job")[0];
        var titleInput = document.getElementById("titleInput");

        if (selectBox.value === "개발-데이터") {
            titleInput.style.display = "block";
        } else {
            titleInput.style.display = "none";
        }
    }
</script>

</body>
</html>