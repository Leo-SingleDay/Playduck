<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/findIdPw.css">
<link rel="stylesheet" href="../resources/css/headerfooter.css">
<link rel="stylesheet" href="../resources/css/join.css">
<link rel="stylesheet" href="../resources/css/login.css">
<style>
body,html{
height: 100%}
</style>
</head>
<body>
	
	<%@ include file="common/header.jsp"%>
            <div class="modal_findIdDiv" title="아이디 비밀번호 찾기">
                <div class="modal_content findArea">
                    <div class="find_id">
                        <h2 class=find_title>아이디 찾기</h2>
                            <p class="findId_result">${ m_name } 님의 아이디는</p>
                            <p class="findId_result">( ${ m_id } )입니다.</p>
                            <button type="submit" class="login_box find orange"><a href="${pageContext.request.contextPath}/">메인으로 이동</a></button>
                    </div>
                </div>
            </div>
    <%@ include file="common/footer.jsp"%>
    
</body>
</html>