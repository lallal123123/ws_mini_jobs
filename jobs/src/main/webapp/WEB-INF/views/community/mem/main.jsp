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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


<style>
#searchBox {
	text-align: center;
}

#pageBox {
	text-align: center;
}

.top {
	display: inline-block;


}

#hotList{
	margin-right:20px;
	width:800px;
}

.bi-wechat{
	width:23px;
	height:23px;
}

#hotListAndCom {
    display: flex;
    justify-content: space-between;
}

#hotList {
    flex: 7;
    margin-right: 20px;
}

#info {
    flex: 3;
    display: flex;
    flex-direction: column;
}

#img{
	flex: 7;
}
#hotListTable {
 	width:100%;
}

#hotListTable td#td1 {
width:60%;
}
#hotListTable td#td2 {
width:20%;
}
#hotListTable td#td3 {
width:20%;
}

#img{

display: inline-block;
 height: 50px; /* 원하는 높이로 설정 */
    line-height: 50px; /* 텍스트를 수직으로 중앙 정렬 */
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
					<div>실시간 전체글 ${cnt }개<a href="list"><button>전체글보기</button></a></div>
					<div id="hotListAndCom">
						<span class="top border p-3" id="hotList"> <label>HOT
								전체 인기 글 </label> <a href="">더보기></a><br>
							<hr>
							<table id="hotListTable" class="border p-3">
								<c:forEach var="dto" items="${ hList}">
									<tr>
										<td id="td1"><a href="detail?no=${dto.mem_community_no }"> ${dto.title }</a></td>
										<td id="td2"><i class="bi bi-wechat" ></i>  ${dto.replyCnt }  </td>
										<td id="td3"><img src="${pageContext.request.contextPath}/images/common/eye_icon.png" alt="사람눈" width="30px" height="30px">  ${dto.views }</td>
									</tr>
								</c:forEach>
							</table>
						</span> <span class="top border p-3" id="info"> <span id="img">사진공간</span><span id="com_id">${loggedInMember.mem_id }님</span><br>
							<a href="write_form"> <button>게시글작성</button></a><br>
							<div>내가 작성한 글 <a href="list?mem_no=${loggedInMember.mem_no }">${cntMemWrite }개</a></div><br>
							내가 작성한 댓글 ${cntMemReply }개

						</span>
					</div>
					<div id="categoryList">
						<div>주제별 커뮤니티</div>
						<div id="category">
							<c:forEach var="c" items="${ cList}">
								<a href="main?category=${c.ch_category }"><button>${c.ch_category }></button></a>
							</c:forEach>

						</div>
						<span>
							<div>
								<div id="categoryName">
									${category } <a href="list?category=${category }"> 더보기> </a>
								</div>

								<table class="table">

									<c:forEach var="dto" items="${chList}">
										<tr>
											<td><a href="detail?no=${dto.mem_community_no }">${dto.title }</a></td>
											<td><i class="bi bi-wechat"></i>${dto.replyCnt }</td>
											<td>${dto.views }</td>
										</tr>
									</c:forEach>
								</table>
							</div>

						</span>
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


</body>
</html>