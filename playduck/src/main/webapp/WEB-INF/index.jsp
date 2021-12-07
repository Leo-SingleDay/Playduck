<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>메인 페이지</title>
<script src="resources/js/jquery-3.6.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous">
  </script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous">
  </script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
	integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
	crossorigin="anonymous">
  </script>
<script src="https://kit.fontawesome.com/2004329f9f.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/common.css">
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/headerfooter.css">
<link rel="stylesheet" href="resources/css/join.css">
<link rel="stylesheet" href="resources/css/login.css">
<link rel="stylesheet" href="resources/css/findIdPw.css">
<link rel="shortcut icon" href="resources/images/favicon.ico">
<link rel="icon" href="resources/images/favicon.ico">
<script src="resources/js/jquery-3.6.0.min.js"></script>
<script src="resources/js/modal.js"></script>
<script src="resources/js/topBtn.js"></script>

</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>

	<article class="main_slide">
		<img class="main_ribbon" src="resources/images/top10_ribbon.png">
		<div id="carouselExampleSlidesOnly" class="carousel slide"
			data-bs-ride="carousel" style="height: 730px; width: 1400px;">
			<div class="carousel-inner">

				<div class="carousel-item active">
					<img src="resources/images/slide01.jpg" class="d-block w-100"
						height="730px" width="1400px" id="main_slideimg">
				</div>
				<div class="carousel-item">
					<img src="resources/images/slide02.jpg" class="d-block w-100"
						height="730px" width="1400px" id="main_slideimg">
				</div>
				<div class="carousel-item">
					<img src="resources/images/slide03.jpg" class="d-block w-100"
						height="730px" width="1400px" id="main_slideimg">
				</div>
				<div class="carousel-item">
					<img src="resources/images/slide04.jpg" class="d-block w-100"
						height="730px" width="1400px" id="main_slideimg">
				</div>
				<div class="carousel-item">
					<img src="resources/images/slide05.jpg" class="d-block w-100"
						height="730px" width="1400px" id="main_slideimg">
				</div>
				<div class="carousel-item">
					<img src="resources/images/slide06.jpg" class="d-block w-100"
						height="730px" width="1400px" id="main_slideimg">
				</div>
				<div class="carousel-item">
					<img src="resources/images/slide07.jpg" class="d-block w-100"
						height="730px" width="1400px" id="main_slideimg">
				</div>
				<div class="carousel-item">
					<img src="resources/images/slide08.jpg" class="d-block w-100"
						height="730px" width="1400px" id="main_slideimg">
				</div>
				<div class="carousel-item">
					<img src="resources/images/slide09.jpg" class="d-block w-100"
						height="730px" width="1400px" id="main_slideimg">
				</div>
				<div class="carousel-item">
					<img src="resources/images/slide10.jpg" class="d-block w-100"
						height="730px" width="1400px" id="main_slideimg">
				</div>
			</div>
		</div>
	</article>
	<section>
		<!--탑10 슬라이드-->
		<article class="main_top10">
			<div>
				<span class="main_fontw">TOP 10</span> <span class="main_fonto">작품
				</span>
			</div>
			<div class="main_topwindow">
				<div class="button-container">
					<button class="prev">
						<i class="arrow left"></i>
					</button>
				</div>
				<ul class="main_topcontainer" id="review_top10">

				</ul>
				<div class="button-container">
					<button class="next">
						<i class="arrow right"></i>
					</button>
				</div>
			</div>

		</article>

		<!--큐레이션 슬라이드-->
		<article class="main_curation">
			<div id="letgo">
				<span class="main_fontw">큐레이션</span> <span class="main_fonto">for
					DUCKs</span>

			</div>
			<script>
			<c:if test="${member != null}">
			$(function(){ // 파트너 큐레이션이면 큐레이션 작성하기 버튼 생성
				var a = ${member.m_no};
				
				$.ajax({
					url : "${pageContext.request.contextPath}/main/mainCuButton.do",
					type : 'get',
					data : { m_no : a },
					success : function(data) {
						console.log(data)
						if(data >= 200) {
							var innerHtml = "";
							
							innerHtml = '<button class="curation_write" id="curationButt" onclick="fn_goCurationForm()">큐레이션'
							innerHtml += '작성하기</button>'
							
							$("#letgo").append(innerHtml);
						}
					}
				
				
				})
			})
				</c:if>
			
				function fn_goCurationForm(){
					location.href = "${pageContext.request.contextPath}/curation/curationForm.do"
				}
				</script>
			<div class="main_curwindow">
				<div class="button-container">
					<button class="prev2">
						<i class="arrow left2"></i>
					</button>
				</div>
				<ul class="main_curcontainer" id="curation_ran">

				</ul>
				<div class="button-container">
					<button class="next2">
						<i class="arrow right2"></i>
					</button>
				</div>
			</div>

		</article>
		<!--핫리뷰-->
		<article class="main_hotreview">
			<div id="Hotreview3">
				<span class="main_fonto">HOT</span> <span class="main_fontw">리뷰</span>
			</div>



		</article>
		<!--추천 슬라이드-->

		<article class="main_recommend">
			<c:if test="${member != null}">
				<div>
					<span class="main_fontw">${member.m_name}님, 이 작품은 어떠세요?</span>
				</div>
			</c:if>
			<c:if test="${member == null}">
				<div>
					<span class="main_fontw">방문자님, 이 작품은 어떠세요?</span>
				</div>
			</c:if>
			<div class="main_recwindow">
				<div class="button-container">
					<button class="prev3">
						<i class="arrow left3"></i>
					</button>
				</div>
				<ul class="main_reccontainer" id="member_Genre1">

				</ul>
				<div class="button-container">
					<button class="next3">
						<i class="arrow right3"></i>
					</button>
				</div>
			</div>


		</article>
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
	</section>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>

<script>


	// Top 10 작품리뷰
	 $(function(){
		 $.ajax({
			 url : "${pageContext.request.contextPath}/main/mainReviewTop10.do",
			 type : 'get',
			 success : function(data) { // 공연포스터, 공연번호, 공연이름, 점수
	
				for(var i in data.title){
							
					var innerHtml = ""
					
					innerHtml =	  '<li class="cell">'
					innerHtml +='<img src='+data.poster[i] +'>'
					innerHtml +='<div class="main_topinfo" style="display:none;">'
					innerHtml +=  "<button class='main_toprevieww' onclick=\"location.href='detail/detail.do?p_no="+data.pnum[i]+"'\""
					innerHtml +=   'style="border: none; background-color: var(--black-color);color: #fff;">작품보기</button>'
					innerHtml +=  '<hr>'
					innerHtml +=  "<button class='main_topreviewr' name="+data.pnum[i];
					innerHtml +=   ' style="border: none; background-color: var(--black-color);color: #fff;">리뷰작성</button>'
					innerHtml +='</div>'
					innerHtml += '<div class="main_topcontent">'
					innerHtml +=   '<h3 style="color: #fff;" class="titleremove'+i+'">'+data.title[i]+'</h3>'
					innerHtml +=   '<span class="main_toprate">'+data.grade[i]+'%</span>'
					innerHtml +=  '<div class="main_topicon">'
					innerHtml +=    '<i class="far fa-star zzim1 '+data.pnum[i]+'" name='+data.pnum[i]+' id="star" style="color: yellow;" ></i>'
					innerHtml += ' </div>'
					innerHtml += '</div>'
					innerHtml +='</li>'
								
					$("#review_top10").append(innerHtml);
				
					// 글자 수 제한
					var length = 8;
					
					$('.titleremove'+i).each(function(){
						if($('.titleremove'+i).text().length >= length){
							$('.titleremove'+i).text($('.titleremove'+i).text().substr(0,length)+'...');
						}
					});
					
					
					   const container = document.querySelector(".main_topcontainer");
				        const prevBtn = document.querySelector(".prev");
				        const nextBtn = document.querySelector(".next");

				        (function addEvent() {
				          prevBtn.addEventListener('click', translateContainer.bind(this, 1));
				          nextBtn.addEventListener('click', translateContainer.bind(this, -1));
				        })();

				        function translateContainer(direction) {
				          const selectedBtn = (direction === 1) ? 'prev' : 'next';
				          container.style.transitionDuration = '1000ms';
				          container.style.transform = `translateX(${direction * ( 20 )}%)`;
				          container.ontransitionend = () => reorganizeEl(selectedBtn);
				        }

				        function reorganizeEl(selectedBtn) {
				          container.removeAttribute('style');
				          (selectedBtn === 'prev') ? container.insertBefore(container.lastElementChild, container.firstElementChild):
				            container.appendChild(container.firstElementChild);
				        }
				};
				
				// 만약 로그인이 안된 상태에서 리뷰작성 클릭 시 경고창
				<c:if test="${ member == null}">
				  $(".main_topreviewr").click(function() {
					  $('.modal_loginBtn').click();
					  alert("로그인을 해주세요")
					  return false;
					  
				  }).prop('onclick', null);
			     
				</c:if>
				
				// 로그인 후 리뷰작성 클릭 시 만약 공연에 이미 작성 한 리뷰가 있을 시 경고창 
				<c:if test="${ member != null}">
				$(".main_topreviewr").on("click",function(){
					
					var getName=$(this).attr("name");
					
					var data1 = {
		    				"m_no" : ${member.m_no},
		    				"p_num" : getName
		    		}
					
					$.ajax({
						 url : "${pageContext.request.contextPath}/main/reviewCheck.do",
						 type : 'get',
						 data : data1,
						 success : function(data) {

							 
							if(data != 0) {
								alert("이미 리뷰를 작성 하셨습니다.");
							} else {
								location.href='review/reviewForm.do?p_no='+getName;
							}
							 
						 }
					})
				})
				</c:if>
				
				
			
			// 회원이 로그인이 x 라면 찜 목록 클릭 시 "로그인 필요"
			<c:if test="${ member == null}">
			
				$(function() {	

					$(".main_topicon").on("click",function () {	
						
						alert("로그인을 해주세요!")
						$('.modal_loginBtn').click();
										
				 	 })
				});	
			</c:if>
			
			// 회원이 로그인이 됐다면 찜리스트를 가져옴
			<c:if test="${ member != null}">
		    	$(function() {
		    		
		    		var data1 = {
		    				"m_no" : ${member.m_no},
		    				"p_num" : data.pnum
		    		}
  		
		    		
		     			$.ajax({
		     				url :  "${pageContext.request.contextPath}/main/bookmarkcheck.do",
		     				type : "get",
		     				data : data1,
		     				success : function(data) { // 찜목록 공연번호
								
		     					//가져온 찜 리스트에 공연번호와 현재 메인페이지에 나와 있는 공연번호 유효성 검사
		     					for(var i in data) {
		     						for(var j in data1.p_num) {
		     							if(data[i] == data1.p_num[j]){
		     								
		     									$('.'+data[i]).removeClass("far");
		     									$('.'+data[i]).addClass("fas");
		     									
		     							}					
		     						}
		     					}
		     			
		     						// 별 클릭 시
		     				    	$(".zzim1").on("click",function () {
		     				   			
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
			     				
		     				          })
		     						
		     				}
		     			});
		     		});	
		    	</c:if>
		    	
			// 포스터에 hover 시 리뷰보기 / 작성하기
		    $('.cell').on('mouseenter', function () {
		         	 $(this).children('.main_topinfo').show();
		    	 }).on('mouseleave', function () {
		        	 $(this).children('.main_topinfo').hide();
		     	 });		
			
		}	 
	 });
 });
 
	// 큐레이션 for DUCKs
	$(function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/main/curationforDuck.do",
			type : 'get',
			success : function(data){ // 큐레이션 사진, 큐레이션 제목, 큐레이션 번호 
				
				var innerHtml = "";
				
				for(var i in data.title) {
					
					innerHtml = '<li class="cell2">'
					innerHtml += '<img src="resources/curation/'+data.pic[i]+'" class="imgGoCuD" name='+data.Cnum[i]+' style="cursor:pointer; ">'
					innerHtml += '<div class="main_curcontent">'
					innerHtml += ' <h3 style="color: #fff;">'+data.title[i]+'</h3>'
					innerHtml += ' <div class="main_curicon">'
					innerHtml +=     '<i class="far fa-star zzim2 a'+data.Cnum[i]+'" name=c'+data.Cnum[i]+' id="star" style="color: yellow;"></i>'
					innerHtml +=  ' </div>'				// 큐레이션 번호는 int 이므로 앞에 문자를 추가 해준다(name, class, id 는 숫자가 먼저 들어가면 X)
					innerHtml += ' </div>'				// 숫자만 들어가야 할 경우 문자를 추가 후 controller에서 replace로 c나 a만 자르면 된다
					innerHtml += ' </li>'
					
					$("#curation_ran").append(innerHtml);
				}
				
				
			    const container2 = document.querySelector(".main_curcontainer");
		        const prevBtn2 = document.querySelector(".prev2");
		        const nextBtn2 = document.querySelector(".next2");

		        (function addEvent() {
		          prevBtn2.addEventListener('click', translateContainer2.bind(this, 1));
		          nextBtn2.addEventListener('click', translateContainer2.bind(this, -1));
		        })();

		        function translateContainer2(direction) {
		          const selectedBtn2 = (direction === 1) ? 'prev2' : 'next2';
		          container2.style.transitionDuration = '500ms';
		          container2.style.transform = `translateX(${direction * ( 20 )}%)`;
		          container2.ontransitionend = () => reorganizeEl2(selectedBtn2);
		        }

		        function reorganizeEl2(selectedBtn2) {
		          container2.removeAttribute('style');
		          (selectedBtn2 === 'prev2') ? container2.insertBefore(container2.lastElementChild, container2
		            .firstElementChild): container2.appendChild(container2.firstElementChild);
		        }
		        
		        $('.imgGoCuD').on('click',function(){
		        	 var getName=$(this).attr("name");
					 location.href = "${pageContext.request.contextPath}/curation/curationSelectOne.do?c_no="+getName;
		        	
		        })
				
				// 만약 회원이 로그인이 안 돼 있다면
				<c:if test="${ member == null}">	
				
				$(function() {	
					$(".main_curicon").on("click",function () {	

						alert("로그인을 해주세요!")
						$('.modal_loginBtn').click();	
						
				 	 })
				});	
				
				</c:if>
				
				// 만약 회원이 로그인이 돼 있다면
				<c:if test="${ member != null}">	
				
				$(function() {
					
					
					var data1 = {
		    				"m_no" : ${member.m_no},
		    				"c_num" : data.Cnum // 부모 AJAX에서 불러온 큐레이션 번호 리스트
		    		}
					
					// 찜 목록에 큐레이션 확인 AJAX
					$.ajax({
						url : "${pageContext.request.contextPath}/main/bookmarkcheckC.do",
						type : 'get',	
						data : data1,
						success : function(data) { // Controller에서 메인페이지에 나와 있는 큐레이션과 유효성 검사 완료 후 공연번호 리스트
						
							// 유효성 재검사
							for(var i in data) {
	     						for(var j in data1.c_num) {
	     							if(data[i] == data1.c_num[j]){
	     							
	     									$('.a'+data1.c_num[j]).removeClass("far");
	     									$('.a'+data1.c_num[j]).addClass("fas");
	     									
	     							}					
	     						}
	     					}
							
							// 별 클릭 시
     				    	$(".zzim2").on("click",function () {
     				   		
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
	     				
     				          })
						}
					})
				})
				</c:if>
			}
		});
	});
	
	
	
 
 	// Hot 리뷰 Top3
 	$(function(){
		 $.ajax({
			 url : "${pageContext.request.contextPath}/main/mainHotReview.do",
			 type : 'get',
			 success : function(data){ // 공연사진, 리뷰 내용, 공연 포스터
				console.log(data);
				 for(var i in data.poster){
				
					 var innerHtml = "";
					 
					 innerHtml = '<table class="main_hotreviewTable">'
					 innerHtml +=  '<tr>'
					 innerHtml += ' <td class="main_hotreviewprofile">'
					 innerHtml +=	 '<img src="resources/profileImg/'+data.pic[i]+'"  >'
					 innerHtml += '</td>'
					 innerHtml +='<td class="main_hotreviewcontent">'+data.content[i]+'</td>'
					 innerHtml +=  ' <td class="main_hotreviewimg imgRe" name='+data.pnum[i]+'><img src='+data.poster[i] +' style="cursor:pointer; "  ></td>'
					 innerHtml += '</tr>'
					 innerHtml += ' </table>'
				 
					 $("#Hotreview3").append(innerHtml);
				 
				 }
				 
				 $(".imgRe").click(function(){
					 var getName=$(this).attr("name");
					 location.href = "${pageContext.request.contextPath}/detail/detail.do?p_no="+getName;
				 })
			 }
		 })	
	 
 	});
 	
 	$(function() {
 		
 		var a = "";
 		
 	// 만약 세션이 연결 O
 	<c:if test="${ member != null}">
 		a = ${member.m_no}
 	</c:if>
 	
 	// 만약 세션이 연결 X
 	<c:if test="${ member == null}">
		a = 0; // AJAX로 a라는 값을 보내는 데, 만약 a라는 값이 비어 있다면 무조건 오류가 생김 
	</c:if>	   // 현재 페이지가 열리면 회원이 null 인지 not null 인지 판단을 함 즉 페이지가 열리면 무조건 AJAX 실행이 되므로 a 라는 값은 존재해야 함
		

 		// 빼내 온 공연 정보를 랜덤으로 10개만 화면에 보이게 함
 		$.ajax({
 			url : "${pageContext.request.contextPath}/main/mainGenreM.do",
 			type : 'get',
 			data : {m_no : a},
 			success : function(data){
 		
 				var len = data.title.length;
 		
 				
 				var arr = [];
 				var temp;
 				var rnum;
 				
 				for(var i=0; i<len ; i++){
 					arr.push(i);
 				}
 				
 				// [0, 1, 2 . . . 62, 63]
 		
 				// 랜덤으로 돌릴 때 랜덤 값이 중복이 생기면 안 되므로 * 주의 요망 *
 				for(var i =0; i<len; i++) { // 0 ~ 0.9999 * 64 -> 0 ~ 63.9999
 					rnum = Math.floor(Math.random()*len); 
 					temp = arr[i];                    
 					arr[i] = arr[rnum]    // 10            
 					arr[rnum] = temp;				
 				}
		
 				// 공연 포스터를 다 보일 수 없으므로 위에서 랜덤으로 돌린 공연 10개만 뽑음
 				 for(var i = 0; i < 10 ; ++i){
 					 
 					 var innerHtml = "";
 					 
 					innerHtml = '<li class="cell3">'
 					innerHtml += '<img src="'+data.poster[arr[i]]+'">'
 					innerHtml += '<div class="main_recinfo" style="display:none;">'
 					innerHtml += "<button class='main_toprevieww' onclick=\"location.href='detail/detail.do?p_no="+data.pnum[arr[i]]+"'\""
 					innerHtml +=    'style="border: none; background-color: var(--black-color);color: #fff;">작품보기</button>'
 					innerHtml += '<hr>'
 					innerHtml +=  "<button class='main_topreviewr' onclick=\"location.href='review/reviewForm.do?p_no="+data.pnum[arr[i]]+"'\""
 					innerHtml +=    'style="border: none; background-color: var(--black-color);color: #fff;">리뷰작성</button>'
 					innerHtml += '</div>'
 					innerHtml += '<div class="main_reccontent">'
 					innerHtml +=  '<h3 style="color: #fff;" class="membergood1'+i+'">'+data.title[arr[i]]+'</h3>'
 					innerHtml += '<span class="main_recrate">'+data.grade[arr[i]]+'%</span>'
 					innerHtml +=  '<div class="main_recicon">'
 					innerHtml +=   '<i class="far fa-star zzim3 '+data.pnum[arr[i]]+'" name='+data.pnum[arr[i]]+' id="star" style="color: yellow;"></i>'
 					innerHtml += '</div>'
 					innerHtml += '</div>'
 					innerHtml += '</li>'
 					
 						$("#member_Genre1").append(innerHtml);
 					
 					// 글자 수 제한
					var length = 8;
					
					$('.membergood1'+i).each(function(){
						if($('.membergood1'+i).text().length >= length){
							$('.membergood1'+i).text($('.membergood1'+i).text().substr(0,length)+'...');
						}
					});
					
					    const container3 = document.querySelector(".main_reccontainer");
	 			        const prevBtn3 = document.querySelector(".prev3");
	 			        const nextBtn3 = document.querySelector(".next3");

	 			        (function addEvent() {
	 			          prevBtn3.addEventListener('click', translateContainer3.bind(this, 1));
	 			          nextBtn3.addEventListener('click', translateContainer3.bind(this, -1));
	 			        })();

	 			        function translateContainer3(direction) {
	 			          const selectedBtn3 = (direction === 1) ? 'prev3' : 'next3';
	 			          container3.style.transitionDuration = '500ms';
	 			          container3.style.transform = `translateX(${direction * ( 4.7 )}%)`;
	 			          container3.ontransitionend = () => reorganizeEl3(selectedBtn3);
	 			        }

	 			        function reorganizeEl3(selectedBtn3) {
	 			          container3.removeAttribute('style');
	 			          (selectedBtn3 === 'prev3') ? container3.insertBefore(container3.lastElementChild, container3
	 			            .firstElementChild): container3.appendChild(container3.firstElementChild);
	 			        }
 				 }
 				 
 				 
 				// 로그인 X 시 리뷰작성 버튼 누르면 경고창
 				<c:if test="${ member == null}">
				  $(".main_topreviewr").click(function() {
					  $('.modal_loginBtn').click();
					  alert("로그인을 해주세요")
					  return false;
					  
				  }).prop('onclick', null);
			     
				</c:if> 
 			      
 			      
 			        // hover시 리뷰 작성, 리뷰 보기 
 			        $('.cell3').on('mouseenter', function () {
 			          $(this).children('.main_recinfo').show();
 			        }).on('mouseleave', function () {
 			          $(this).children('.main_recinfo').hide();
 			        });
 				 
 			        
 			        
 			   	// 회원이 로그인이 x 라면 찜 목록 클릭 시 "로그인 필요"
 					<c:if test="${ member == null}">
 					
 						$(function() {	

 							$(".main_recicon").on("click",function () {	
 								
 								alert("로그인을 해주세요!")
 								$('.modal_loginBtn').click();
 				
 						 	 })
 						});	
 					</c:if>
 					
 					// 회원이 로그인이 됐다면 찜리스트를 가져옴
 					<c:if test="${ member != null}">
 				    	$(function() {
 				    		
 				    		var data1 = {
 				    				"m_no" : ${member.m_no},
 				    				"p_num" : data.pnum
 				    		}
 		  		
 				    		
 				     			$.ajax({
 				     				url :  "${pageContext.request.contextPath}/main/bookmarkcheck.do",
 				     				type : "get",
 				     				data : data1,
 				     				success : function(data) { // 찜목록 공연번호
 										
 				     					//가져온 찜 리스트에 공연번호와 현재 메인페이지에 나와 있는 공연번호 유효성 검사
 				     					for(var i in data) {
 				     						for(var j in data1.p_num) {
 				     							if(data[i] == data1.p_num[j]){
 				     								
 				     									$('.'+data[i]).removeClass("far");
 				     									$('.'+data[i]).addClass("fas");
 				     									
 				     							}					
 				     						}
 				     					}
 				     			
 				     						// 별 클릭 시
 				     				    	$(".zzim3").on("click",function () {
 				     				   			
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
 					     				
 				     				          })
 				     						
 				     				}
 				     			});
 				     		});	
 				    	</c:if>
 				 }	 
 		});
 	});
 

</script>

</html>