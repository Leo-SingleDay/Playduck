<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <title>playduck - MD 구매 페이지</title>
    	<link rel="stylesheet" href="../resources/css/common.css">
	<link rel="stylesheet" href="../resources/css/headerfooter.css">
	<link rel="stylesheet" href="../resources/css/join.css">
	<link rel="stylesheet" href="../resources/css/login.css">
	<link rel="stylesheet" href="../resources/css/findIdPw.css">
    <link rel="stylesheet" href="../resources/css/MD.css">
    <script src="../resources/js/jquery-3.6.0.min.js"></script>

    <script src="../resources/js/modal.js"></script>
    <script src="../resources/js/topBtn.js"></script>
</head>
<style>
	.goBackBtn{
		cursor : pointer;
		color: var(--main-color);
	font-size: 17px;
	font-weight: 400;
	text-align: center;
	margin-top: 30px;
	display: block;
	}
	

</style>
<body>
    <%@ include file="common/header.jsp"%>
    <div class="btnArea">
    <form action="">
        <section>
            <div class="MD_order_container">
                <div class="MD_order_mainpic"><img src="${md.d_pic }" alt=""></div>
                <table class="MD_order_maintbl">
                    <tr class="MD_order_title">
                        <td>${md.d_title }</td>
                        <td id="mdprice">${md.d_price }원</td>
                    </tr>
                    <tr class="MD_order_text">
                        <td>배송비</td>
                        <td>2,500원</td>
                    </tr>
                    <tr class="MD_order_text">
                        <td>수량</td>
                        <td>
                            <input type="number" id="num" value="0"  min="0">
                        </td>
                    </tr>
                    <tr class="MD_order_sum">
                    <td>합계</td>
                    <td id="sum1">0 원</td>
             
                    </tr>
                    <tr class="MD_order_btn MD_order_basketbtn">
                        <td colspan="2">              
                            <div id="goCart">          
                                <img src="../resources/images/md_basket.png">
                                <p>장바구니</p>
                            </div>
                        </td>
                    </tr>
                    <tr class="MD_order_btn MD_order_orderbtn">
                        <td colspan="2">
                        <div id="gobuy">
                                <img src="../resources/images/md_card.png">
                                <p>결제하기</p>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="MD_order_imgarea">
                <img src="${md.d_detail}" alt="">
            </div>
    <a class="goBackBtn" href="${pageContext.request.contextPath}/md/md_main.do">목록으로 가기</a>
            
        </section>
    </form>
 
        </div>
    <br /><br /><br /><br /><br />
    
    
   <script>
   <c:if test="${ member == null}">

   $(function() {	

   	$(".fa-star").on("click",function () {	
   		
   		alert("로그인을 해주세요!")
   		$('.modal_loginBtn').click();
   						
    	 })
   });	
   </c:if> 

  
  /* 수량변화에 따른 합계금액변화  */
   $('#num').on('input',function(){
		  var $this = $(this);
		  var totalprice = $this.val()*${md.d_price} + 2500 ;
		  var sum1 = document.getElementById('sum1');
		
		  /*3자리마다 컴마 표시  */
		  var reprice = totalprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		  
		  sum1.innerHTML = reprice+"원";
	  });
  
  
  /*3자리마다 컴마 표시  */
   $(function(){
	   
	   
	  var mdp = ${md.d_price};
	  var mdptd = document.getElementById('mdprice');

	  var reprice = mdp.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	  
	 mdptd.innerHTML = reprice+"원"
	
   
   }); 

  /* 장바구니로 담기 */
  $('#goCart').on('click',function(){
	  var dno = ${md.d_no};
	  var num = $('#num').val();
	  var sum1 = num*${md.d_price} + 2500;
	 
	/*   console.log(mno);
	  console.log(dno);
	  console.log(num);
	  console.log(reward);
	  console.log(sum1);
	   */
	   <c:if test="${ member != null}">
		  if(num != 0){ 
		   
			  
		   alert('장바구니에 상품이 담겼습니다.')
		  var com = confirm("장바구니로 이동하시겠습니까?")
		  
			  if(com==true){
					location.href = "${pageContext.request.contextPath}/MD/MD_buy.do?d_no="+dno+"&num="+num+"&sum="+sum1;
		
				  
			  }else if(com==false){
				
				  location.href = "${pageContext.request.contextPath}/MD/MD_buyre.do?d_no="+dno+"&num="+num+"&sum="+sum1;
			  }
		  } else if( num == 0) {
			  alert('상품 수량이 0 입니다.')
		  };
		  </c:if> <c:if test="${ member == null}">
		  alert('로그인 해주세요')
		  </c:if>
		 
  });
  	
		  //구매하기 버튼
		 $('#gobuy').on('click',function(){
			  var dno = ${md.d_no};
			  var num = $('#num').val();
			  var sum1 = num*${md.d_price} + 2500;
			  
			  
	 <c:if test="${ member != null}"> 
		  if(num != 0){ 	  
			 	 var com = confirm("구매하시겠습니까?")
				  if(com == true){
					  location.href = "${pageContext.request.contextPath}/MD/MD_buy.do?d_no="+dno+"&num="+num+"&sum="+sum1;
				  }else if (com == false){
					  
				  }
		  } else if( num == 0) {
			  alert('상품 수량이 0 입니다.')
		  };
		  </c:if> <c:if test="${ member == null}">
		  alert('로그인 해주세요')
		  </c:if>
			
		 });
 
  
   </script>
   <%@ include file="common/footer.jsp"%>
</body>
</html>