<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>playduck - 상세보기</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/headerfooter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findIdPw.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detail.css">


<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/topBtn.js"></script>
<script src="https://kit.fontawesome.com/2004329f9f.js" crossorigin="anonymous"></script>
</head>
<body>
	<h1 class="hidden">playduck</h1>
	<%@ include file="common/header.jsp"%>
	<section>

		<a href="${pageContext.request.contextPath}/MD/MD_play.do?p_no=${param.p_no}"><img class="detail_mdLink" src="${pageContext.request.contextPath}/resources/images/md_link.png"></a>
		<div class="detail_main">
			<div class="detail_poster">
				<img class="detail_poster" src="${dlist[1]}"
					alt="">
				<i class="far fa-star" id="star" style="color: yellow;"></i>	
				
				
			</div>
			
		<script>
	
	    
	 // 회원이 로그인이 됐다면 찜리스트를 가져옴
		<c:if test="${ member != null}">
	    	$(function() {
	    		
	    		var data1 = {
	    				"m_no" : ${member.m_no},
	    				"p_no" : '${param.p_no}'
	    		};
	    		
	    		console.log(data1);
		
	     			$.ajax({
	     				url :  "${pageContext.request.contextPath}/detail/bookmarkcheck.do",
	     				type : "get",
	     				data : data1,
	     				success : function(data) {

	     					//가져온 찜 리스트에 공연번호와 현재 메인페이지에 나와 있는 공연번호 유효성 검사
	     					if(data == 1){
	     						$(".fa-star").removeClass("far");
	     						$(".fa-star").addClass("fas");
	     					}
	     			
	     						// 별 클릭 시
	     				    	$(".fa-star").on("click",function () {
	     				   			
	     				    			// 만약 클릭 시 별이 없었다면(현재 찜이 안돼있음)
		     							if($(this).hasClass('far') === true) {
		     								
		     								// 꽉 찬 별을 생기게 함
		     								$(this).removeClass("far");
		  	     				            $(this).addClass("fas");
		  	     				            
		  	     				            
		  	     				         

		  	     				 
		  	     				            // 찜 목록 INSERT
		  	     				            $.ajax({
		  	     				            	url : "${pageContext.request.contextPath}/main/MBookMarkIn.do",
		  	     				            	type : 'get',
		  	     				            	data : { m_no : ${member.m_no},
		  	     				            			 p_no : '${param.p_no}' },
		  	     				            	success : function(data) {
		  	     				            		console.log("오케이 인서트 합니다!");
		  	     				            	}
		  	     				            });
		  	     				           
		  	     				        // 만약 클릭 시 별이 있었다면(현재 찜이 돼 있음)    
		     							} else if ($(this).hasClass('far') === false) {
		     								
		     								// 빈 별을 생기게 함
		     								$(this).removeClass("fas");
		  	     				            $(this).addClass("far");
		  	     				            
		  	     				          
		  	     				            
		  	     				       
		  	     				         
		  	     				         // 찜 목록 DELETE
		  	     				         $.ajax({   				        	 
		  	     				            	url : "${pageContext.request.contextPath}/main/MBookMarkDe.do",
		  	     				            	type : 'get',
		  	     				            	data : { m_no : ${member.m_no},
		  	     				            			 p_no : '${param.p_no}' },
		  	     				            	success : function(data) {
		  	     				            		
		  	     				            		console.log("오케이 딜리트 합니다!");
		  	     				            	}
		  	     				            })
		     							}
		     				
	     				          })
	     						
	     				}
	     			});
	     		});	
	    	</c:if>
		</script>
			
			
			<table class="detail_content">
				<tr>
					<td class="detail_title">${dlist[0]}</td>
					<td class="detail_rating">${ play.p_rating } <img
						src="${pageContext.request.contextPath}/resources/images/rating.png"></td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="detail_ReservationLink" OnClick="location.href='https://tickets.interpark.com/search?keyword=' + '${dlist[0]}'">
							<img src="${pageContext.request.contextPath}/resources/images/detail_card.png">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 예매처 바로가기
						</div>
						
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<table class="detail_detailContent">
							<tr>
								<td class="detail_ContentTilte">장르</td>
								<td class="detail_ContentContent">${dlist[2]}</td>
								<td class="detail_ContentTilte">장소</td>
								<td class="detail_ContentContent">${dlist[3]}</td>
							</tr>
							<tr>
								<td class="detail_ContentTilte">관람시간</td>
								<td class="detail_ContentContent">${dlist[4]}</td>
								<td class="detail_ContentTilte">제작사</td>
								<td class="detail_ContentContent">${dlist[5]}</td>
							</tr>
							<tr>
								<td class="detail_ContentTilte">기간</td>
								<td colspan="3" class="detail_ContentContent">${dlist[6]} ~ ${dlist[7]}</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom: 1px solid white;"></td>
				</tr>
				<tr>
					<td class="detail_ratingTitle" colspan="2">DUCK's 평점</td>
				</tr>
				<tr>
					<td colspan="2">
						<table class="detail_ratingArea">
							<tr>
								<td>공연장</td>
								<td class="progressArea">
									<div class="progress">
										<div class="progress-bar" style="width: ${playDetail.avg_pd_theater}%;"></div>
									</div>
								</td>
								<td style="font-weight: 300;">${playDetail.avg_pd_theater}</td>
							</tr>
							<tr>
								<td>스토리</td>
								<td class="progressArea">
									<div class="progress">
										<div class="progress-bar" style="width: ${playDetail.avg_pd_story}%;"></div>
									</div>
								</td>
								<td style="font-weight: 300;">${playDetail.avg_pd_story}</td>
							</tr>
							<tr>
								<td>연출</td>
								<td class="progressArea">
									<div class="progress">
										<div class="progress-bar" style="width: ${playDetail.avg_pd_producing}%;"></div>
									</div>
								</td>
								<td style="font-weight: 300;">${playDetail.avg_pd_producing}</td>
							</tr>
							<tr>
								<td class="progressArea">캐스팅</td>
								<td>
									<div class="progress">
										<div class="progress-bar" style="width: ${playDetail.avg_pd_casting}%;"></div>
									</div>
								</td>
								<td style="font-weight: 300;">${playDetail.avg_pd_casting}</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</div>
		<div class="detail_sub">
			<!-- 
			<h4 class="detail_sub_title">시놉시스</h4>
			<p class="detail_sub_content">국회는 국가의 예산안을 심의·확정한다. 헌법재판소에서 법률의
				위헌결정, 탄핵의 결정, 정당해산의 결정 또는 헌법소원에 관한 인용결정을 할 때에는 재판관 6인 이상의 찬성이 있어야
				한다. 훈장등의 영전은 이를 받은 자에게만 효력이 있고, 어떠한 특권도 이에 따르지 아니한다. 이 헌법시행 당시의
				대법원장과 위원은 탄핵 또는 금고 이상의 형의 선고에 의하지 아니하고는 파면되지 아니한다. 헌법재판소의 조직과 운영 기타
				필요한 사항은 법률로 정한다.</p>
				 -->
			<h4 class="detail_sub_title">출연진</h4>
			<p class="detail_sub_content">${dlist[8]}</p>

			<hr>
			
			
			<div class="detail_review">
			
				<h3 class="detail_reviewTitle">DUCK's 리뷰</h3>
				<button class="detail_reviewWrite" >리뷰 작성하기</button>
				<script>
// 				function fn_goReviewForm(){
// 					location.href = "${pageContext.request.contextPath}/review/reviewForm.do?p_no=${param.p_no}"
// 				}
				
				/* 아이디 중복검사 이벤트 추가 */
				$(".detail_reviewWrite").on("click", function(){
        			var m_no = '${ member.m_no }';
        			
        			if( m_no != '' ){
        				$.ajax({
				            url  : "${pageContext.request.contextPath}/review/reviewDuplicate.do",
				            data : {p_no : '${param.p_no}',
      	                	    m_no : '${ member.m_no }'},
				            dataType: "json",
				            success : function(data){
				                console.log('버튼통신성공');
				                console.log(data);
				                if(data == 0){ 
				                	location.href = "${pageContext.request.contextPath}/review/reviewForm.do?p_no=${param.p_no}"
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
				        
	     	});
				
				
				</script>
				<div class="detail_reviewTab">
					<img class="good" src="${pageContext.request.contextPath}/resources/images/review_good_current.png"
						alt=""> <img class="good_gray" data-tab="tab_goodReview"
						src="${pageContext.request.contextPath}/resources/images/review_good.png" alt=""> <img
						class="bad" src="${pageContext.request.contextPath}/resources/images/review_bad_current.png"
						alt=""> <img class="bad_gray" data-tab="tab_badReview"
						src="${pageContext.request.contextPath}/resources/images/review_bad.png" alt="">
				</div>
				<script>
//                    $(document).ready(function () {
//                         /*웹페이지 열었을 때*/
//                         $(".good").show();
//                         $(".bad_gray").show();
//                         $(".good_gray").hide();
//                         $(".bad").hide();

//                         /*bad_gray 클릭했을 때 bad를 보여줌*/
//                         $(".bad_gray").click(function () {
//                             $(".good").hide();
//                             $(".bad_gray").hide();
//                             $(".good_gray").show();
//                             $(".bad").show();
//                             var tab_id = $(this).attr('data-tab');

//                             $('.tab-content').removeClass('current');

//                             $(this).addClass('current');
//                             $("#" + tab_id).addClass('current');
//                         });

//                         /*good_gray를 클릭했을 때 good을 보여줌*/
//                         $(".good_gray").click(function () {
//                             $(".good").show();
//                             $(".bad_gray").show();
//                             $(".good_gray").hide();
//                             $(".bad").hide();

//                             var tab_id = $(this).attr('data-tab');

//                             $('.tab-content').removeClass('current');

//                             $(this).addClass('current');
//                             $("#" + tab_id).addClass('current');
//                         });

//                    });
                    
                    $(function() {
//                     	 /*웹페이지 열었을 때*/
//                         $(".good").show();
//                         $(".bad_gray").show();
//                         $(".good_gray").hide();
//                         $(".bad").hide();

                        $(".good_gray").click();
                      });
                    
                    /*bad_gray 클릭했을 때 bad를 보여줌*/
                    $(".bad_gray").click(function () {
                        $(".good").hide();
                        $(".bad").show();
                        $(".good_gray").show();
                        $(".bad_gray").hide();
                        var tab_id = $(this).attr('data-tab');
                        
                        $('.tab-content').removeClass('current');

                        $(this).addClass('current');
                        $("#" + tab_id).addClass('current');
                        
                        loadReview(tab_id);
                    });

                    /*good_gray를 클릭했을 때 good을 보여줌*/
                    $(".good_gray").click(function () {
                        $(".good").show();
                        $(".bad").hide();
                        $(".good_gray").hide();
                        $(".bad_gray").show();

                        var tab_id = $(this).attr('data-tab');

                        $('.tab-content').removeClass('current');

                        $(this).addClass('current');
                        $("#" + tab_id).addClass('current');
                        
                        loadReview(tab_id);
                    });
                    
                    function loadReview(tab_id){
                    	var urlPath = "";
          				
          				if ( tab_id == 'tab_goodReview' ) {
          					urlPath = '/playduck/review/tab_goodReview.do';
          				} else if( tab_id == 'tab_badReview') {
          					urlPath = '/playduck/review/tab_badReview.do';
          				} 
          				
          	            $.ajax({
          	                 type : 'GET',                 //get방식으로 통신
          	                 url : urlPath,    //탭의 data-tab속성의 값으로 된 html파일로 통신
          	                 dataType : "html",//html형식으로 값 읽기 
          	                 data: { p_no : '${param.p_no}',
          	                	    m_no : '${ member.m_no }'} ,
          	                 error : function(error, status) {           //통신 실패시
          	                  console.log('통신실패!');
          	                  console.log('--------------------');
          	                  console.log(error);
          	                  console.log(status);
          	                  console.log('--------------------');
          	                 },
          	                 success : function(data) {    //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
          	                 	
          	                	 $("#tab-content").html(data);
          	                 	console.log( "통신성공");
          	                 }
          	            });	
                    }
                </script>
                <div id="tab-content"></div>
				
				
			</div>
		</div>
	<!--	<button class="detail_reviewWrite" onclick = "location.href = 'reviewWrite.jsp'">리뷰 작성하기</button>  -->
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />

		<br />

	</section>

	  <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>