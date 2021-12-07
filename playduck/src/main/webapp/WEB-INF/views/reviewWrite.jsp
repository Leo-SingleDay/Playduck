<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<head>
    <meta charset="UTF-8">
    <title>playduck - 리뷰 작성하기</title>
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/headerfooter.css">
    <link rel="stylesheet" href="../resources/css/join.css">
	<link rel="stylesheet" href="../resources/css/login.css">
	<link rel="stylesheet" href="../resources/css/findIdPw.css">
    <link rel="stylesheet" href="../resources/css/reviewWrite.css">
   	<script src="../resources/js/jquery-3.6.0.min.js"></script>
	<script src="../resources/js/modal.js"></script>
	<script src="../resources/js/topBtn.js"></script>
</head>

<body>
     <%@ include file="common/header.jsp"%>
    <section>
   

        <h3 class="rw_title">${rwlist[0]}</h3>
        <div class="rw_posterArea">
            <img class="rw_poster" src="${rwlist[1]}" alt="">
        </div>
        <form name="reviewForm" action="${pageContext.request.contextPath}/review/reviewWrite.do" method="post" onsubmit="return validate();">
        <div class="rw_reviewTab">
        	<input type="text" class="hidden" name="p_no" value="${p_no}">
            <img class="good" src="../resources/images/review_good_current.png" alt="">
            <img class="good_gray" data-tab="good_gray" src="../resources/images/review_good.png" alt="">
            <img class="bad" src="../resources/images/review_bad_current.png" alt="">
            <img class="bad_gray" data-tab="bad_gray" src="../resources/images/review_bad.png" alt="">
            
        </div>
        <script>
            $(document).ready(function () {
                /*웹페이지 열었을 때*/
                $(".good").show();
                $(".bad_gray").show();
                $(".good_gray").hide();
                $(".bad").hide();
                $(".rw_reviewTab").append('<input type="text" class="hidden" id="r_status" name="r_status" value="1" />')

                /*bad_gray 클릭했을 때 bad를 보여줌*/
                $(".bad_gray").click(function () {
                    $(".good").hide();
                    $(".bad_gray").hide();
                    $(".good_gray").show();
                    $(".bad").show();
                    $("#rw_good").remove();
                    $('#r_status').remove();
                    $(".rw_reviewTab").append('<input type="text" class="hidden" id="r_status" name="r_status" value="2" />')
               
                });

                /*good_gray를 클릭했을 때 good을 보여줌*/
                $(".good_gray").click(function () {
                    $(".good").show();
                    $(".bad_gray").show();
                    $(".good_gray").hide();
                    $(".bad").hide();
                    $("#rw_bad").remove();
                    $('#r_status').remove();
                    $(".rw_reviewTab").append('<input type="text" class="hidden" id="r_status" name="r_status" value="1" />')
                });

            });
            
            $(function(){
	            $(".rw_review").on("keyup",function(){
	            	var textthing = $(".rw_review").val();
	            	console.log(textthing);
	            	if(textthing==""){
	            		console.log(true);
	            		$(".abledWriteBtn").hide();
	            		$(".disabledWriteBtn").show();
	            	} else {
	            		console.log(false);
	            		$(".disabledWriteBtn").hide();
	            		$(".abledWriteBtn").show();
	            	}
	            });
            });
        </script>
        <h4 class="rw_contentTitle">평점</h4>
        <table class="rw_ratingArea">
            <tr>
                <td class="rw_ratingTitle">공연장</td>
                <td><input class="rw_rageBar" name="pd_theater" type="range" max="100" min="0" step="20" value="80" oninput="document.getElementById('value1').innerHTML=this.value + '%';"> <span id="value1">80%</span></td>
            </tr>
            <tr>
                <td class="rw_ratingTitle">스토리</td>
                <td><input class="rw_rageBar" name="pd_story" type="range" max="100" min="0" step="20" value="80" oninput="document.getElementById('value2').innerHTML=this.value + '%';"> <span id="value2">80%</span></td>
            </tr>
            <tr>
                <td class="rw_ratingTitle">연출</td>
                <td><input class="rw_rageBar" name="pd_producing" type="range" max="100" min="0" step="20" value="80" oninput="document.getElementById('value3').innerHTML=this.value + '%';"> <span id="value3">80%</span></td>
            </tr>
            <tr>
                <td class="rw_ratingTitle">캐스팅</td>
                <td><input class="rw_rageBar" name="pd_casting" type="range" max="100" min="0" step="20" value="80" oninput="document.getElementById('value4').innerHTML=this.value + '%';"> <span id="value4">80%</span></td>
            </tr>
        </table>
        <h4 class="rw_contentTitle">한줄평</h4>
        <div class="rw_reviewArea">
        <textarea class="rw_review" name="r_content" cols="70" rows="2"
              style="resize:none;" value="내용을 입력하세요"></textarea></div>
              
               <input type="submit" class="rw_writeBtn abledWriteBtn" value="리뷰 작성하기" style="display:none;">
            <button type="button" class="rw_writeBtn disabledWriteBtn" style="background:gray;">한줄평을 채워주세요</button>
              <!-- <button class="rw_writeBtn" onclick = "fn_goReviewWrite()">리뷰 작성하기</button>  -->
				
				</form>
    </section>
    <br /><br /><br /><br /><br />
    <%@ include file="common/footer.jsp"%>
</body>

</html>