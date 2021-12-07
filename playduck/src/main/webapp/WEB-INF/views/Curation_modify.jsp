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


<!-- <script src="../resources/js/jquery-3.6.0.min.js"></script> -->

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">


<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">

<style>
body, html, section{
	min-height: 100%;
	background-color:var(--black-color);
}

.note-editable, .panel-heading, .note-btn{
	background-color: var(--black-color)
}
article, aside, details, figcaption, figure, footer, header, hgroup, main, menu, nav, section, summary{
display:flex;
}
</style>

</head>
<body>
	<h1 class="hidden">playduck</h1>
	<%@ include file="common/header.jsp"%>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
		<script src="../resources/js/modal.js"></script>
		<script src="../resources/js/topBtn.js"></script>
		<script src="https://kit.fontawesome.com/2004329f9f.js" crossorigin="anonymous"></script>
	<section>
		<div class="curation_container">
		<form name="curationFrm" action="${pageContext.request.contextPath}/curation/curationUpdate.do?c_no=${culist.c_no}" method="post" enctype="multipart/form-data">
			<img class="cuwrtie_img" src="${pageContext.request.contextPath}/resources/curation/${culist.c_picrenamed}" id="curationImg" alt="" />
			<input type="file" class="hidden" accept="image/*" name="c_pic_file" id="curationImg1" onchange="readURL(input)" />
			<input type="text" class="hidden" name="m_no" value="${member.m_no}">
			
			<script>
	        	$('#curationImg').on('click', function(){
	        		$('#curationImg1').click();
	        	})
	        	
	         // 사진 미리보기 구현
	        	 function readURL(input) {
      				  if (input.files && input.files[0]) {
         				  var reader = new FileReader();
          				  reader.onload = function(e) {
        	     		   $('#curationImg').attr('src', e.target.result);
          			  }
         		   reader.readAsDataURL(input.files[0]);
      			  }
   					 }

    				$("#curationImg1").change(function() {
       				 readURL(this);
   				 });

	        </script>
			
			<div class="curation_title" >
		<span>제목</span> <input type="text" id="curation_titleArea" name="c_title" value="${culist.c_title }"/>
		   </div>
		<textarea id="summernote" name="c_content">${culist.c_content }</textarea>
		
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script>
        $('#summernote').summernote();
    </script>
		
		<input type="submit" class="curation_writeBtn" value="리뷰 수정하기"></input>
		</form>
		</div>
	</section>
<br /><br /><br /><br /><br /><br /><br /><br />
	<%@ include file="common/footer.jsp"%>
</body>

</html>