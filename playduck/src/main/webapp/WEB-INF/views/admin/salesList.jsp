<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="../resources/js/jquery-3.6.0.min.js"></script>
<html>

<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 판매 목록</title>
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/headerfooter.css">
<link rel="stylesheet" href="../resources/css/sidevar.css">
<link rel="stylesheet" href="../resources/css/admin.css">
<link rel="stylesheet" href="../resources/css/pagination.css">
<script src="../resources/js/jquery-3.6.0.min.js"></script>
<style>
.page-link {
	color: var(--black-color);
}
</style>


</head>

<body>

	<%@ include file="sidevar.jsp"%>

	<div class="AD_main_container">

		<div class="AD_main_salesList">

			<div class="AD_salesList_title">판매 목록</div>

			<div class="AD_salesList_search_img">

				<input type="text" class="searchbox" onkeyup="enterkey();">
				 <img src="../resources/images/search.png" class="searchGo">
			</div>


			<table class="AD_salesList_table">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>회원명</th>
						<th></th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>현황</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="li">
						<tr>
							<td>${li.o_no}</td>
							<td>${li.m_name}</td>
							<td><img src="${li.d_pic}"></td>
							<td>${li.d_title}</td>
							<td>${li.d_price * li.o_quan}</td>
							<td>${li.o_quan}</td>
							<c:if test="${li.o_status == 1}">
							<td><button class="salesList_button">구매 확정</button></td>
							</c:if>
							<c:if test="${li.o_status == 2}">
							<td><button class="salesList_button">구매 취소</button></td>
							</c:if>
							<c:if test="${li.o_status == 3}">
							<td><button class="salesList_button">반품 진행</button></td>
							</c:if>
							<c:if test="${li.o_status == 4}">
							<td><button class="salesList_button">반품 완료</button></td>
							</c:if>
							
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

			location.href = "${pageContext.request.contextPath}/admin2/OrSe.do?text="
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

								location.href = "${pageContext.request.contextPath}/admin2/OrSe.do?text="
										+ a;
							}
						})
	})
</script>

</html>