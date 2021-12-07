<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="AD_sidevar_container">

	<div class="AD_sidevar_title">

		<a href="${pageContext.request.contextPath}/"><img
			class="header_logo"
			src="${pageContext.request.contextPath}/resources/images/logo.png"
			alt=""></a>
	</div>

	<div>
		<table class="AD_sidevar_member">
			<thead>
				<tr>
					<th>회원 관리</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><a
						href="${pageContext.request.contextPath}/adminpage/admin.do">회원
							관리</a></td>
				</tr>
				<tr>
					<td onClick="reviewListPage();">리뷰 관리</td>
				</tr>
			</tbody>
		</table>

	</div>
	<div>
		<table class="AD_sidevar_shopping">
			<thead>
				<tr>
					<th>MD 쇼핑</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td onClick="mdListPage();">목록 조회</td>
				</tr>
				<tr>
					<td onClick="mdEnroll();">상품 등록</td>
				</tr>
				<tr>
					<td onClick="saleList();">판매 목록</td>
				</tr>
				<tr>
					<td><a
						href="${pageContext.request.contextPath}/adminpage/admincancel.do">취소
							관리</td>
				</tr>
				<tr>
					<td><a
						href="${pageContext.request.contextPath}/adminpage/adminreturn.do">반품
							관리</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>


<script>
	function reviewListPage() {
		location.href = "${pageContext.request.contextPath}/admin2/reviewList.do"
	}

	function mdEnroll() {
		location.href = "${pageContext.request.contextPath}/admin2/mdEnroll.do"
	}

	function mdListPage() {
		location.href = "${pageContext.request.contextPath}/admin2/mdListPage.do"
	}

	function saleList() {
		location.href = "${pageContext.request.contextPath}/admin2/saleList.do"
	}
</script>
