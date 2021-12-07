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
<link rel="stylesheet" href="../resources/css/pagination.css">

<link rel="stylesheet" href="../resources/css/cu_list.css">


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
                <a href="${pageContext.request.contextPath}/curation/culistsort1.do" class="sort_title"  style="margin-left:27px;">가나다 순</a>
                <hr class="sort_line"/>
                <a href="${pageContext.request.contextPath}/curation/culistsort2.do" class="sort_title">최신 순</a>
            </div>
    </div>
    
	<section>
	
	<div class="cu_searchArea">
    	<form action="${pageContext.request.contextPath}/curation/search_cu.do" name="form2" method="post">
	    
		    <input class="cu_searchInput" type="text" name="keyword" value="${keyword}"/>
		    <input type="submit" class="cu_searchBtn" value="검색"/>
	    
    	</form>
    </div>
	
	<div class="list_sort">분류 ▼</div>
	<p class="lsit_total">총 ${totalContents}건의 게시물이 있습니다.</p>
	
	<div class="list_container">
		<c:forEach items="${culist}" var="cu" begin="0" varStatus="status">
		<div class="listArea" >
			<input type="text" class="hidden" value = "${cu.c_no}"/>
			<img src="/playduck/resources/curation/${cu.c_picrenamed}" onclick="location.href='${pageContext.request.contextPath}/curation/curationSelectOne.do?c_no=' + '${ cu.c_no }'">
			<div class="list_content">
				 <h3 style="color: #fff;" onclick="location.href='${pageContext.request.contextPath}/curation/curationSelectOne.do?c_no=' + '${ cu.c_no }'">${cu.c_title}</h3>
				<div class="list_icon">
				
				<c:set var="doneLoop" value="false"/>
				<c:if test = "${!empty blist }">
					<c:forEach items="${blist}" var="bl" begin="0" varStatus="status">
					<c:if test = "${cu.c_no eq bl.c_list and doneLoop ne true}">
						<c:set var="doneLoop" value="true" />
					</c:if>
					</c:forEach>
				</c:if>
				
				<c:if test="${ empty blist or doneLoop ne true }">
					<i class="far fa-star c${cu.c_no}" id="star" name="c${cu.c_no}" style="color: yellow;"></i>
				</c:if><c:if test="${ !empty blist and doneLoop eq true }">
					<i class="fas fa-star c${cu.c_no}" id="star" name="c${cu.c_no}" style="color: yellow;"></i>
				</c:if>
				</div>
				
			</div>
		</div>
		</c:forEach>
	</div>
	<div class="pageBar"><c:out value="${pageBar}" escapeXml="false"/></div>
	</section>
		
		<script>

		// 회원이 로그인이 x 라면 찜 목록 클릭 시 "로그인 필요"
		<c:if test="${ member == null}">
		
			$(function() {	

				$(".fa-star").on("click",function () {	
					
					alert("로그인을 해주세요!")
					$('.modal_loginBtn').click();
									
			 	 })
			});	
		</c:if>
		// 만약 회원이 로그인이 돼 있다면
		<c:if test="${ member != null}">	

			// 별 클릭 시
	    	$(".fa-star").on("click",function () {
	   		
	    			// 만약 클릭 시 별이 없었다면(현재 찜이 안돼있음)
					if($(this).hasClass('far') === true) {
						
						// 꽉 찬 별을 생기게 함
						$(this).removeClass("far");
   				            $(this).addClass("fas");
   				            
   				         // 클릭 한 클래스에 name을 가져옴  
   				         var getName=$(this).attr("name");

   				 
   				            // 찜 목록 INSERT
   				            $.ajax({
   				            	url : "${pageContext.request.contextPath}/main/CBookMarkIn.do",
   				            	type : 'get',
   				            	data : { m_no : ${member.m_no},
   				            			 c_no : getName },
   				            	contentType : "application/json; charset:UTF-8", //return을 string으로 할 시 AJAX에 "contentType"과 
   				            	success : function(data) {						// controller > RequestMapping 부분에 "produces"를 하지 않으면 문자가 깨져서 옴	
   				            	
   				            		alert('" ' + data + ' "' + " 이(가) 큐레이션 북마크에 추가 됐습니다")
   				            	}
   				            });
   				           
   				        // 만약 클릭 시 별이 있었다면(현재 찜이 돼 있음)    
					} else if ($(this).hasClass('far') === false) {
						
						// 빈 별을 생기게 함
						$(this).removeClass("fas");
   				            $(this).addClass("far");
   				            
   				          
   				        // 클릭 한 클래스에 name을 가져옴
   				         var getName=$(this).attr("name");
   				         
   				         // 찜 목록 DELETE
   				         $.ajax({   				        	 
   				            	url : "${pageContext.request.contextPath}/main/CBookMarkDe.do",
   				            	type : 'get',
   				            	data : { m_no : ${member.m_no},
   				            			 c_no : getName },
   				            	contentType : "application/json; charset:UTF-8", //return을 string으로 할 시 AJAX에 "contentType"과 
   				            	success : function(data) {		// controller > RequestMapping 부분에 "produces"를 하지 않으면 문자가 깨져서 옴
   				            		
   				            		alert('" ' + data + ' "' + " 이(가) 큐레이션 북마크에서 삭제 됐습니다")
   				            	
   				            	}
   				            })
					}
		
	          });
		</c:if>
		
		</script>
		
		

<br /><br /><br /><br /><br /><br /><br /><br />
	<%@ include file="common/footer.jsp"%>
</body>

</html>