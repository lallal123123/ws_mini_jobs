<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="/css/common.css" rel="stylesheet">
<style>

#searchBox {
    text-align: center;
}
#pageBox {
    text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<!-- 작업공간 영역 -->
	<div class="container">
		<div class="row">

			<div class="col-12">
				<div class="border p-3">
					<h1>게시글 전체 방(개인)</h1>

					<a href="write_form">게시글 작성하기</a><br>
					<form action="list" method="post">
						<label for="" class="form-label">카테고리</label> 
							<select class="form-control" name="category">
								<option value="">선택해주세요</option>
								<c:forEach var="dto" items="${clist}">									
									<option class="option_category" value="${dto.ch_category}">${dto.ch_category}</option>
								</c:forEach>
							</select>
							<button>보기</button>
					</form>
					<table class="table">
						<thead>
							<tr>
								<th scope="col">카테고리</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dto" items="${list }">
								<tr>
									<td>${dto.category }</td>
									<td><a href="detail?no=${dto.mem_community_no}">
											${dto.title } </a></td>
									<c:if test="${dto.secret eq 0}">
										<td>${dto.mem_id}</td>
									</c:if>
									<c:if test="${dto.secret eq 1}">
										<td>비공개</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div id="pageBox">

						<c:if test="${pagination.pageBlock ne 1 }">
							<button id="preBtn" onclick="pre()">[이전]</button>
						</c:if>

						<c:if test="${pagination.end < pagination.endMax }">
							<!-- 삼항연산자로 코드 간결하게 가능!!!! -->
							<c:forEach var="x" begin="${pagination.begin }"
								end="${pagination.end }">
								<c:if test="${x eq pagination.page}">
									 ${x }
								</c:if>
								<c:if test="${x ne pagination.page}">
									<c:if test="${search eq null && category eq null && mem_no eq null} ">
										<a href="list?page=${x }">${x }</a>
									</c:if>
									<c:if test="${category ne null }">
										<a href="list?page=${x }&category=${category}">${x }</a>
									</c:if>
									<c:if test="${search ne null }">
										<a href="list?page=${x }&search=${search}">${x }</a>
									</c:if>
									<c:if test="${mem_no ne null }">
										<a href="list?page=${x }&com_no=${mem_no}">${x }</a>
									</c:if>
								</c:if>
							</c:forEach>
						</c:if>

						<c:if test="${pagination.end >= pagination.endMax }">
							<c:forEach var="x" begin="${pagination.begin }"
								end="${pagination.endMax }">
								<c:if test="${x eq pagination.page}">
									 ${x }
	 							</c:if>
								<c:if test="${x ne pagination.page}">
									<c:if test="${search eq null && category eq null && mem_no eq null} ">
										<a href="list?page=${x }">${x }</a>
									</c:if>
									<c:if test="${category ne null }">
										<a href="list?page=${x }&category=${catagory}">${x }</a>
									</c:if>
									<c:if test="${search ne null }">
										<a href="list?page=${x }&search=${search}">${x }</a>
									</c:if>
									<c:if test="${mem_no ne null }">
										<a href="list?page=${x }&com_no=${mem_no}">${x }</a>
									</c:if>
								</c:if>
							</c:forEach>
						</c:if>

						<c:if test="${pagination.pageBlock ne pagination.pageBlockMax }">
							<button id="nextBtn" onclick="next()">[다음]</button>
						</c:if>
					</div>
					<div id="searchBox" >
						<form action="list" method="post">
							<input type="text"  name="search">
							<button>내용검색</button>
						</form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- 작업공간 영역 끝 -->
	<jsp:include page="../../footer.jsp"></jsp:include>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>

	<script>
		//alert("${pageBlock}");
		function next() {
			if("${search}" == ""&& "${category}" ==""){
				location.href = "pageNext?pageBlock=${pagination.pageBlock }";
			}else if("${search}" !== ""){
				location.href = "pageNext?pageBlock=${pagination.pageBlock }&search=${search}";
			}else if("${category}" !== ""){
				location.href = "pageNext?pageBlock=${pagination.pageBlock }&category=${category}";
			}else if("${com_no}" !== ""){
				location.href = "pageNext?pageBlock=${pagination.pageBlock }&com_no=${com_no}";
			}
			
		}

		function pre() {
			if("${search}" == ""&& "${category}" ==""){
			location.href = "pagePre?pageBlock=${pagination.pageBlock }";
			}else if("${search}" !== ""){
				location.href = "pagePre?pageBlock=${pagination.pageBlock }&search=${search}";
			}else if("${category}" !== ""){
				location.href = "pagePre?pageBlock=${pagination.pageBlock }&category=${category}";
			}else if("${com_no}" !== ""){
				location.href = "pagePre?pageBlock=${pagination.pageBlock }&com_no=${com_no}";
			}
		}
		
		document.addEventListener("DOMContentLoaded", function() {
            let c_options = document.querySelectorAll(".option_category");
            c_options.forEach(option => {
                if (option.value == "${category}") {
                    option.selected = true;
                }
            });
            
        });
	</script>
</body>
</html>