<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<head>
<style>
	#m_email, #find_m_name, #find_m_email {
		width: 298px;
	height: 38px;
	display: block;
	padding: 5px;
	border: 1px solid var(--black-color);
	margin-bottom: 10px;
	margin-left : 37.3%;
	}
	
	.header_login a:hover {
		color: var(--main-color);
	}
	
	.header_searchArea a:hover {
		color: var(--main-color);
	}
	
</style>


<script src="../resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    $(function(){
    	// 주소조회 api
    	$('.join_addrBtn').on('click',function(){
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
                    $('#m_address0').val(data.zonecode);
                    $('#m_address1').val(roadAddr);
                }
            }).open();
    	});
    	
    	// invalidate 쓰는용도
    	jQuery.extend(jQuery.expr[':'], {
            invalid : function(elem, index, match){
                var invalids = document.querySelectorAll(':invalid'),
                    result = false,
                    len = invalids.length;

                if (len) {
                    for (var i=0; i<len; i++) {
                        if (elem === invalids[i]) {
                            result = true;
                            break;
                        }
                    }
                }
                return result;
            }
        });
    	var idcheck = 0;
    	var pwcheck = 0;
    	// invalidate 쓰는용도
        $(".joinArea input").on("click",function(){
        	
        	var flag = "1";
            $("input[name='m_genre']").each( function () {
                if (this.checked) {
                    flag = "2"; 
                }
            });

        	if( (! $(".joinArea input").is(":invalid") ) && flag=="2" && idcheck==1 && pwcheck==1 ){
        		$(".j_ErrorBtn").hide();
            	$(".j_submitBtn").show();
        		
            } else {
            	$(".j_ErrorBtn").show();
				$(".j_submitBtn").hide();
            }
        	
        }); // invalidate 끝
        
		// readonly, required 동시사용용도
        $(".readonly").keydown(function(e){
            e.preventDefault();
        });

        
    	
        $('#find_idbtn').on('click',function(){
        	$.ajax({
    			url : '${pageContext.request.contextPath}/member/memberIdFind.do',
    			type : 'post',
    			data : { 
    				m_email : $('#find_m_email').val()
    				,m_name : $('#find_m_name').val()
    		},
    			async : 'false',
    			success : function(data) {
    				alert(data.msg)
    				if(data.msg=="이메일 찾기 화면으로 이동합니다."){
    					location.href="${pageContext.request.contextPath}/member/memberIdFindResult.do?m_email="+data.m_email;
    				}
    				
    			}
    		
        	});
        	
        }); // 아이디 중복체크
        $("#join_id").on("keyup",function(){
        	var userId = $(this).val().trim();
        	var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
        	
        	if(userId.length<4) {
        		$(".id_ok").hide();
        		$(".id_error").hide();
        		$(".id_4").show();
        		$(".id_error2").hide();
        		$(this).css("border", "1px solid red");
        		idcheck = 0;
        		
        	} else if(!idReg.test( userId )){
        		$(".id_ok").hide();
        		$(".id_error").hide();
        		$(".id_4").hide();
        		$(".id_error2").show();
        		$(this).css("border", "1px solid red");
        		idcheck = 0;
        		
        	} else {
        		var a = $("input[name=m_id]").val()
        		$.ajax({
		            url  : "${pageContext.request.contextPath}/member/checkIdDuplicate.do",
		            data : { m_id : a },
		            dataType: "json",
		            async:false,
		            success : function(data){
		                if(data.data===true){ //viewName 방식
		                    $(".id_error").hide();
		                    $(".id_4").hide();
		                    $(".id_error2").hide();
		                    $(".id_ok").show();
		                    $("input[name=m_id]").css("border", "1px solid black");
		                    idcheck = 1;
		                    
		                } else {
		                    $(".id_error").show();
		                    $(".id_4").hide();
		                    $(".id_ok").hide();
		                    $(".id_error2").hide();
		                    $("input[name=m_id]").css("border", "1px solid red");
		                    idcheck = 0;
		                }
		            }, error : function(jqxhr, textStatus, errorThrown){
		                console.log("ajax 처리 실패");
		                //에러로그
		                console.log(jqxhr);
		                console.log(textStatus);
		                console.log(errorThrown);
		            	}

	        		}); // 에이잭스 끝
        	} // else 문
	     }); // 아이디 중복체크 끝
	     
	     // 비밀번호 체크
	     $("#join_pwd1").on("blur",function(){
	    	 var join_pwd1 = $(this).val().trim();
	    	 var join_pwd2 = $("#join_pwd2").val().trim();
	    	 
	    	 if((join_pwd1!==""&&join_pwd2!=="")){
	    	 
		    	 if(join_pwd1==join_pwd2){
		    		 $(this).css("border", "1px solid black");
		    		 $("#join_pwd2").css("border", "1px solid black");
		    		 $(".pwd_error").hide();
	                 $(".pwd_ok").show();
	                 pwcheck = 1;
		    	 } else {
		    		 $(this).css("border", "1px solid red");
		    		 $("#join_pwd2").css("border", "1px solid red");
		    		 $(".pwd_error").show();
	                 $(".pwd_ok").hide();
	                 pwcheck = 0;
		    	 }
	    	 }
	     }); 
	     
	     $("#join_pwd2").on("blur",function(){
	    	 var join_pwd2 = $(this).val().trim();
	    	 var join_pwd1 = $("#join_pwd1").val().trim();
	    	 if((join_pwd1!==""&&join_pwd2!=="")){
	    		 
		    	 if(join_pwd1==join_pwd2){
		    		 $(this).css("border", "1px solid black");
		    		 $("#join_pwd1").css("border", "1px solid black");
		    		 $(".pwd_error").hide();
	                 $(".pwd_ok").show();
	                 pwcheck = 1;
		    	 } else {
		    		 $(this).css("border", "1px solid red");
		    		 $("#join_pwd1").css("border", "1px solid red");
		    		 $(".pwd_error").show();
	                 $(".pwd_ok").hide();
	                 pwcheck = 0;
		    	 }
	    	 }
	     }); 
	     
	     
        
	}); // function
    


    
</script>

</head>

	<div class="headerArea">
	
<h1 class="hidden">playduck</h1>
<header>
	<div class="header_searchArea">
		<img class="header_search" src="${pageContext.request.contextPath}/resources/images/main_search.png"
			alt="">
		<a class="all_content" href="${pageContext.request.contextPath}/list/playlist.do">전체작품</a> | 	<a class="all_content" href="${pageContext.request.contextPath}/curation/culist.do">전체큐레이션</a> | <a class="all_md" href="${pageContext.request.contextPath}/md/md_main.do">전체MD</a>
	</div>
	
	<a href="${pageContext.request.contextPath}/"><img class="header_logo" src="${pageContext.request.contextPath}/resources/images/logo.png" alt="" ></a>
	<div class="header_login">
		<c:if test="${empty member}">
			<a class="modal_loginBtn">로그인</a> | <a class="modal_joinBtn">회원가입</a>
		</c:if>
		<c:if test="${!empty member and fn:trim(member.m_status) eq '1'}">
			<a href="${pageContext.request.contextPath}/mypage/mypage.do">${member.m_name }</a> |
			<a href="${pageContext.request.contextPath}/buy/buylist.do">구매목록</a> |
			<a href="${pageContext.request.contextPath}/MD/MD_buy2?mno=${member.m_no}">장바구니</a> |
			<a href="${pageContext.request.contextPath}/member/memberLogout.do">로그아웃</a>
		</c:if>
		
		<c:if test="${!empty member and fn:trim(member.m_status) eq '3'}">
			<a href="${pageContext.request.contextPath}/mypage/mypage.do">${member.m_name }</a> |
			<a href="${pageContext.request.contextPath}/adminpage/admin.do">관리자 페이지</a> |
			<a href="${pageContext.request.contextPath}/member/memberLogout.do">로그아웃</a>
		</c:if>
		
		<div class="modal_search">
            <div class="modal_searchDiv" title="검색">
                <span class="modal_content_close">X</span>
                <div class="modal_content searchArea">
                   
                        <input class="main_searchInput" type="text" onkeyup="enterkey();" placeholder="보고싶은 공연을 검색하세요!"/>
                        <button class="main_search">검색</button>
                   
                </div>
            </div>
    </div>
<script>
function enterkey() {
    if (window.event.keyCode == 13) {

    	if ($('.main_searchInput').val() == "") {
			alert("입력 해주세요");
		} else {
			
			var a = $('.main_searchInput').val();
				
			location.href = "${pageContext.request.contextPath}/list/playsr.do?text="+a;
		}
    }
}
	$(function() {
		$('.main_search').on("click", function() {
			if ($('.main_searchInput').val() == "") {
				alert("입력 해주세요");
			} else {
				
				var a = $('.main_searchInput').val();
					
				location.href = "${pageContext.request.contextPath}/list/playsr.do?text="+a;
			}
		})
	})
</script>
		
		<div class="modal_join">
        <div class="modal_joinDiv" title="회원가입">
            <span class="modal_content_close">X</span>
            <div class="modal_content joinArea">
                <form action="${pageContext.request.contextPath}/member/memberInsert.do" method="POST">
                    <h2 class=join_title>회원가입</h2>
                    <div id="join_container">

                        <table class="join_table">
                            <!-- ID -->
                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">아이디</h4>
                                </td>
                                <td>
                                    <input type="text" name="m_id" id="join_id" placeholder="영문, 숫자 허용" required autocomplete='off'>
                                    <div class="validate valigreen id_ok">사용 가능한 아이디입니다.</div>
                                    <div class="validate valired id_4">4자리 이하는 사용하실수 없습니다.</div>
                                    <div class="validate valired id_error">중복된 아이디입니다.</div>
                                    <div class="validate valired id_error2">영어와 숫자만 사용가능합니다.</div>
                                </td>
                            </tr>
                            <!-- PASSWORD -->
                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">비밀번호</h4>
                                </td>
                                <td>
                                    <input type="password" id="join_pwd1" name="m_pwd" placeholder="6자리 이상, 영문 숫자 포함" required>
                                </td>
                            </tr>
                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">비밀번호 확인</h4>
                                </td>
                                <td>
                                    <input type="password" id="join_pwd2" name="m_pwd2" required>
                                    <div class="validate valired pwd_error">비밀번호가 다릅니다.</div>
                                    <div class="validate valigreen pwd_ok">사용 가능한 비밀번호 입니다.</div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" id="pwdValidate" class="red"></td>
                            </tr>
                            <!-- NAME -->
                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">이름</h4>
                                </td>
                                <td>
                                    <input type="text" name="m_name" id="m_name" required autocomplete='off'>
                                </td>
                            </tr>
                            <!-- GENDER -->
                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">성별</h4>
                                </td>
                                <td class="join_gender">
                                    <input type="radio" name="m_gender" id="gender_M" value="M" required/> <label
                                        for="gender_M">남성</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" name="m_gender" id="gender_F" value="F" /> <label
                                        for="gender_F">여성</label>
                                </td>
                            </tr>
                            <!-- BIRTH -->
                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">생년월일</h4>
                                </td>
                                <td class="join_birth">
                                	<input type="hidden" name="m_pic" value="nopic.jpg"/>
                                	<input type="date" name="m_date" value="2021-06-23" style="display:none;" autocomplete='off'/>
                                    <input type="text" class="j_birth" name="m_date1" id="join_birth" maxlength="4"
                                        placeholder="2021" required pattern="19[0-9][0-9]|20\d{2}" autocomplete='off'>
                                    <input type="text" class="j_birth" name="m_date1" id="join_birth" maxlength="2"
                                        placeholder="월" required pattern="0[0-9]|1[0-2]" title="생년월일을 확인해주세요" autocomplete='off'>
                                    <input type="text" class="j_birth" name="m_date1" id="join_birth" maxlength="2"
                                        placeholder="일" required pattern="0[1-9]|[1-2][0-9]|3[0-1]" title="생년월일을 확인해주세요" autocomplete='off'>
                                </td>
                            </tr>
                            <!-- PHONE -->
                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">연락처</h4>
                                </td>
                                <td class="join_phone">
                                    <select name="m_phone" id="m_phone" style="height: 24px;">
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
                                    <input type="text" name="m_phone" id="m_phone" maxlength="10"
                                        style="width: 100px;" required pattern="[0-9]{3,4}" title="연락처를 확인해주세요!" autocomplete='off'>
                                    <span style="color:black">-</span>
                                    <input type="text" name="m_phone" id="m_phone" maxlength="10"
                                        style="width: 100px;" required pattern="[0-9]{3,4}" title="연락처를 확인해주세요!" autocomplete='off'>    

                                </td>
                            </tr>
                            <!-- E-MAIL -->
                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">이메일</h4>
                                </td>
                                <td class="join_email">
                                    <input type="text" name="m_email" id="join_email1" placeholder="example" pattern="[a-z0-9._%+-]{4,20}" required autocomplete='off'> @
                                    <input type="text" name="m_email" id="join_email2" placeholder="example.com" pattern="[a-z0-9.-]+\.[a-z]{2,3}" required autocomplete='off'>
                                </td>
                            </tr>
                            
                            <!-- ADDRESS -->
                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">우편번호</h4>
                                </td>
                                <td>
                                    <input type="text" class="readonly" name="m_address" id="m_address0" size="40" maxlength="40" style="width:100px; background:rgb(233, 227, 227);" required>
                                    <button class="join_addrBtn" style="width:50px; height:26px; background:var(--main-color); text-align:center;" type="button">검색</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">도로명 주소</h4>
                                </td>
                                <td>
                                    <input type="text" name="m_address" class="readonly" id="m_address1" size="40" maxlength="40" style="background:rgb(233, 227, 227);" required>
                                </td>
                                
                            </tr>
                            <tr>
                                <td class="join_title">
                                    <h4 class="join_subTitle">상세주소</h4>
                                </td>
                                <td>
                                    <input type="text" name="m_address" id="m_address2" size="40" maxlength="40" required autocomplete='off'>
                                </td>
                            </tr>
                        </table>
                    </div>



                    <!-- 선호 장르 선택 -->
                    <h4 class="join_checkTitle">선호 장르</h4>
                    <table class="check_table">
                        <tr>
                            <td class="join_checkArea"><input type="checkbox" class="check-box" id="check-box1"
                                    name="m_genre" value="연극" ><label for="check-box1">연극</label></td>
                            <td class="join_checkArea"><input type="checkbox" class="check-box" id="check-box2"
                                    name="m_genre" value="뮤지컬"><label for="check-box2">뮤지컬</label></td>
                            <td class="join_checkArea"><input type="checkbox" class="check-box" id="check-box4"
                                    name="m_genre" value="무용"><label for="check-box4">무용</label></td>
                            <td class="join_checkArea"><input type="checkbox" class="check-box" id="check-box3"
                                    name="m_genre" value="클래식"><label for="check-box3">클래식</label></td>

                        </tr>
                        <tr>
                            <td class="join_checkArea"><input type="checkbox" class="check-box" id="check-box5"
                                    name="m_genre" value="오페라"><label for="check-box5">오페라</label></td>
                            <td class="join_checkArea"><input type="checkbox" class="check-box" id="check-box6"
                                    name="m_genre" value="국악"><label for="check-box6">국악</label></td>
                            <td class="join_checkArea"><input type="checkbox" class="check-box" id="check-box7"
                                    name="m_genre" value="복합"><label for="check-box7">복합</label></td>
                            <td class="join_checkArea"></td>
                        </tr>

                    </table>
            </div>

            <button class="join_submitBtn j_submitBtn" type="submit" style="display:none;">회원가입</button>
            <button class="join_submitBtn j_ErrorBtn" type="button" style="background:gray; ">내용을 모두 채워주세요</button>
            </form>

        </div>
    </div>
    <div class="modal_login">
    	<form action="${pageContext.request.contextPath}/member/memberLogin.do" method="POST"">
            <div class="modal_loginDiv" title="로그인">
                <span class="modal_content_close">X</span>
                <div class="modal_content loginArea">
                    <h2 class="modal_loginTitle">로그인</h2>
                    <form action="" method="post">
                        <input type="text" name="m_id" id="m_id" maxlength="20" placeholder="아이디"/>
                        <input type="password" name="m_pwd" id="m_pwd" placeholder="비밀번호"/>
						<dic class="login_findArea">
                        <div class="login_find" id="modal_findBtn">아이디/비밀번호 찾기</div>
</dic>
                        <button type="submit" class="login_box login orange">로그인</button>
                        <button type="button" class="login_box join orange" id="login_joinBtn">회원가입</button>
                    </form>
                </div>
            </div>
		</form>
    </div>
    
    <div class="modal_find">
            <div class="modal_findDiv" title="아이디 비밀번호 찾기">
                <span class="modal_content_close">X</span>
                <div class="modal_content findArea">
                    <div class="find_id">
                        <h2 class=find_title>아이디 찾기</h2>
                            <input type="text" name="m_email" id="find_m_email" placeholder="이메일 주소"/>
                            <input type="text" name="m_name" id="find_m_name" placeholder="이름"/>
                            <button type="button" class="login_box find orange" id="find_idbtn">아이디 찾기</button>
                    </div>

                    <div class="find_pwd">
                        <h2 class=find_title>비밀번호 찾기/변경</h2>
                        <form action="${pageContext.request.contextPath}/member/findPwd.do" method="POST">
                            <div class="textbox">
	                            <input type="text" name="m_id" id="m_id" maxlength="20" placeholder="아이디"/>
	                            <input type="email" name="m_email" id="m_email" required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i"  placeholder="이메일 주소"/>
	                         <div class="error">유효하지 않은 이메일주소 입니다  </div>  
	                         </div> 
                            <button type="submit" id="check" class="login_box login orange">이메일 인증받기</button>
                        </form>
                    </div>

                </div>
            </div>
    </div>
    
    
    </div>
    
	</div>
</header>
</div>