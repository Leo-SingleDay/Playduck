<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>playduck - 상세보기</title>

<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/headerfooter.css">
<link rel="stylesheet" href="../resources/css/join.css">
<link rel="stylesheet" href="../resources/css/login.css">
<link rel="stylesheet" href="../resources/css/findIdPw.css">

<link rel="stylesheet" href="../resources/css/curation.css">


<script src="../resources/js/jquery-3.6.0.min.js"></script>
<script src="../resources/js/modal.js"></script>
<script src="../resources/js/topBtn.js"></script>
<script src="https://kit.fontawesome.com/2004329f9f.js" crossorigin="anonymous"></script>

<style>
body, html, section{
	min-height: 100%
}
</style>

</head>
<body>
	<h1 class="hidden">playduck</h1>
	<%@ include file="common/header.jsp"%>
	<section>
		<div class="curation_container">
			<img src="${pageContext.request.contextPath}/resources/curation/${culist.c_picrenamed }" alt="" />
		<p class="curation_title">${culist.c_title }</p>
		
		<div class="curation_content">
		
		${culist.c_content }
		</div>
		
		<p class="curation_writer">작성자 : ${culist.m_name }</p>
		</div>
		
		<c:if test="${member.m_no eq culist.m_no}">
		    &nbsp;
			<button class="cu_modifyBtn" type="button" onclick="location.href='${pageContext.request.contextPath}/curation/curationUpdateView.do?c_no=${culist.c_no}'">수정</button>
			<button class="cu_deleteBtn" type="button" onclick="location.href='${pageContext.request.contextPath}/curation/curationDelete.do?c_no=${culist.c_no}'">삭제</button>
			</c:if>
	</section>
<br /><br /><br /><br /><br /><br /><br /><br />
	<%@ include file="common/footer.jsp"%>
</body>

</html>