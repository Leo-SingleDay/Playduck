<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../resources/css/common.css">
    	<link rel="stylesheet" href="../resources/css/headerfooter.css">
	<link rel="stylesheet" href="../resources/css/join.css">
	<link rel="stylesheet" href="../resources/css/login.css">
	<link rel="stylesheet" href="../resources/css/findIdPw.css">
    <link rel="stylesheet" href="../resources/css/MD.css">
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <script src="../resources/js/MD.js"></script>
    <script src="../resources/js/modal.js"></script>
    <script src="../resources/js/topBtn.js"></script>
    <title>playduck - MD_play 페이지</title>
</head>
<body>
        <c:import url="common/header.jsp"/>
    <section>
        <div class="MD_play_playtitle">${play.get("title")}</div>
        <div class="MD_play_playimage"><img src="${play.get("poster")}" alt="포스터 사진"></div>
        <div class="MD_play_playcontainer">
           
           
           <c:if test="${ mdPlayList != null }">
           <c:forEach items="${mdPlayList}"  var="List">
            <div class="MD_play_item">
                <div class="MD_play_mdimage" id="${List.d_no }"><img src="${List.d_pic }" alt=""></div>
                <div class="MD_play_mdtitle" >${List.d_title}</div>
                <div class="MD_play_mdprice">${List.d_price }원</div>
            </div>
            </c:forEach>
            </c:if> <c:if test ="${ mdPlayList[0] == null }">
             		<hr class="hr1">
             	<div class="notplay"> 해당 공연의 MD 상품이 존재하지 않습니다.</div>
            </c:if>
            
        </div>
    </section>
    <br /><br /><br /><br /><br />
    <%@ include file="common/footer.jsp"%>
  
  <script>
  <!--MD 상세보기페이지 -->  
  	$(function(){
  		$("div[id]").on("click",function(){
  			var dno = $(this).attr("id");
  			
  			location.href = "${pageContext.request.contextPath}/MD/MD_order.do?d_no=" + dno;
  		});
  	});
  </script>
</body>
</html>