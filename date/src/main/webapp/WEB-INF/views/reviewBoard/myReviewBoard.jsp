<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${root}/css/reviewBoard/style.css" />
<script type="text/javascript" src="${root}/css/reviewBoard/replyWrite.js"></script>
<script type="text/javascript" src="${root}/css/reviewBoard/replyDelete.js"></script>
<script type="text/javascript" src="${root}/css/reviewBoard/replyUpdate.js"></script>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<script type="text/javascript">
	var commentCount =("${reviewList.size()}");
	//alert(commentCount);
	
	$(document).ready(function () {
		if (commentCount > 5) {
			$("#moreComment").show();
			for (i=6;i<=commentCount; i++){$(".commentList>.replyDiv:nth-child("+i+")").hide()};
		};
	});
	
	var moreCount=0
	
	function moreComment(){
		moreCount++;
		for (i=1;i<=5; i++){$(".commentList>.replyDiv:nth-child("+(moreCount*5+i)+")").show()};
		if (((moreCount+1)*5) > commentCount){$("#moreComment").hide()};
	}
 
 
</script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/youAndITop.jsp"/><br/>
	
	${myReviwBoard}
	<c:forEach var="reviewBoard" items="${myReviwBoard}">
	${reviewBoard.review_code}
	${reviewBoard.review_content}
	${reviewBoard.review_id }
	${reviewBoard.review_date}
	
	</c:forEach>
</body>
</html>