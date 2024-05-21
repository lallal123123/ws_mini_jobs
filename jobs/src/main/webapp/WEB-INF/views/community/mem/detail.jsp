
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
</head>
<body>
	<jsp:include page="../../header.jsp"></jsp:include>
	<!-- 작업공간 영역 -->
	<div class="container">
		<div class="row">

			<div class="col-12">
				<div class="border p-3">
					

					
						
                        <a href="list"><button>전체게시글</button></a>
                        <c:if test="${loggedInMember.mem_id eq dto.mem_id}">
                            <a href="modify_form?no=${dto.mem_community_no}"><button>수정</button></a>
                            <a href="delete?no=${dto.mem_community_no}"><button>삭제</button></a>
                        </c:if>
						<div class="mb-3" id="title">
							${dto.title}
						</div>
                        <div class="mb-3" id="writerBox">
                            <c:if test="${dto.secret eq 0}">
							<div id="img">이미지위치</div>
                            <div id="writer">${dto.mem_id}<br>${dto.s_reg_date}</div>
                            </c:if>
                            <c:if test="${dto.secret eq 1}">
							<div id="img">비공개이미지위치</div>
                            <div id="writer">비공개<br>${dto.s_reg_date}</div>
                            </c:if>
						</div>
						<div class="mb-3" id="content">
							${dto.content}
						</div>
						<div class="mb-3" id="category">
							${dto.category}
						</div>
                        <form action="reply" method="post">
                            <div id="reply_id" name="com_id">${loggedInMember.mem_id}</div>
                            <input type="hidden" name="com_community_no" value="${dto.mem_community_no}">
                            <input type="hidden" name="com_no" value="${loggedInMember.mem_no}">
                            
                            <textarea name="content" class="form-control"></textarea><br>
						<button class="btn btn-jobs w-100">댓글등록</button>
                        </form>

                        <hr>
                        <div id="replyList">
                            <table>
                                <c:forEach var="reply" items="${rList}">
                                <tr>
                                    <td>${reply.content}</td>
                                    <td>${reply.mem_id}</td>
                                    <td>${reply.s_regdate} 
                                        <c:if test="${reply.mem_id eq loggedInMember.mem_id}">
                                            <a href="delete_reply?no=${reply.mem_reply_no}&community_no=${dto.mem_community_no}">X</a> 
                                        </c:if>
                                    </td>
                                </tr>
                                </c:forEach>

                            </table>

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