<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원 가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>회원 가입</h2>
        <form:form action="${pageContext.request.contextPath}/members" method="post" modelAttribute="member">
            <div class="form-group">
                <label for="mem_id">아이디</label>
                <form:input path="mem_id" id="mem_id" />
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <form:input path="name" id="name" />
            </div>
            <div class="form-group">
                <label for="email">이메일</label>
                <form:input path="email" id="email" />
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <form:password path="password" id="password" />
            </div>
            <div class="form-group">
                <button type="submit">가입하기</button>
            </div>
        </form:form>
    </div>
</body>
</html>
