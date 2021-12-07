<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>관리자 페이지 - 취소 관리</title>
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

        <div class="AD_main_cancelList">

            <div class="AD_cancelList_title">취소 관리</div>
<%-- 			<p>총 ${totalContents}개의 상품이 있습니다.</p> --%>
            <div class="AD_cancelList_search_img">

                <input type="text" class="searchbox" onkeyup="enterkey();">
                <img src="../resources/images/search.png" class="searchGo">
            </div>


            <table class="AD_cancelList_table">
                <thead>
                    <tr>
                        <th></th>
                        <th>회원명</th>
                        <th></th>
                        <th>상품명</th>
                        <th>가격</th>
                        <th>수량</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${clist}" var="ci" >
                    <tr>
                        <td>${ci.o_no}</td>
                        <td>${ci.m_name }</td>
                        <td><img src="${ci.d_pic}"></td>
                        <td>${ci.d_title}</td>
                        <td>${ci.d_price}</td>
                        <td>${ci.o_quan}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
			<c:out value="${pageBar}" escapeXml="false"/>
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
				
			location.href = "${pageContext.request.contextPath}/adminpage/admincancelsr.do?text="+a;
		}
    }
}



	$(function() {
		$('.searchGo').on("click", function() {
			if ($('.searchbox').val() == "") {
				alert("입력 해주세요");
			} else {
				
				var a = $('.searchbox').val();
					
				location.href = "${pageContext.request.contextPath}/adminpage/admincancelsr.do?text="+a;
			}
		})
	})
</script>
</html>