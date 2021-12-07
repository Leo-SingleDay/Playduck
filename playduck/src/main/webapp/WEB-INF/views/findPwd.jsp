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
            <div class="modal_findPwdDiv" title="아이디 비밀번호 찾기">
            <p class="modal_content_close"><a style="color:var(--black-color)" href="${pageContext.request.contextPath}/">X</a></p>
                <div class="modal_content findArea">
                    <div class="find_id">
                        <h2 class=find_title>비밀번호 변경</h2>
                        <form action="${pageContext.request.contextPath}/member/changePwd.do" method="post">
                        <p class="findPwd_result">변경할 비밀번호를 입력하세요</p><br><br>
                            <input type="password" name="m_pwd" id="mm_pwd" maxlength="20" onkeyup="isSame();" placeholder="비밀번호"/>
                            <input type="password" name="m_pwd2" id="mm_pwd2" onkeyup="isSame();" placeholder="비밀번호 확인"/>
                            <input type="hidden" name="m_email" value="${email}">
                            <div id="pwdValue"></div>
                            <button type="submit" class="login_box find orange">비밀번호 변경</button>
                        </form>
                    </div>

                </div>
            </div>
            	<%@ include file="common/footer.jsp"%>
</body>
<script>
    <!-- 비밀번호가 같은지를 확인하는 함수 -->
    function isSame(){
        var password = document.getElementById("mm_pwd").value;
        var passwordCheck = document.getElementById("mm_pwd2").value;
        console.log(password +" / " + passwordCheck);
        console.log(password == passwordCheck);
        if(password == passwordCheck){
	         document.getElementById("pwdValue").innerHTML = '비밀번호가 일치합니다.';
	         document.getElementById("pwdValue").style.color = 'blue';    
        }else{
            document.getElementById("pwdValue").innerHTML = '비밀번호가 일치하지 않습니다.';
            document.getElementById("pwdValue").style.color = 'red';  
        }
    }
</script>
</html>