<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="tab-content current" id="tab_GoodReview">
				<c:forEach items="${rlist}" var="r">
					<!-- 리뷰 1 -->
					<div id="detail_goodContent" style="position: relative;">
						<div class="detail_reviewProfile">
						<c:if test="${empty r.M_PICRENAMED}" >
						<img src="${pageContext.request.contextPath}/resources/profileImg/${r.M_PIC}" alt="" />
						</c:if>
						<c:if test="${!empty r.M_PICRENAMED}" >
						<img src="${pageContext.request.contextPath}/resources/profileImg/${r.M_PICRENAMED}" alt="" />
						</c:if>
						</div>
						<div class="detail_reviewOne">
							<table>
								<tr>
									<td class="detail_reviewContent">${r.R_CONTENT}</td>
									<td>
									<table class="review_thumbsArea">
										<tr>
										<td class="review_thumbs r_no-${r.R_NO}" style="height: 30px">
										<i class="far fa-thumbs-up" style="color: var(--main-color)"></i> <p class="thumb_likecount">${r.R_GOOD}</p><br>
										<i class="far fa-thumbs-down" style="color: gray"></i> <p class="thumb_hatecount">${r.R_BAD}</p></td>
								</tr>
									</table>
									</td>
									
								</tr>
							</table>
							<script>

							var m_no = '${ member.m_no }';
							if( m_no != '' ){
									$.ajax({
					     				url :  "${pageContext.request.contextPath}/review/likecheck.do",
					     				type : "get",
					     				data : {m_no : '${member.m_no}',
					     					r_no :'${r.R_NO}' },
					     				success : function(data) {
	
					     					//가져온 찜 리스트에 공연번호와 현재 메인페이지에 나와 있는 공연번호 유효성 검사
					     								console.log("check : " + data + "/ " + '${r.R_NO}');			     					
					     					if(data == 1){
					     						$(".r_no-${r.R_NO} .fa-thumbs-up").removeClass("far");
					     						$(".r_no-${r.R_NO} .fa-thumbs-up").addClass("fas");
					     						$(".fa-thumbs-down").on("click", function(){
					     							alert("좋아요를 누른 상태로 싫어요를 누를 수 없습니다");
					     						});
					     						
					     					}else if(data == 2){
					     						$(".r_no-${r.R_NO} .fa-thumbs-down").removeClass("far");
					     						$(".r_no-${r.R_NO} .fa-thumbs-down").addClass("fas");
					     						$(".fa-thumbs-up").on("click", function(){
					     							alert("싫어요를 누른 상태로 좋아요를 누를 수 없습니다");
					     						});
					     					}
					     				}
				     				});
							}else{
								m_no = 0;
							}
								
							</script>
							<c:if test="${member.m_no eq r.M_NO}">
		    
			<button class="detail_reviewDelete" type="button" onclick="location.href='${pageContext.request.contextPath}/review/reviewDelete.do?r_no=${r.R_NO}'">삭제하기</button>
			</c:if>
						</div>
					</div>
					<!-- ---------- -->
					</c:forEach>
					<script>	
					
					var m_no = '${ member.m_no }';
					
						//좋아요 클릭시
						$(".fa-thumbs-up").on("click", function(){
							if( m_no != '' ){
							var r_no = $(this).parent().attr('class').substring(19);
							var countData = $(this).parent().children('.thumb_likecount');
								if($(this).hasClass("far") === true){
									
								$.ajax({
									url : "${pageContext.request.contextPath}/review/reviewLike.do",
									data : { r_no : r_no,
											m_no : '${member.m_no}'},
									dataType : "json",
									success : function(data){
										 $(".r_no-"+r_no+" .fa-thumbs-up").removeClass("far");
								         $(".r_no-"+r_no+" .fa-thumbs-up").addClass("fas");
								         countData.text(data);
									},
									error : function(error){
										console.log("좋아요 통신 실패");
									}
									
								});
							
								
								} else{
									$.ajax({
										url : "${pageContext.request.contextPath}/review/reviewLikeDelete.do",
										data : { r_no : r_no,
												m_no : '${member.m_no}'},
										dataType : "json",
										success : function(data){
											$(".r_no-"+r_no+" .fa-thumbs-up").removeClass("fas");
									         $(".r_no-"+r_no+" .fa-thumbs-up").addClass("far");
									         countData.text(data);
										},
											
								
										error : function(error){
											console.log("좋아요취소 통신 실패");
										}
										
									// ajax 닫기
									});
								// if문닫기
									}
							}else{
		        				alert("로그인 후 이용 가능한 기능입니다.");
		        				$('a.modal_loginBtn').click();
							};
						
		        		// 클릭시 닫기	
						});
							//싫어요 클릭시
							$(".fa-thumbs-down").on("click", function(){
								if( m_no != '' ){
							var r_no = $(this).parent().attr('class').substring(19);
							var countData = $(this).parent().children('.thumb_hatecount');
								if($(this).hasClass("far") === true){
									
								$.ajax({
									url : "${pageContext.request.contextPath}/review/reviewHate.do",
									data : { r_no : r_no,
											m_no : '${member.m_no}'},
									dataType : "json",
									success : function(data){
										 $(".r_no-"+r_no+" .fa-thumbs-down").removeClass("far");
								         $(".r_no-"+r_no+" .fa-thumbs-down").addClass("fas");
								         countData.text(data);
									},
									error : function(error){
										console.log("싫어요 통신 실패");
									}
									
								});
							
								
								} else{
									$.ajax({
										url : "${pageContext.request.contextPath}/review/reviewHateDelete.do",
										data : { r_no : r_no,
												m_no : '${member.m_no}'},
										dataType : "json",
										success : function(data){
											$(".r_no-"+r_no+" .fa-thumbs-down").removeClass("fas");
									         $(".r_no-"+r_no+" .fa-thumbs-down").addClass("far");
									         countData.text(data);
										},
											
								
										error : function(error){
											console.log("싫어요취소 통신 실패");
										}
										
									// ajax 닫기
									});
								// if문닫기
									}
							}else{
		        				alert("로그인 후 이용 가능한 기능입니다.");
		        				$('a.modal_loginBtn').click();
							};
						
		        		// 클릭시 닫기	
						});
						
						
					
						</script>
				</div>