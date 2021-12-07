<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 리뷰 관리</title>
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/headerfooter.css">
<link rel="stylesheet" href="../resources/css/sidevar.css">
<link rel="stylesheet" href="../resources/css/admin.css">
<link rel="stylesheet" href="../resources/css/pagination.css">
    <style>
    .page-link{
    color:var(--black-color);
    }
    </style>

<script src="../resources/js/jquery-3.6.0.min.js"></script>

</head>

<body>

	<%@ include file="sidevar.jsp"%>

	<div class="AD_main_container">

		<div class="AD_main_reviewList">

			<div class="AD_reviewList_title">리뷰 관리</div>

			<div class="AD_reviewList_search_img">

				<input type="text" class="searchbox" onkeyup="enterkey();">
				<img src="../resources/images/search.png" class="searchGo">
			</div>


			<table class="AD_reviewList_table">
				<thead>
					<tr>
						<th></th>
						<th>회원명</th>
						<th>한줄평</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="r">
						<tr id="${r.r_no}">
							<td>${r.r_no}</td>
							<td>${r.m_name}</td>
							<td>${r.r_content}</td>
							<td><div class="reviewList_button_div">
									<button class="reviewList_button "
										onclick="deleteReview(${r.r_no});">삭제</button>
								</div></td>
						</tr>
					</c:forEach>

				</tbody>

			</table>
			
		</div>

	</div>
<c:out value="${pageBar}" escapeXml="false" />
</body>
<%@ include file="../common/footer.jsp"%>

<script>
function enterkey() {
    if (window.event.keyCode == 13) {

    	if ($('.searchbox').val() == "") {
			alert("입력 해주세요");
		} else {
			
			var a = $('.searchbox').val();
				
			location.href = "${pageContext.request.contextPath}/admin2/reviewSr.do?text="+a;
		}
    }
}



	$(function() {
		$('.searchGo').on("click", function() {
			if ($('.searchbox').val() == "") {
				alert("입력 해주세요");
			} else {
				
				var a = $('.searchbox').val();
					
				location.href = "${pageContext.request.contextPath}/admin2/reviewSr.do?text="+a;
			}
		})
	})

	function deleteReview(r_no) {

		alert("삭제 됐습니다");
		
		var b = r_no;

		location.href = "${pageContext.request.contextPath}/admin2/reviewDe.do?r_no="+b;
		
	}
</script>

</html>