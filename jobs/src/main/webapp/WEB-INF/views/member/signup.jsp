<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
</head>
<body>
    <h1>Create Member</h1>
    <form action="${pageContext.request.contextPath}/members" method="post">
        <div>
            <label>ID:</label>
            <input type="text" name="mem_id" />
        </div>
        <div>
            <label>Password:</label>
            <input type="password" name="mem_pw" />
        </div>
        <div>
            <label>Name:</label>
            <input type="text" name="mem_name" />
        </div>
        <div>
            <label>Birth Date:</label>
            <input type="text" name="mem_birth" />
        </div>
        <div>
            <label>Phone:</label>
            <input type="text" name="mem_tel" />
        </div>
        <div>
            <label>Email:</label>
            <input type="email" name="mem_email" />
        </div>
        <div>
            <label>Gender:</label>
            <input type="text" name="mem_gender" />
        </div>
        <button type="submit">Save</button>
    </form>
</body>
</html>
