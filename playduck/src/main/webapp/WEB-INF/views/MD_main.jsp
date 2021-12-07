<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
	<link rel="stylesheet" href="../resources/css/common.css">
	<link rel="stylesheet" href="../resources/css/headerfooter.css">
	<link rel="stylesheet" href="../resources/css/join.css">
	<link rel="stylesheet" href="../resources/css/login.css">
	<link rel="stylesheet" href="../resources/css/findIdPw.css">
    <link rel="stylesheet" href="../resources/css/MD.css">
    <link rel="stylesheet" href="../resources/css/pagination.css">
    <script src="../resources/js/jquery-3.6.0.min.js"></script>
    <script src="../resources/js/MD.js"></script>
    <script src="../resources/js/modal.js"></script>
    <script src="../resources/js/topBtn.js"></script>
    <title>playduck - MD 메인 페이지</title>
</head>
<style>

.md_searchArea {
	margin-top : 60px;
}
.md_searchBtn {
	cursor:pointer;
	border-radius: .2em;
	width : 100px;
		width : 100px;
	height : 30px;
}
.cu_searchInput {

	height : 28px;
	width : 170px;
}
</style>

<body>
	<%@ include file="common/header.jsp"%>
    <section>
    <div class="md_searchArea">
    	<form action="${pageContext.request.contextPath}/md/search_md.do" name="form1" method="post">
	    
		    <input class="cu_searchInput" type="text" name="keyword" value="${keyword}"/>
		    <input type="submit" class="md_searchBtn" value="상품검색"/>
	    
    	</form>
    </div>
    
    
    
    
    
       <br /><br />
       <p style="color:var(--white-color)">총 ${totalContents}건의 상품이 있습니다.</p>
        <div class="MD_play_playcontainer">
        <c:forEach items="${list}" var="md">
            <div class="MD_play_item" id="${md.d_no}">
                <div class="MD_play_mdimage"><img src="${md.d_pic}" alt="MD대표이미지" onclick="goDetail(${md.d_no});"></div>
                <div class="MD_play_mdtitle" name="d_title">${md.d_title}</div>
                <div class="MD_play_mdprice" name="d_price">${md.d_price}원</div>
            </div>
        </c:forEach>
        
        </div>
        <div class="pageBar"><c:out value="${pageBar}" escapeXml="false"/></div>
    </section>
    <br /><br /><br /><br /><br />
	<%@ include file="common/footer.jsp"%>
</body>
<script>

 function goDetail(d_no) {
		location.href = "${pageContext.request.contextPath}/MD/MD_order?d_no="+d_no
	}
</script>
</html>