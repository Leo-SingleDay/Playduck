<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>관리자 페이지 - 회원 목록</title>
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

        <div class="AD_main_memberlist">

            <div class="AD_memberlist_title">회원 목록</div>
			
            <div class="AD_memberlist_search_img">

                <input type="text" class="searchbox" onkeyup="enterkey();">
                <img src="../resources/images/search.png" class="searchGo">
            </div>

			<p>총 ${totalContents}명의 회원이 있습니다.</p>
            <table class="AD_memberlist_table">
                <thead>
                    <tr>
                        <th></th>
                        <th style="width:200px">회원명</th>
                        <th style="width:250px">리워드</th>
                        <th>회원등급</th>
                        <th>탈퇴</th>
                    </tr>
                </thead>
                <tbody>
                 <c:forEach items="${rlist}" var="ri">
                    <c:if test="${ri.m_status eq 1 }">
                    <tr>
                        <td>${ri.m_no}</td>
                        <td>${ri.m_name}</td>
                        <c:if test="${ri.point ge 200}">
                        <td>${ri.point}</td>
                        <td>파트너 큐레이터</td>
                        </c:if>
                        <c:if test="${ri.point lt 200}">
                        <td>${ri.point}</td>
                        <td>일반회원</td>
                        </c:if>
                        <td> <div class="memberlist_button_div"><button class="memberlist_button" onclick="goDelete(${ri.m_no})">탈퇴</button></div></td>
                    </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
			
        </div>
		
    </div>
<c:out value="${pageBar}" escapeXml="false"/>
<script>
function goDelete(m_no) {
	location.href = "${pageContext.request.contextPath}/adminpage/adminmember.do?m_no="+m_no
}

function enterkey() {
    if (window.event.keyCode == 13) {

    	if ($('.searchbox').val() == "") {
			alert("입력 해주세요");
		} else {
			
			var a = $('.searchbox').val();
				
			location.href = "${pageContext.request.contextPath}/adminpage/adminmembersr.do?text="+a;
		}
    }
}



	$(function() {
		$('.searchGo').on("click", function() {
			if ($('.searchbox').val() == "") {
				alert("입력 해주세요");
			} else {
				
				var a = $('.searchbox').val();
					
				location.href = "${pageContext.request.contextPath}/adminpage/adminmembersr.do?text="+a;
			}
		})
	})

</script>
<%@ include file="../common/footer.jsp"%>

</body>

</html>