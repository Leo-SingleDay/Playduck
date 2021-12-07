<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>



  <script src="../resources/js/jquery-3.6.0.min.js"></script>
   
   
    <script src="https://kit.fontawesome.com/2004329f9f.js" crossorigin="anonymous"></script>
    
    <script src="../resources/js/modal.js"></script>
<script src="../resources/js/topBtn.js"></script>
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/headerfooter.css">
<link rel="stylesheet" href="../resources/css/join.css">
<link rel="stylesheet" href="../resources/css/login.css">
<link rel="stylesheet" href="../resources/css/findIdPw.css">
<link rel="stylesheet" href="../resources/css/profileModify.css">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
	    $(function(){
	    	
	    	$('.join_addrBtn2').on('click',function(){
	    		new daum.Postcode({
	                oncomplete: function(data) {
	                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                    var roadAddr = data.roadAddress; // 도로명 주소 변수
	                    var extraRoadAddr = ''; // 참고 항목 변수
	
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraRoadAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraRoadAddr !== ''){
	                        extraRoadAddr = ' (' + extraRoadAddr + ')';
	                    }
	
	                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                    $('#m_address3').val(data.zonecode);
	                    $('#m_address4').val(roadAddr);
	                    
	                }
	            }).open();
	    	});
		    
		    // 모달 나타내기
		    $(".pm_submitBtn2").on("click",function(){
		    	$(".modal_profileModify3").fadeIn();
		    });
		    
		    // 모달 나타내기
			$(".pm_submitBtn3").on("click",function(){
				$(".modal_profileModify").fadeIn();
		    });
			
		     // 비밀번호 체크
		    $("#m_changePwd").on("keyup",function(){
		    	var join_pwd1 = $(this).val().trim();
		    	var join_pwd2 = $("#m_changePwd2").val().trim();
		    	if(join_pwd1==join_pwd2){
	                $(".notAllowBtn").show();
	                $(".allowBtn").hide();
	                
		    	} else {
	                $(".notAllowBtn").hide();
	                $(".allowBtn").show();
		    	}
		    }); 
		    
		    $("#m_changePwd2").on("keyup",function(){
			   	 var join_pwd2 = $(this).val().trim();
			   	 var join_pwd1 = $("#m_changePwd").val().trim();
			   	 if(join_pwd1==join_pwd2){
		             $(".notAllowBtn").hide();
		             $(".allowBtn").show();
		                
			   	 } else {
		             $(".notAllowBtn").show();
		             $(".allowBtn").hide();
			   	 }
		   	 
		    }); 
	        

	    	
	    });// function 끝
	    
    	// 회원정보 수정 가기전 비밀번호 확인모달
	    function checkP() {
	    	var pw1 = $("#m_checkPwd").val();
	    	var pw2 = $("#m_checkPwd2").val();
	    	$.ajax({
	            url  : "${pageContext.request.contextPath}/member/memberUpdatePwdcheck.do",
	            data : { m_pwd : $("#m_checkPwd").val() },
	            dataType: "json",
	            async:false,
	            success : function(data){
	            	if(data==1 && (pw1==pw2)) {
	            		$(".modal_profileModify2").fadeIn();
	            	} else {
	            		alert("비밀번호를 확인해주세요!");
	            	}
	                    
	            }, error : function(jqxhr, textStatus, errorThrown){
	                console.log("ajax 처리 실패");
	                //에러로그
	                console.log(jqxhr);
	                console.log(textStatus);
	                console.log(errorThrown);
	            	}

	    		}); // 에이잭스 끝
	    }; // 버튼이벤트 끝
	    
	    // 엔터키 이벤트 추가
	    function enterkey1() { 
	    	if (window.event.keyCode == 13) {
	    		
	    		checkP();
	    		
	    	};
	    };


    </script>

    <style>
        section {
            position: relative;
        }

        body {
            background: var(--black-color);
        }

        .Mypage_img {
            width: 300px;
            height: 300px;
            border-radius: 30px;
            margin-top: 5%;
            margin-left: 20%;

        }

        .Mypage_table .Mypage_head {
            font-size: 24px;
            font-weight: 700;
            padding: 12px;

        }

        .Mypage_table .Mypage_guide {
            font-size: 17px;
            font-weight: 700;

        }

        .Mypage_update_button {
            width: 250px;
            height: 40px;
            text-align: center;
            cursor: pointer;
            padding: 5px;
            background-color: none;
            border: 3px solid gray;
            border-radius: 10px;
            background: var(--black-color);
            color: white;
        }

        .Mypage_content td {
            color: white;
            font-size: 17px;
            padding: 10px;

        }

        .Mypage_table {
            margin: auto;
            margin-top: 30px;
            margin-right: 50px;

        }

        .profile {
            display: flex;
            justify-content: space-around;
        }

        .Mypage_line {
            background-color: white;
            height: 1px;
            margin-top: 10%;
        }

        /* 아이콘 부분 CSS */
        .Mypage_icons_table td {
            color: white;
            font-size: 24px;
            font-weight: 700;
            text-align: center;

        }

        .Mypage_icon_img {
            width: 100px;
        }

        .Mypage_icons_table {
            width: 1000px;
            height: 200px;
            margin-top: 5%;
        }

        .Mypage_icons_table td {
            width: 330px;
        }

        .Mypage_line1 {
            background-color: white;
            height: 1px;
            margin-top: 3%;
        }

        .main_topwindow {

            overflow: hidden;
            /*check out container's movement : command + / */
            position: relative;
            top: 20%;
            left: 50%;
            transform: translateY(-50%);
            transform: translateX(-50%);
            height: 300px;
            width: 1000px;
        }

        .main_topcontainer,
        .mypage_bookmarkContainer, .mypage_bookmarkContainer2 {
            position: absolute;
            height: 220px;
            width: 3500px;
            margin-left: 0;
            padding-left: 0;
            background: var(--black-color);
        }

        .left {
            border: solid #fff;
            border-width: 0 7px 7px 0;
            display: inline-block;
            position: absolute;
            top: 120px;
            z-index: 100;
            padding: 20px;
            margin-right: 10px;
            left: 30px;
            transform: rotate(135deg);
            -webkit-transform: rotate(135deg);
        }

        .right {
            border: solid #fff;
            border-width: 0 7px 7px 0;
            display: inline-block;
            right: 30px;
            position: absolute;
            top: 120px;
            z-index: 100;
            padding: 20px;
            transform: rotate(-45deg);
            -webkit-transform: rotate(-45deg);
        }

        .cell {
            width: 150px;
            height: 220px;
            display: inline-block;
            margin-right: 5px;
            margin-left: 5px;
            position: relative;
        }

        .cell img {
            width: 150px;
            height: 220px;
            margin-bottom: 5px;
        }
        
               .cellcu {
            width: 400px;
            height: 220px;
            display: inline-block;
            margin-right: 5px;
            margin-left: 5px;
            position: relative;
        }

        .cellcu>img {
            width: 400px;
            height: 220px;
            margin-bottom: 5px;
            object-fit: cover;
        }
        

        .main_topcontainer li,
        .mypage_bookmarkContainer, .mypage_bookmarkContainer2 {
            vertical-align: top;
        }

        .main_toprate {
            font-family: NanumBarunGothic;
            color: #fff;
            font-size: 14px;
            font-weight: 400;
        }

        .main_topcontent {
            position: relative;
        }

        .main_topicon {
            position: absolute;
            width: 15px;
            bottom: 10px;
            right: 10px;
            cursor: pointer;
            float: right;
        }

        .main_topinfo {
            position: absolute;
            top: 60px;
            left: 50px;
            
        }

		.main_cuinfo {
			position: absolute;
            top: 60px;
            left: 180px;
            text-align : center;
		}

        .main_contentTitle {
            font-size: 14px;
            font-weight: 400;
        }
        
            .main_fonto {
      font-family: NanumBarunGothic;
      color: #ff6801;
      font-size: 24px;
      font-weight: 400;
    }

    .main_fontw {
      font-family: NanumBarunGothic;
      color: #fff;
      font-size: 24px;
      font-weight: 400;
    }
    .mypage_myReview{
    margin-top: 80px
    }
    
    button {
    	cursor : pointer;
    }
    #pm_container input {
    	height : 26px;
    	width: 300px;
    	padding-left: 10px;
    }
    
    #pm_container .j_birth {
    	width: 94px;
    }
    
    #pm_container input:invalid{
	
    border : 1px solid red;
}
    
    </style>
  

</head>

<body>
<%@ include file="common/header.jsp"%>

<div class="modal_profileModify1">
	<div class="modal_profileModifyDiv1" title="비밀번호 확인">
		<p class="modal_content_close close2 ">X</p>
		<div class="modal_content loginArea">
			<h2 class=pm_title>비밀번호 확인</h2>
			<div id="pm_container">
				<table class="pm_table">
			        <!-- ID -->
			        <tr>
			            <td class="pm_title">
			                <h4 class="pm_subTitle">비밀번호</h4>
			            </td>
			            <td>
			                <input type="password" id="m_checkPwd" name="m_checkPwd" placeholder="6자리 이상, 영문 숫자 포함" onkeyup="enterkey1();">
			            </td>
			        </tr>
			        <tr>
			            <td class="pm_title">
			                <h4 class="pm_subTitle">비밀번호 확인</h4>
			            </td>
			            <td>
			                <input type="password" id="m_checkPwd2" name="m_checkPwd2" onkeyup="enterkey1();">
			            </td>
			        </tr>
			        <tr>
			            <td colspan="2" id="pwdValidate" class="red"></td>
			        </tr>
			        <!-- NAME -->
			    </table>
			</div>
		</div>
		<button class="pm_submitBtn1 AllowBtn" type="button" onclick="checkP()">회원정보 수정</button>
	</div>
</div>

<div class="modal_profileModify2">
	<div class="modal_profileModifyDiv2" title="수정 사항">
		<p class="modal_content_close close3 ">X</p>
		<div class="modal_content loginArea">
			<h2 class=pm_title>수정사항</h2>
			<div id="pm_container">
				<button class="pm_submitBtn2" type="button" >비밀번호 수정</button>
				<button class="pm_submitBtn3" type="button" >회원정보 수정</button>
			</div>
		</div>
	</div>
</div>

<div class="modal_profileModify3">
	<div class="modal_profileModifyDiv3" title="비밀번호 변경">
		<p class="modal_content_close close4 ">X</p>
		<form action="${pageContext.request.contextPath}/member/memberPwdUpdate.do" method="POST"">
		
			<div class="modal_content loginArea">
				<h2 class=pm_title>비밀번호 변경</h2>
					<div id="pm_container">
						<table class="pm_table">
				        <!-- ID -->
					        <tr>
					            <td class="pm_title">
					                <h4 class="pm_subTitle">새 비밀번호</h4>
					            </td>
					            <td>
					                <input type="password" id="m_changePwd" name="m_changePwd" placeholder="6자리 이상, 영문 숫자 포함">
					            </td>
					        </tr>
					        <tr>
					            <td class="pm_title">
					                <h4 class="pm_subTitle">새 비밀번호 확인</h4>
					            </td>
					            <td>
					                <input type="password" id="m_changePwd2" name="m_changePwd2">
					            </td>
					        </tr>
					        <tr>
					            <td colspan="2" id="pwdValidate" class="red"></td>
					        </tr>
				        <!-- NAME -->
				    </table>
				</div>
			</div>
		<button class="pm_submitBtn4 allowBtn" type="submit" >회원정보 수정</button>
		<button class="pm_submitBtn4 notAllowBtn" type="button" style="display:none; background:gray;">비밀번호 불일치</button>
		</form>
	</div>
</div>

<div class="modal_profileModify">
        
        <div class="modal_profileModifyDiv" title="회원정보 수정">
			<p class="modal_content_close close1 ">X</p>
            <div class="modal_content loginArea">
                <form action="${pageContext.request.contextPath}/member/memberUpdate.do" method="POST">
                    <h2 class=pm_title>회원정보 수정</h2>
                    <div id="pm_container">

                        <table class="pm_table">
                            <!-- ID -->
                            <tr>
                                <td class="pm_title">
                                    <h4 class="pm_subTitle" >아이디</h4>
                                </td>
                                <td>
                                    <input type="text" name="m_id" id="pm_id" placeholder="영문, 숫자 허용" value="${member.m_id}" style="background:rgb(233, 227, 227);" disabled required>

                                </td>

                            </tr>
                            <!-- NAME -->
                            <tr>
                                <td class="pm_title">
                                    <h4 class="pm_subTitle">이름</h4>
                                </td>
                                <td>
                                    <input type="text" name="m_name" id="m_name" value="${member.m_name}" required style="background:rgb(233, 227, 227);" disabled>
                                </td>
                            </tr>
                            <!-- GENDER -->
                            <tr>
                                <td class="pm_title">
                                    <h4 class="pm_subTitle">성별</h4>
                                </td>
                                <td class="pm_gender">
                                    <input type="radio" name="m_gender" id="gender_M2" value="M" 
                                   		${gender.equals("M") ? 'checked' : ''}/> 
                                    <label for="gender_M2">남성</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    
                                    <input type="radio" name="m_gender" id="gender_F2" value="F" 
                                    	${gender.equals("F")? 'checked' : ''}/>
                                    <label for="gender_F2">여성</label>
                                </td>
                            </tr>
                            <!-- BIRTH -->
                            <tr>
                                <td class="pm_title">
                                    <h4 class="pm_subTitle">생년월일</h4>
                                </td>
                                <td class="pm_birth">
                                    <input type="text" class="j_birth" name="m_date2" id="pm_birth" maxlength="4"
                                        placeholder="2021" value="${ birth[0] }" required pattern="19[0-9][0-9]|20\d{2}">
                                    <input type="text" class="j_birth" name="m_date2" id="pm_birth" maxlength="2"
                                        placeholder="월" value="${ birth[1] }" required pattern="0[0-9]|1[0-2]" title="생년월일을 확인해주세요">
                                    <input type="text" class="j_birth" name="m_date2" id="pm_birth" maxlength="2"
                                        placeholder="일" value="${ birth[2] }" required pattern="0[1-9]|[1-2][0-9]|3[0-1]" title="생년월일을 확인해주세요">
                                </td>
                            </tr>
                            <!-- PHONE -->
                            <tr>
                                <td class="pm_title">
                                    <h4 class="pm_subTitle">연락처</h4>
                                </td>
                                <td class="pm_phone">
                                    <select name="m_phone" id="m_phone3" style="height: 24px;">
                                    	<option value="${ phoneArr[0] }" selected>${ phoneArr[0] }</option>
                                        <option value="010">
                                            010
                                        </option>
                                        <option value="011">
                                            011
                                        </option>
                                        <option value="016">
                                            016
                                        </option>
                                        <option value="019">
                                            019
                                        </option>
                                        <option value="02">
                                            02
                                        </option>
                                        <option value="050">
                                            050
                                        </option>
                                    </select>
                                    <span style="color:black">-</span>
                                    <input type="text" name="m_phone" id="m_phone4" maxlength="10"
                                        style="width: 100px;" value="${ phoneArr[1] }" required pattern="[0-9]{3,4}" title="연락처를 확인해주세요!">
                                    <span style="color:black">-</span>
                                    <input type="text" name="m_phone" id="m_phone5" maxlength="10"
                                        style="width: 100px;" value="${ phoneArr[2] }" required pattern="[0-9]{3,4}" title="연락처를 확인해주세요!">   

                                </td>
                            </tr>
                            <!-- ADDRESS -->

                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">우편번호</h4>
                                </td>
                                <td>
                                    <input type="text" name="m_address" id="m_address3" value="${ addArr[0] }" size="40" maxlength="40" style="width:100px; background:rgb(233, 227, 227);" readonly>
                                    <button class="join_addrBtn2" style="width:70px; height:26px; background:var(--main-color); text-align:center;" type="button">검색</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">도로명 주소</h4>
                                </td>
                                <td>
                                    <input type="text" name="m_address" id="m_address4" value="${ addArr[1] }" size="40" maxlength="40" style="background:rgb(233, 227, 227);" readonly>
                                </td>
                                
                            </tr>
                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">상세주소</h4>
                                </td>
                                <td>
                                    <input type="text" name="m_address" id="m_address5" value="${ addArr[2] }" size="40" maxlength="40">
                                </td>
                            </tr>
                        </table>
                    </div>



                    <!-- 선호 장르 선택 -->
                    <h4 class="pm_checkTitle">선호 장르</h4>
                    <table class="check_table">
                        <tr>
                            <td class="pm_checkArea"><input type="checkbox" class="check-box" id="check-box8"
                                    name="m_genre" value="연극" ${genre.contains("연극")?"checked":"" }><label for="check-box8">연극</label></td>
                            <td class="pm_checkArea"><input type="checkbox" class="check-box" id="check-box9"
                                    name="m_genre" value="뮤지컬" ${genre.contains("뮤지컬")?"checked":"" }><label for="check-box9">뮤지컬</label></td>
                            <td class="pm_checkArea"><input type="checkbox" class="check-box" id="check-box10"
                                    name="m_genre" value="무용" ${genre.contains("무용")?"checked":"" }><label for="check-box10">무용</label></td>
                            <td class="pm_checkArea"><input type="checkbox" class="check-box" id="check-box11"
                                    name="m_genre" value="클래식" ${genre.contains("클래식")?"checked":"" }><label for="check-box11">클래식</label></td>

                        </tr>
                        <tr>
                            <td class="pm_checkArea"><input type="checkbox" class="check-box" id="check-box12"
                                    name="m_genre" value="오페라" ${genre.contains("오페라")?"checked":"" }><label for="check-box12">오페라</label></td>
                            <td class="pm_checkArea"><input type="checkbox" class="check-box" id="check-box13"
                                    name="m_genre" value="국악" ${genre.contains("국악")?"checked":"" }><label for="check-box13">국악</label></td>
                            <td class="pm_checkArea"><input type="checkbox" class="check-box" id="check-box14"
                                    name="m_genre" value="복합" ${genre.contains("복합")?"checked":"" }><label for="check-box14">복합</label></td>
                            <td class="pm_checkArea"></td>
                        </tr>

                    </table>
            </div>

            <button class="pm_submitBtn" type="submit">회원정보 수정</button>
            </form>

        </div>
    </div>
    
    
    <section>
        <!-- 회원 사진 -->
        <div class="profile">
        	<form id="FILE_FORM" name="mypageImg" action="${pageContext.request.contextPath}/mypage/profileImg.do" method="post" enctype="multipart/form-data">
	            <div>
	            <c:if test="${empty member.m_picRenamed}" >
	                <img class="Mypage_img" id="profileImg" src="/playduck/resources/profileImg/nopic.jpg" alt="프로필 사진">
	            </c:if>
	            <c:if test="${!empty member.m_picRenamed}">
	                <img class="Mypage_img" id="profileImg" name="profileImg" src="/playduck/resources/profileImg/${member.m_picRenamed}" alt="프로필 사진">
	            </c:if>

	            </div>
	            <input type="file" class="hidden" accept="image/*" name="profileImg" id="profileImg1" />
	            
	            <!-- 프로필 사진 클릭 시 프로필 사진 변경 기능 -->
	            <script>
		        	$('.Mypage_img').on('click', function(){
		        		$('#profileImg1').click();
		        	})
		        	
		         // 사진 미리보기 구현
	    			$("#profileImg1").change(function() {
	       				 $('#FILE_FORM').submit();
	   				});
			
		       </script>
            </form>
            
            
            
            
            
            <div class="Mypage_content">
                <table class="Mypage_table">
                    <tr>
                        <td class="Mypage_head">회원정보</th>
                    </tr>
                    <tr>
                        <td class="Mypage_guide">이름</td>
                        <td>${member.m_name}</td>
                    </tr>
                    <tr>
                        <td class="Mypage_guide">전화번호</td>
                        <td>${member.m_phone}</td>
                    </tr>
                    <tr>
                        <td class="Mypage_guide">생년월일</td>
                        <td>${member.m_date}</td>
                    </tr>
                    <tr>
                        <td class="Mypage_guide">주소</td>
                        <td>${member.m_address}</td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <input class="Mypage_update_button" type="button" value="회원정보 수정">
                        </td>
                    </tr>
                </table>

            </div>
        </div>


        <hr class="Mypage_line">

        <div class="Mypage_icons">
            <table class="Mypage_icons_table">
                <tr>
                    <td><img class="Mypage_icon_img" src="../resources/images/mypage_review.png" alt="아이콘1"></td>
                    <td><img class="Mypage_icon_img" src="../resources/images/mypage_rewards.png" alt="아이콘2"></td>
                    <td><img class="Mypage_icon_img" src="../resources/images/mypage_rank.png" alt="아이콘3"></td>
                </tr>
                <tr>
                    <td>작성한 리뷰</td>
                    <td>내 리워드</td>
                    <td>PLAYDUCK</td>
                </tr>
                <tr>
                    <td style="color : #ff6801;">${review}개</td>
                    <td style="color : #ff6801;">${reward}점</td>
                    <td style="color : #ff6801;">${rank}</td>
                </tr>
            </table>
        </div>

        <hr class="Mypage_line1">
        <!--작성한 리뷰-->
        <article class="mypage_myReview">
            <div> <span class="main_fonto">${member.m_name}</span> <span class="main_fontw">님이 최근 작성한 리뷰</span></div>
            <div class="main_topwindow">
                <div class="button-container">
                    <button class="prev"><i class="arrow left"></i></button>
                </div>
                <ul class="main_topcontainer" id="myReview">
                    
                    
                </ul>
                <div class="button-container">
                    <button class="next"><i class="arrow right"></i></button>
                </div>
            </div>
            <script>
                const container = document.querySelector(".main_topcontainer");
                const prevBtn = document.querySelector(".prev");
                const nextBtn = document.querySelector(".next");

                (function addEvent() {
                    prevBtn.addEventListener('click', translateContainer.bind(this, 1));
                    nextBtn.addEventListener('click', translateContainer.bind(this, -1));
                })();

                function translateContainer(direction) {
                    const selectedBtn = (direction === 1) ? 'prev' : 'next';
                    container.style.transitionDuration = '500ms';
                    container.style.transform = `translateX(${direction * ( 4.7 )}%)`;
                    container.ontransitionend = () => reorganizeEl(selectedBtn);
                }

                function reorganizeEl(selectedBtn) {
                    container.removeAttribute('style');
                    (selectedBtn === 'prev') ? container.insertBefore(container.lastElementChild, container
                            .firstElementChild):
                        container.appendChild(container.firstElementChild);
                }
                $(function () {
                    $(".main_topicon").click(function () {
                        $("#star").removeClass("far");
                        $("#star").addClass("fas");
                    })
                });
                $('.cell').on('mouseenter', function () {
                    $(this).children('.main_topinfo').show();
                }).on('mouseleave', function () {
                    $(this).children('.main_topinfo').hide();
                });
                
                
                //*****************************************************************//
                
	$(function(){
		 $.ajax({
			 url : "${pageContext.request.contextPath}/mypage/myReview.do",
			 type : 'get',
			 data : {mm : ${member.m_no}},
			 success : function(data) {
				console.log(data);
				 
				for(var i in data.title){
							
					var innerHtml = ""
					
					innerHtml =	  '<li class="cell">'
					innerHtml +='<img src='+data.poster[i] +'>'
					innerHtml +='<div class="main_topinfo" style="display:none;">'
					innerHtml +=  "<button class='main_toprevieww' onclick=\"location.href='${pageContext.request.contextPath}/detail/detail.do?p_no="+data.pnum[i]+"'\""
					innerHtml +=   'style="border: none; background-color: var(--black-color);color: #fff;">리뷰보기</button>'
					innerHtml +=  '<hr>'
					
					innerHtml +='</div>'
					innerHtml += '<div class="main_topcontent">'
					innerHtml +=   '<h3 style="color: #fff;" class="titleremove'+i+'">'+data.title[i]+'</h3>'
					innerHtml +=   '<span class="main_toprate"></span>'
					innerHtml +=  '<div class="main_topicon">'
					innerHtml += ' </div>'
					innerHtml += '</div>'
					innerHtml +='</li>'
								
					$("#myReview").append(innerHtml);
				
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
				      container.style.transitionDuration = '500ms';
				      container.style.transform = `translateX(${direction * ( 4.7 )}%)`;
				      container.ontransitionend = () => reorganizeEl(selectedBtn);
				    }
				    
				    function reorganizeEl(selectedBtn) {
				      container.removeAttribute('style');
				      (selectedBtn === 'prev') ? container.insertBefore(container.lastElementChild, container.firstElementChild):
				      container.appendChild(container.firstElementChild);
				    }
				    
				    
				}
				
				
			    
				// 포스터에 hover 시 리뷰보기 / 작성하기
			    $('.cell').on('mouseenter', function () {
			         	 $(this).children('.main_topinfo').show();
			    }).on('mouseleave', function () {
			        	 $(this).children('.main_topinfo').hide();
			     });
				
			
			}

		 });
	 });
			
	
                
            </script>
        </article>
<br /><br /><br /><br /><br />

        <!-- 두번째 슬라이드 -->
        <article class="mypage_bookmark">
            <div><span class="main_fonto">찜한 </span> <span class="main_fontw">공연 목록</span></div>
            <div class="main_topwindow">
                <div class="button-container">
                    <button class="prev2"><i class="arrow left"></i></button>
                </div>
                <ul class="mypage_bookmarkContainer" id="bookmarList">
              
                   
                </ul>
                <div class="button-container">
                    <button class="next2"><i class="arrow right"></i></button>
                </div>
                </div>
                </article>
                <script>
                    const container2 = document.querySelector(".mypage_bookmarkContainer");
                    const prevBtn2 = document.querySelector(".prev2");
                    const nextBtn2 = document.querySelector(".next2");

                    (function addEvent() {
                        prevBtn2.addEventListener('click', translateContainer.bind(this, 1));
                        nextBtn2.addEventListener('click', translateContainer.bind(this, -1));
                    })();

                    function translateContainer(direction) {
                        const selectedBtn2 = (direction === 1) ? 'prev2' : 'next2';
                        container2.style.transitionDuration = '500ms';
                        container2.style.transform = `translateX(${direction * ( 4.7 )}%)`;
                        container2.ontransitionend = () => reorganizeEl2(selectedBtn2);
                    }

                    function reorganizeEl2(selectedBtn) {
                        container2.removeAttribute('style');
                        (selectedBtn === 'prev2') ? container2.insertBefore(container2.lastElementChild, container2
                                .firstElementChild):
                            container2.appendChild(container2.firstElementChild);
                    }
                    $(function () {
                        $(".main_topicon").click(function () {
                            $("#star").removeClass("far");
                            $("#star").addClass("fas");
                        })
                    });
                    $('.cell').on('mouseenter', function () {
                        $(this).children('.main_topinfo').show();
                    }).on('mouseleave', function () {
                        $(this).children('.main_topinfo').hide();
                    });
                    
                    
                 // 찜 삭제 function
                    
                    function deleteMyP(no){
            		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
            		    
            		    location.href="${pageContext.request.contextPath}/mypage/deletePlay.do?no="+no;

            		}else{   //취소
            		    return;
            		}
            		}

                    
                    //*****************************************************************//
                    
	$(function(){
		 $.ajax({
			 url : "${pageContext.request.contextPath}/mypage/mybookmarkPlay.do",
			 type : 'get',
			 data : {mm : ${member.m_no}},
			 success : function(data) {
				console.log(data);
				 
				for(var i in data.title1){
							
					var innerHtml = ""
					
					innerHtml =	  '<li class="cell">'
					innerHtml +='<img src='+data.poster[i] +'>'
					innerHtml +='<div class="main_topinfo" style="display:none;">'
					innerHtml +=  "<button class='main_toprevieww' onclick=\"location.href='${pageContext.request.contextPath}/detail/detail.do?p_no="+data.pnum[i]+"'\""
					innerHtml +=   'style="border: none; background-color: var(--black-color);color: #fff;">상세보기</button>'
					innerHtml +=  '<hr>'
					innerHtml +=  '<br>'
					
					innerHtml +=  "<button class='main_topreviewr' "
					innerHtml +=   ' style="border: none; background-color: var(--black-color);color: #fff;" onclick="deleteMyP(\''+ data.pnum[i] +'\')">찜 삭제</button>'
					
					
					innerHtml +='</div>'
					innerHtml += '<div class="main_topcontent">'
					innerHtml +=   '<h3 style="color: #fff;" class="bookmarkPlay'+i+'">'+data.title1[i]+'</h3>'
					innerHtml +=   '<span class="main_toprate"></span>'
					innerHtml +=  '<div class="main_topicon">'
					// 찜 아이콘 삭제
					innerHtml += ' </div>'
					innerHtml += '</div>'
					innerHtml +='</li>'
								
					$("#bookmarList").append(innerHtml);
				
					// 글자 수 제한
					var length = 8;
					
					// 확인
					$('.bookmarkPlay'+i).each(function(){
						if($('.bookmarkPlay'+i).text().length >= length){
							$('.bookmarkPlay'+i).text($('.bookmarkPlay'+i).text().substr(0,length)+'...');
						}
					});
					
					
					   const container = document.querySelector(".main_topcontainer");
				        const prevBtn = document.querySelector(".prev");
				        const nextBtn = document.querySelector(".next");
						
				        // 확인
				        (function addEvent() {
				          prevBtn.addEventListener('click', translateContainer.bind(this, 1));
				          nextBtn.addEventListener('click', translateContainer.bind(this, -1));
				        })();
				     // 확인
				        function translateContainer(direction) {
				          const selectedBtn = (direction === 1) ? 'prev' : 'next';
				          container.style.transitionDuration = '500ms';
				          container.style.transform = `translateX(${direction * ( 4.7 )}%)`;
				          container.ontransitionend = () => reorganizeEl(selectedBtn);
				        }
				     	// 확인
				        function reorganizeEl(selectedBtn) {
				          container.removeAttribute('style');
				          (selectedBtn === 'prev') ? container.insertBefore(container.lastElementChild, container.firstElementChild):
				            container.appendChild(container.firstElementChild);
				        }

				     // 확인
				     }

			    
				// 포스터에 hover 시 리뷰보기 / 작성하기
			    $('.cell').on('mouseenter', function () {
			         	 $(this).children('.main_topinfo').show();
			    }).on('mouseleave', function () {
			        	 $(this).children('.main_topinfo').hide();
			     });

				}
			 });
		 });
                    
                </script>

<br /><br /><br /><br /><br />
    <!-- 세번째 슬라이드 -->
    <article class="mypage_bookmark2">
        <div> <span class="main_fonto">찜한 </span> <span class="main_fontw">큐레이션 목록</span></div>
        <div class="main_topwindow">
            <div class="button-container">
                <button class="prev3"><i class="arrow left"></i></button>
            </div>
            <ul class="mypage_bookmarkContainer2" id="bookmarList2">
                
                
            </ul>
            <div class="button-container">
                <button class="next3"><i class="arrow right"></i></button>
            </div>
            </div>
    </article>
    <script>
        const container3 = document.querySelector(".mypage_bookmarkContainer2");
        const prevBtn3 = document.querySelector(".prev3");
        const nextBtn3 = document.querySelector(".next3");

        (function addEvent() {
            prevBtn3.addEventListener('click', translateContainer.bind(this, 1));
            nextBtn3.addEventListener('click', translateContainer.bind(this, -1));
        })();

        function translateContainer(direction) {
            const selectedBtn3 = (direction === 1) ? 'prev3' : 'next3';
            container3.style.transitionDuration = '500ms';
            container3.style.transform = `translateX(${direction * ( 4.7 )}%)`;
            container3.ontransitionend = () => reorganizeEl3(selectedBtn3);
        }

        function reorganizeEl3(selectedBtn) {
            container3.removeAttribute('style');
            (selectedBtn === 'prev2') ? container3.insertBefore(container3.lastElementChild,
                    container3.firstElementChild):
                container3.appendChild(container3.firstElementChild);
        }
        $(function () {
            $(".main_topicon").click(function () {
                $("#star").removeClass("far");
                $("#star").addClass("fas");
            })
        });
        $('.cell').on('mouseenter', function () {
            $(this).children('.main_topinfo').show();
        }).on('mouseleave', function () {
            $(this).children('.main_topinfo').hide();
        });
        
        // 찜 삭제 function
        
        function deleteMyC(no){
        	if (confirm("정말 삭제하시겠습니까??") == true){    //확인
    		    
    		    location.href="${pageContext.request.contextPath}/mypage/deleteCuration.do?no="+no;

    		}else{   //취소
    		    return;
    		}
    		}

        
        
        //*****************************************************************//
        
        $(function(){
		 $.ajax({
			 url : "${pageContext.request.contextPath}/mypage/mybookmarkContent.do",
			 type : 'get',
			 data : {	mm : ${member.m_no} },
			 success : function(data) {
				console.log(data);
				 
				for(var i in data.title){
							
					var innerHtml = ""
					
					innerHtml =	  '<li class="cellcu">'
					innerHtml +='<img  src="../resources/curation/'+data.poster[i]+'">'
					innerHtml +='<div class="main_cuinfo" style="display:none;">'
					innerHtml +=  "<button class='main_toprevieww' onclick=\"location.href='${pageContext.request.contextPath}/curation/curationSelectOne.do?c_no="+data.cu[i]+"'\""
					innerHtml +=   'style="border: none; background-color: var(--black-color);color: #fff;">상세보기</button>'
					innerHtml +=  '<hr>'
					innerHtml +=  '<br>'
					innerHtml +=  "<button class='main_topreviewr' "
					innerHtml +=   ' style="border: none; background-color: var(--black-color);color: #fff;" onclick="deleteMyC('+ data.cu[i] +')">찜 삭제</button>'
					innerHtml +='</div>'
					innerHtml += '<div class="main_topcontent">'
					innerHtml +=   '<h3 style="color: #fff;" class="bookmarkCuration'+i+'">'+data.title[i]+'</h3>'
					innerHtml +=   '<span class="main_toprate"> </span>'
					innerHtml +=  '<div class="main_topicon">'
						// 찜 아이콘 삭제
					innerHtml += ' </div>'
					innerHtml += '</div>'
					innerHtml +='</li>'
								
					$("#bookmarList2").append(innerHtml);
				
					// 글자 수 제한
					var length = 35;
					
					
					$('.bookmarkCuration'+i).each(function(){
						if($('.bookmarkCuration'+i).text().length >= length){
							$('.bookmarkCuration'+i).text($('.bookmarkCuration'+i).text().substr(0,length)+'...');
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
				          container.style.transitionDuration = '500ms';
				          container.style.transform = `translateX(${direction * ( 4.7 )}%)`;
				          container.ontransitionend = () => reorganizeEl(selectedBtn);
				        }
				     	
				        function reorganizeEl(selectedBtn) {
				          container.removeAttribute('style');
				          (selectedBtn === 'prev') ? container.insertBefore(container.lastElementChild, container.firstElementChild):
				            container.appendChild(container.firstElementChild);
				        }

				    
				     }

			    
					// 찜 클릭 시
				    $(function () {
				    	$(".main_topicon").on("click",function () {
				            $("#star").removeClass("far");
				            $("#star").addClass("fas");
				          })
				        
				    });
					
					
					// 포스터에 hover 시 리뷰보기 / 작성하기
				    $('.cellcu').on('mouseenter', function () {
				         	 $(this).children('.main_cuinfo').show();
				    }).on('mouseleave', function () {
				        	 $(this).children('.main_cuinfo').hide();
				    });
				
				

				}
			 });
		 });
        
        
        
    </script>

    </section>
    <br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />

		<br />
    	<%@ include file="common/footer.jsp"%>
</body>

</html>