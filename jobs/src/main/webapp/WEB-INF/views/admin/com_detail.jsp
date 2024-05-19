<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>기업 상세 정보</title>
</head>
<body>
    <header>
        <h1>기업 상세 정보</h1>
    </header>
    <main>
        <p><strong>기업 번호:</strong> <span>${company.com_no}</span></p>
        <p><strong>아이디:</strong> <span>${company.com_id}</span></p>
        <p><strong>이름:</strong> <span>${company.com_name}</span></p>
        <p><strong>규모:</strong> <span>${company.com_size}</span></p>
        <p><strong>대표:</strong> <span>${company.com_ceo}</span></p>
        <p><strong>주소:</strong> <span>${company.com_addr}</span></p>
        <p><strong>사업자 번호:</strong> <span>${company.com_companynum}</span></p>
        <p><strong>전화번호:</strong> <span>${company.com_tel}</span></p>
        <p><strong>이메일:</strong> <span>${company.com_email}</span></p>
        <p><strong>웹사이트:</strong> <span>${company.com_url}</span></p>
        <p><strong>가입 날짜:</strong> <span>${company.make_date}</span></p>
    </main>
</body>
</html>
