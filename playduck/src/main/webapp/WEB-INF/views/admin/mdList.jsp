<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 목록 조회</title>
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/headerfooter.css">
<link rel="stylesheet" href="../resources/css/sidevar.css">
<link rel="stylesheet" href="../resources/css/admin.css">
<link rel="stylesheet" href="../resources/css/pagination.css">
<script src="../resources/js/jquery-3.6.0.min.js"></script>
    <style>
    .page-link{
    color:var(--black-color);
    }
    </style>

</head>

<body>


	<%@ include file="sidevar.jsp"%>

	<div class="AD_main_container">

		<div class="AD_main_mdList">

			<div class="AD_mdList_title">목록 조회</div>

			<div class="AD_mdList_search_img">

				<input type="text" class="searchbox" onkeyup="enterkey();">
				<img src="../resources/images/search.png" class="searchGo">
			</div>


			<table class="AD_mdList_table">
				<thead>
					<tr>
						<th></th>
						<th></th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="m"  varStatus="status">
						<tr id="${m.d_no}">
							<td>${m.d_no}</td>
							<td><img src="${m.d_pic}"></td>
							<td>${m.d_title}</td>
							<td>${m.d_price}</td>
							<td>${list1[status.index].d_quan}</td>
							<td><button class="mdList_button"
									onclick="updateMD(${m.d_no});">수정</button></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
			<c:out value="${pageBar}" escapeXml="false" />
		</div>

	</div>
</body>
<%@ include file="../common/footer.jsp"%>
<script>
	function enterkey() {
		if (window.event.keyCode == 13) {

			if ($('.searchbox').val() == "") {
				alert("입력 해주세요");
			} else {

				var a = $('.searchbox').val();

				location.href = "${pageContext.request.contextPath}/admin2/MdSr.do?text="
						+ a;
			}
		}
	}

	$(function() {
		$('.searchGo')
				.on(
						"click",
						function() {
							if ($('.searchbox').val() == "") {
								alert("입력 해주세요");
							} else {

								var a = $('.searchbox').val();

								location.href = "${pageContext.request.contextPath}/admin2/reviewSr.do?text="
										+ a;
							}
						})
	})
	
	function updateMD(d_no) {
		
		var b = d_no;

		location.href = "${pageContext.request.contextPath}/admin2/updateMD?d_no="+b;
		
	}
</script>


</html>