<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>playduck - 전체보기</title>
<link rel="stylesheet" href="../resources/css/common.css">
<link rel="stylesheet" href="../resources/css/headerfooter.css">
<link rel="stylesheet" href="../resources/css/join.css">
<link rel="stylesheet" href="../resources/css/login.css">
<link rel="stylesheet" href="../resources/css/findIdPw.css">
<link rel="stylesheet" href="../resources/css/list.css">
<link rel="stylesheet" href="../resources/css/pagination.css">

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
	
		 <div class="madal_listSort">
            <div class="madal_listSortDiv" title="">
                <span class="modal_content_close_1">X</span>
                <a href="/playduck/list/playlist.do?sortType=1" class="sort_title" style="margin-left:27px;">평점 높은 순</a>
                <hr class="sort_line"/>
                <a href="/playduck/list/playlist.do?sortType=2" class="sort_title">리뷰 많은 순</a>
                <hr class="sort_line"/>
                <a href="/playduck/list/playlist.do?sortType=3" class="sort_title">가나다 순</a>
                <hr class="sort_line"/>
                <a href="/playduck/list/playlist.do?sortType=4" class="sort_title">최신 순</a>
            </div>
    </div>
    
	<section>
	<div class="list_sort">분류 ▼</div>
	<p class="list_total">총 ${totalContents}건의 게시물이 있습니다.</p>
	
	<div class="listArea">
		
	<div class="list_container">
	
		<c:forEach items="${plist}" var="pi" begin="0" varStatus="status">
		<div class="listArea">
			<img src="${pi.poster}">
			<div class="main_topinfo" style="display:none;">
					<button class="main_toprevieww" onclick="goReviewS('${pi.p_no}');"
					style="border: none; background-color: var(--black-color);color: #fff;">작품보기</button>
				 <hr>
				 <button class='main_topreviewr' name="${pi.p_no}" onclick="goReviewR('${pi.p_no}');"
					 style="border: none; background-color: var(--black-color);color: #fff;">리뷰작성</button>
				</div>
				
				
			<div class="list_content">
			
				<script>
				 $(document).ready(function(){ 
                 	$('.titleremove').each(function(){ 
                 		if ($(this).text().length > 15) $(this).html($(this).text().substr(0,15)+"..."); }); });
				 </script>
				 <h3 class="titleremove" style="color: #fff;">${pi.prfnm}</h3>
              <span class="main_toprate">${pi.p_rating}%</span>
				<div class="list_icon">	
				<c:set var="doneLoop" value="false"/>
				<c:if test="${ !empty llist}">
					<c:forEach items="${llist}" var="li" >
					<c:if test="${li eq pi.p_no and doneLoop ne true}">
					<c:set var="doneLoop" value="true"/>
					</c:if>
					</c:forEach>
				</c:if>
						<c:if test="${li eq pi.p_no or doneLoop ne true}">
							<i class="far fa-star" id="star" name="${pi.p_no}" style="color: yellow;"></i>
						</c:if>
						<c:if test="${li ne pi.p_no and doneLoop eq true}">
							<i class="fas fa-star" id="star" name="${pi.p_no}" style="color: yellow;"></i>
						</c:if>
						
				</div>
			</div>
		</div>
		</c:forEach>	
		
		<script>
				
				/* 아이디 중복검사 이벤트 추가 */
				function goReviewR(no){
        			var m_no = '${ member.m_no }';
        			
        			if( m_no != '' ){
        				$.ajax({
				            url  : "${pageContext.request.contextPath}/review/reviewDuplicate.do",
				            data : {p_no : no,
      	                	    m_no : '${ member.m_no }'},
				            dataType: "json",
				            success : function(data){
				                console.log('버튼통신성공');
				                console.log(data);
				                if(data == 0){ 
				                	location.href = "${pageContext.request.contextPath}/review/reviewForm.do?p_no=" + no
				                } else {
				                    alert('리뷰를 작성한 공연입니다');
				                    
				                   
				                }
				            }, error : function(jqxhr, textStatus, errorThrown){
				                console.log("ajax 처리 실패");

				            }
			        	});
        			} else {
        				alert("로그인 후 이용 가능한 기능입니다.");
        				$('a.modal_loginBtn').click();
        			}
				        
	     	};
				
				
				</script>
		</div>
	<c:out value="${pageBar}" escapeXml="false"/>
	</section>
<script>

<c:if test="${ member == null}">

$(function() {	

	$(".fa-star").on("click",function () {	
		
		alert("로그인을 해주세요!")
		$('.modal_loginBtn').click();
						
 	 })
});	
</c:if>


<c:if test="${ member != null}">	

			
						// 별 클릭 시
				    	$(".fa-star").on("click",function () {
				   			
				    			// 만약 클릭 시 별이 없었다면(현재 찜이 안돼있음)
 							if($(this).hasClass('far') === true) {
 								
 								// 꽉 찬 별을 생기게 함
 								$(this).removeClass("far");
	     				            $(this).addClass("fas");
	     				            
	     				            
	     				         var getName=$(this).attr("name");

	     				 
	     				            // 찜 목록 INSERT
	     				            $.ajax({
	     				            	url : "${pageContext.request.contextPath}/main/MBookMarkIn.do",
	     				            	type : 'get',
	     				            	contentType : "application/json; charset:UTF-8", // return을 string으로 할 시 AJAX에 "contentType" 과 
	     				            	data : { m_no : ${member.m_no},					 // controller > RequestMapping 부분에 "produces"를 하지 않으면 문자가 깨져서 옴	
	     				            			 p_no : getName },
	     				            	success : function(data) {
	     				            		alert('" ' + data + ' "' + " 이(가) 공연 북마크에 추가 됐습니다");
	     				            	}
	     				            });
	     				           
	     				        // 만약 클릭 시 별이 있었다면(현재 찜이 돼 있음)    
 							} else if ($(this).hasClass('far') === false) {
 								
 								// 빈 별을 생기게 함
 								$(this).removeClass("fas");
	     				            $(this).addClass("far");
	     				            
	     				          
	     				            
	     				         var getName=$(this).attr("name");
	     				         
	     				         // 찜 목록 DELETE
	     				         $.ajax({   				        	 
	     				            	url : "${pageContext.request.contextPath}/main/MBookMarkDe.do",
	     				            	type : 'get',
	     				            	contentType : "application/json; charset:UTF-8", //return을 string으로 할 시 AJAX에 "contentType"과 
	     				            	data : { m_no : ${member.m_no},					// controller > RequestMapping 부분에 "produces"를 하지 않으면 문자가 깨져서 옴
	     				            			 p_no : getName },
	     				            	success : function(data) {
	     				            		
	     				            		alert('" ' + data + ' "' + " 이(가) 공연 북마크에서 삭제 됐습니다");
	     				            	}
	     				            })
 							}
 				
				          }) // 끝
						
	
</c:if>


$('.listArea').on('mouseenter', function () {
	 $(this).children('.main_topinfo').show();
}).on('mouseleave', function () {
	 $(this).children('.main_topinfo').hide();
});


function goReviewS(p_no){
	location.href = "${pageContext.request.contextPath}/detail/detail.do?p_no="+p_no;
}

// function goReviewR(p_no){
// 	location.href = "${pageContext.request.contextPath}/review/reviewForm.do?p_no="+p_no;
// }

</script>
<br /><br /><br /><br /><br /><br /><br /><br />
	<%@ include file="common/footer.jsp"%>
</body>

</html>