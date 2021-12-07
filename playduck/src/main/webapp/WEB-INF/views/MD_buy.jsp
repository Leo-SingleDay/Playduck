<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>playduck - 주문하기</title>
    <link rel="stylesheet" href="../resources/css/common.css">
    <link rel="stylesheet" href="../resources/css/headerfooter.css">
<link rel="stylesheet" href="../resources/css/join.css">
<link rel="stylesheet" href="../resources/css/login.css">
<link rel="stylesheet" href="../resources/css/findIdPw.css">
    <link rel="stylesheet" href="../resources/css/buy.css">
   <script src="../resources/js/jquery-3.6.0.min.js"></script>
<script src="../resources/js/modal.js"></script>
<script src="../resources/js/topBtn.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<%@ include file="common/header.jsp"%>
    <section>
        <!--물품 구매 리스트-->
        <h3 class="buylist_title">장바구니</h3>
  <hr style="border: solid 1px;">

  <c:forEach items="${baskList}" var="baskList">
        <div class="Sale_list2">
            <div class="S_list" id="Sale_check">
                <input type="checkbox" class="checkli" name="list" id="${baskList.d_no}ch" value="${baskList.d_no }">
                <label for="${baskList.d_no }ch"></label></br>
                <input type="button" value="삭제" class="del">
            </div>
            <div class="S_list" id="Sale_img">
                <img class="Sale_baskimg" src="${baskList.d_pic}" width="200px" height="200px">
            </div>
            <div class="S_list" id="Sale_title">
                <table class="buy1_total">
                    <tr> 
                        <td class="Sale_title_th1" colspan="2">${baskList.d_title }</td>
                    </tr>
                    <tr>
                        <td class="Sale_title_td1">배송비</td>
                        <td class="Sale_title_td2">2,500원</td>
                    </tr>
                    <tr>
                        <td class="Sale_title_td1"></td>
                        <td class="Sale_title_td2"></td>
                    </tr>
				     <tr id="${baskList.d_no}" }>
                        <td class="Sale_title_td1">수량</td>
                        <td class="Sale_title_td2" id="${ baskList.d_price }">
        					<input type="hidden" class="num-bucket" value="${baskList.b_quan }"/>
                            <input type="number" class="input-num" id="num"  name="inputnum" value="${baskList.b_quan }"  min="0">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="S_list" id="Sale_price">
                <table class="buy_total">
                    <tr  >
                    <td class="Sale_price_tr1" style="text-align: right;" colspan="2">
                    	${ formatter.format(baskList.d_price )} 원
                    	</td>
                    </tr>
                    <tr>
                           <td><p class="Sale_price_tr2" >합계</p></td>
                          
                           <td ><p class="Sale_price_tr3">${ formatter.format( baskList.d_price* baskList.b_quan + 2500 ) } 원 </p></td>
                    </tr>
                </table>
            </div>
        </div>
        <hr style="border: solid 1px;">
        </c:forEach>      
        <!--리워드 사용  -->
         <div class="MD_order_text">
                   <table>
                 	 <tr>
                 	 	<td  id="table3_td1" rowspan="4"> 전체 합계 </td>
                 	 	<td class="table3_td2"> 상품수 </td>
                 	 	<td class="table3_td3"   id="totalNum"> 0개</td>
                 	 	</tr>
                 	 <tr>
                 	 	 <td class="table3_td2">상품 금액</td>
                 	 	 <td class="table3_td3" id="totalPrice">0원 </td>
                 	 </tr>
                 	 <tr>
                        <td class="table3_td2">내 리워드  </td>
                        <td class="table3_td3">
                          ${getReward}점
                        </td>
                    </tr>
                   <tr>
                   <td class="table3_td2">리워드 사용</td>
                   <td class="table3_td3"> 
                   <input type="number" id="reward" value="0"  step="10" min="0" max="${getReward}">원
                  	<button type="submit" id="rewardbtn">사용</button>
                   </td>
                   </tr>
                    </table>
          </div>
        <!-- 총 가격 -->
        <div id="Sale_AllPrice">
            총 상품 합계 0원
        </div>

        <!--배송주소 입력창-->
        <div class="Sale_deliver">
            <form action="">
            <table >
            <tr>
            	
            <td colspan="2" class="loadArea">
            <input type="checkbox"  id="info_load"/> <label for="info_load" id ="info_load">내 정보 불러오기</label>
            </td>
            </tr>
                <tr>
                    <td class="Sale_deliver_td1" >수령인</td>
                    <td><input type="text" class="Sale_deliver_text"  id="o_name" placeholder="수령인" ></td>
                </tr>
                <tr>
                    <td class="Sale_deliver_td1" >전화번호</td>
                    <td><input type="text" class="Sale_deliver_text"  id="o_phone" placeholder="010-0000-0000"></td>
                </tr>
                <tr>
                    <td class="Sale_deliver_td1" rowspan="3">배송지주소</td>
                    <td>
                        <input type="text" class="Sale_deliver_text1"  onclick="execDaumPostcode()"   id="postcode" placeholder="우편번호">
                        <input type="button"  class="Sale_addres" onclick="execDaumPostcode()" value="우편번호찾기">
                    </td>
                </tr>
                <tr>
                    <td><input type="text" class="Sale_deliver_text" id="address" placeholder="주소" onclick="execDaumPostcode()" ></td>
                </tr>
                <tr>
                    <td><input type="text" class="Sale_deliver_text"  id="detailAddress" placeholder="상세주소" onclick="execDaumPostcode()" ></td>
                </tr>
                <tr>
                    <td class="Sale_deliver_td1" >배송 메모</td>
                    <td><input type="text" class="Sale_deliver_text"  id="memo" placeholder="메모를 남겨주세요"></td>
                </tr>
            </table>
        </form>
        </div>

        <!-- 구매하기 버튼 -->
        <div class="Sale_buybox">
            <input type="button" class="Sale_buybtn"  id="orderMd" value="구매하기">
        </div>
       
        <br><br><br><br><br>
       <script>
       var totalnum = 0; 
       var totalprice2 = 0;
       
       //삭제하기 버튼
       $('.del').on('click',function(){
    	   var m_no = ${member.m_no};
    	   var d_no = $(this).siblings('.checkli').val();

    		  var com = confirm("삭제하시겠습니까?")
    		  
    		  if(com==true){
    			 
    			  $.ajax({
    	 			  url:"${pageContext.request.contextPath}/MD/MD_buy6.do",
    	 			  type:"post",
    	 			  data:{ m_no : m_no, d_no : d_no },
    	 			  success:function(){
    	 				  alert("삭제되었습니다.");
    	 				  
    	 				  location.href = "${pageContext.request.contextPath}/MD/MD_buy2?mno="+m_no
    	 			  },  error:function(){
    	 				  alert("에러");
    	 			  }
    	 		  }); 

    			  
    		  }else if(com==false){
    			
    			
    		  }
    	   
    
    	   
       });
       
       // 내정보 불러오기 버튼
       $('#info_load').on('change',function(){
    	  var name = '${member.m_name}';
    	  var phone ='${member.m_phone}';
    	  var address = '${member.m_address}'
    	  var splitadd = address.split('/');
    	  var nameplace = $('#o_name');
    	  var phoneplace = $('#o_phone'); 
    	  var addresspl1 =$('#postcode');
    	  var addresspl2 = $('#address');
    	  var addresspl3 = $('#detailAddress');
    	  
    	   if($(this).prop('checked')){
    		   nameplace.val(name);
    		   phoneplace.val(phone);
    		   addresspl1.val(splitadd[0]);
    		   addresspl2.val(splitadd[1]);
    		   addresspl3.val(splitadd[2]);
    	   }else{
    		   nameplace.val(null);
    		   phoneplace.val(null);
    		   addresspl1.val(null);
    		   addresspl2.val(null);
    		   addresspl3.val(null);
    	   }
    	   
       });
       
       
      /* 전체 수량, 가격 변경함수 */
       function calcPrice( elem ){
     	  var $this = $(elem);
    	   var sumnum = parseInt($(elem).parent().siblings('.S_list:nth-child(3)').find('.input-num').val());
    	   if(sumnum == 0) { 
    		   var sumprice = 0;
    	   } else{
    		   var sumprice = parseInt($this.parent().siblings('.S_list:nth-child(3)').find('td[id]').attr('id') * sumnum +2500);
    	   }
			
    	   var totalnumplace = $('#totalNum');
 	       var totalpriceplace = $('#totalPrice');
 	       var ssp =  sumprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 	       var sssa = $this.parent().siblings('.S_list:nth-child(4)').find('.Sale_price_tr3');
 	       var mno = ${member.m_no};
 	       var dno = $this.val();
 	       console.log(sssa);
 	       sssa.html(ssp +" 원 "); 
 	       
    	   if($(elem).prop('checked')){
 			  /* 전체수량  */
    		  totalnum += sumnum;

    		  totalnumplace.html(totalnum + ' 개');
 			
    		 /* 전체 가격  */
    		  totalprice2 += sumprice;
   
 			  var reprice = totalprice2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    		 
 			  totalpriceplace.html(reprice + ' 원');
 			  
 			  // md b_status 바꾸기
    	 	  $.ajax({
    			  url:"${pageContext.request.contextPath}/MD/MD_buy4.do",
    			  type:"post",
    			  data:{ mno : mno, dno : dno, b_status : 1 },
    			  success:function(){
    			  },  error:function(){
    				  alert("에러");
    			  }
    		  });
    		  
    	   } else{
    		   /* 전체수량  */
    		   totalnum -= sumnum;
    		   
    		   totalnumplace.html(totalnum +" 개");
    		   
    		   // md b_status 바꾸기
    		 	  $.ajax({
        			  url:"${pageContext.request.contextPath}/MD/MD_buy4.do",
        			  type:"post",
        			  data:{ mno : mno, dno : dno, b_status : 2 },
        			  success:function(){
        			  },  error:function(){
        				  alert("에러");
        			  }
        		  });
    		   
      		 /* 전체 가격  */
     		  totalprice2 -= sumprice;
     		  var reprice = totalprice2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
     		 totalpriceplace.html(reprice + ' 원');
    	   }
		
    	   // 파이널 상품 합계 
	   		 var reallprice = totalprice2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	    	 var allpriceplace = $('#Sale_AllPrice');
	   	    allpriceplace.html( "총 상품 합계   " + reallprice + "원");
	   	    
       }
       
       
       /*  checked로 시작 */
       $(function(){
      	 $('input:checkbox[name=list]').each(function(){
      		 $(this).prop('checked', true);
      		calcPrice(this);
      		

   
      	 }); 		
       });
       
      
         /* 장바구니 선택하기 */
       $('input:checkbox[name=list]').on('change', function(){
    	  
    	   calcPrice(this);
    	   
    	
    	   
       });
   
     
         /* 수량변화에 따른 합계금액변화  */

       $('.input-num').on('change',function(){
    	   	console.log(event)
    		  var $this = $(this);
    		  var price = $this.parent().attr('id');
    		  var bucket = parseInt($this.siblings('.num-bucket').val());
    		  var originprice = bucket  *price +2500 ;

    		  var num = parseInt($this.val());
    		  /* 수량이 0 일때 전체가격  */
    		  if(num == 0) {
    			  var totalprice = 0;
    		  } else {
    			  var totalprice = $this.val()*price + 2500 ;
    		  } ;
    		  
			  var mno = ${member.m_no};
			  var dno = $this.parent().parent().attr('id');
			  /*3자리마다 컴마 표시  */
    		  var reprice = totalprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			  var sss = $this.parent().parent().parent().parent().parent().siblings('.S_list:nth-child(4)').find('.Sale_price_tr3');
			  var totalnumplace = $('#totalNum');
			  var totalpriceplace = $('#totalPrice');
			  var checkbox = $this.parent().parent().parent().parent().parent().siblings('.S_list:nth-child(1)').find('[name=list]');
    		  var replacenum =  num -bucket ;
			  var replaceprice = totalprice - originprice  ;
			
			  console.log(replaceprice);
			
			  
    	 	  $.ajax({
    			  url:"${pageContext.request.contextPath}/MD/MD_buy3.do",
    			  type:"post",
    			  data:{ mno : mno, dno : dno, num : num},
    			  success:function(){
    				  sss.html(reprice + " 원")
    				  
    				  if(checkbox.prop('checked')){
							
    					  totalnumplace.html((parseInt(totalnumplace.html()) + replacenum) +"개");
							
							totalprice2 += replaceprice;
							
							var finalprice = totalprice2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
								
							totalpriceplace.html( finalprice + "원");
							
							$this.siblings('.num-bucket').val(num);
							totalnum += replacenum;
							
				     		 var reallprice = totalprice2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					    	 var allpriceplace = $('#Sale_AllPrice');
					   	    allpriceplace.html( "총 상품 합계   " + reallprice + "원");
    				  };
    			  }
    		  });
       });
   
		       
		   	 /* 리워드 max 값 제한, 리워드 사용 값 반영 */
		     $('#reward').on('input', function() {
		  	    var $this = $(this);
		  	    	var max = ${getReward};
		  	    var str = parseInt(max/10)*10
		  	    var value = $this.val();
		  	    var totalprice = $('#num').val()*${md.d_price} + 2500 -$this.val();
		  	/*     alert(str); */

		  	    if (value >= max ) {
		  	        $this.val(str);
		  	    }

		  		  /*3자리마다 컴마 표시  */
		  		  var reprice = totalprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

		  	});
		   	 
		    /* 리워드 10원 단위로 사용 */
		     $('#reward').on('change', function() {
		  	    var $this = $(this);
		  	    var value = $this.val();
		  	    value = parseInt(value/10)*10;
		  	    $this.val(value); 
		  	}); 
			
		    
		    // 리워드 사용 버튼 
		    $('#rewardbtn').on('click',function(){
		    	var allpriceplace = $('#Sale_AllPrice');
		    	var userward = $('#reward').val();
		    	 var word = $(this).html();
	
		    	
		    	if( word == '취소'){
		    		$(this).html('사용')
		    		
		    		var allprice = totalprice2 + parseInt(userward);
					var reallprice = allprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					
					$('#reward').attr('disabled',false);
			    	allpriceplace.html( "총 상품 합계   " + reallprice + "원"); 	
			    	totalprice2 = allprice;
			    	
		    	}else if( word == '사용'){
		    		$(this).html('취소');
		    		
			    	var allprice = totalprice2 - userward;
			        var reallprice = allprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			       
			        $('#reward').attr('disabled',true);
			    	allpriceplace.html( "총 상품 합계   " + reallprice + "원"); 	
			    	totalprice2 = allprice;
		    	}
		    
				
		    });
		    
	
		  
		    
		    
		    $('#orderMd').on('click', function(){
		    	var m_no = ${member.m_no}; // 회원번호
		    	var w_down= $('#reward').val();	
		    	var m_name = '${member.m_name}';
		    	var m_phone = '${member.m_phone}';
		    	var m_email ='${member.m_email}';
		    	var price = totalprice2;
		    	var o_name = $('#o_name').val();
		    	var o_phone = $('#o_phone').val();
		    	var o_address = $('#postcode').val() +'/' +$('#address').val() +'/'+$('#detailAddress').val();
		    	var memo = $('#memo').val();
		    	
		    	// 결제 api
		          var IMP = window.IMP; 
			       IMP.init('imp58545522'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		        
			       IMP.request_pay({
			    	    pg : 'inicis', // version 1.1.0부터 지원.
			    	    pay_method : 'card',
			    	    merchant_uid : 'merchant_' + new Date().getTime(),
			    	    name : 'MD 상품',
			    	    amount :100,
			    	    buyer_name : m_name,
			    	    buyer_tel : m_phone,
			    	    buyer_email : m_email,
			    	}, function(rsp) {
			    	    if ( rsp.success ) {
			    	        var msg = '결제가 완료되었습니다.';
			    	        
					      	// 리워드 사용 등록, 구매목록 저장
						 	  $.ajax({
			        			  url:"${pageContext.request.contextPath}/MD/MD_buy5.do",
			        			  type:"post",
			        			  data:{ m_no : m_no,  w_down : w_down,
			        				  		o_name : o_name, o_phone : o_phone, o_address : o_address,
			        				  		o_memo : memo},
			        			  success:function(){
			        			  },  error:function(){
			        				
			        			  }
			        		  });
					  
						 	 location.href = "${pageContext.request.contextPath}/buy/buylist.do"
			    	        
			    	    } else {
			    	        var msg = '결제에 실패하였습니다.';
			    	        msg += '에러내용 : ' + rsp.error_msg;
			    	        
			    	
			    	    }
			    	    alert(msg);
			    	});
		        


		    	
		    	
		    
		    	
		    

		    	 });
		    	
		    	/*   $.ajax({
	    			  url:"${pageContext.request.contextPath}/MD/MD_buy3.do",
	    			  type:"post",
	    			  data:{ mno : mno, dno : dno, num : num},
	    			  success:function(){
	    				  sss.html(reprice + " 원")
	    				  
	    				  if(checkbox.prop('checked')){
								
	    					  totalnumplace.html((parseInt(totalnumplace.html()) + replacenum) +"개");
								
								totalprice2 += replaceprice;
								
								var finalprice = totalprice2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
									
								totalpriceplace.html( finalprice + "원");
								
								$this.siblings('.num-bucket').val(num);
								totalnum += replacenum;
								
					     		 var reallprice = totalprice2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						    	 var allpriceplace = $('#Sale_AllPrice');
						   	    allpriceplace.html( "총 상품 합계   " + reallprice + "원");
	    				  };
	    			  },
	    			  error:function(){}
	    		  }); */
		    	
		
		    
		    


       </script>

       
       
       <!-- 주소찾기 api  -->
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		function execDaumPostcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {

	                var addr = ''; 
	                var extraAddr = ''; 

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detailAddress").focus();
		        }
		    }).open();
		}
		</script>        
    </section>
        	<%@ include file="common/footer.jsp"%>
</body>
</html>     