<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Company Profile</title>
</head>
<body>
    <h1>기업정보수정</h1>
    <form action="${pageContext.request.contextPath}/companies/updateProfile" method="post">
        <div>
            <label for="com_id">아이디:</label>
            <input type="text" id="com_id" name="com_id" value="${company.com_id}" readonly/>
        </div>
        <div>
            <label for="com_pw">비밀번호:</label>
            <input type="password" id="com_pw" name="com_pw" value="${company.com_pw}" />
        </div>
        <div>
            <label for="com_name">기업명:</label>
            <input type="text" id="com_name" name="com_name" value="${company.com_name}" />
        </div>
        <div>
            <label for="com_size">기업규모:</label>
            <input type="text" id="com_size" name="com_size" value="${company.com_size}" />
        </div>
        <div>
            <label for="com_ceo">대표자:</label>
            <input type="text" id="com_ceo" name="com_ceo" value="${company.com_ceo}" />
        </div>
        <div>
            <label for="com_addr">주소:</label>
            <input type="text" id="com_addr" name="com_addr" value="${company.com_addr}" />
        </div>
        <div>
            <label for="com_companynum">사업자번호:</label>
            <input type="text" id="com_companynum" name="com_companynum" value="${company.com_companynum}" />
        </div>
        <div>
            <label for="com_tel">전화번호:</label>
            <input type="text" id="com_tel" name="com_tel" value="${company.com_tel}" />
        </div>
        <div>
            <label for="com_email">Email:</label>
            <input type="text" id="com_email" name="com_email" value="${company.com_email}" />
        </div>
        <div>
            <label for="com_url">홈페이지:</label>
            <input type="text" id="com_url" name="com_url" value="${company.com_url}" />
        </div>
        <div>
            <button type="submit">수정하기</button>
        </div>
    </form>
</body>
</html>
