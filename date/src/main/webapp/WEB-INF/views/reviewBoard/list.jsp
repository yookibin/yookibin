<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet"
	href="${root}/css/reviewBoard/style.css" />
<script type="text/javascript"
	src="${root}/css/reviewBoard/replyWrite.js"></script>
<script type="text/javascript"
	src="${root}/css/reviewBoard/replyDelete.js"></script>
<script type="text/javascript"
	src="${root}/css/reviewBoard/replyUpdate.js"></script>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<title>Insert title here</title>
<script>
	var commentCount =("${reviewList.size()}");
//	alert(commentCount);
	
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
</head>
<body>
	<div style="width:1200px; height:1200px; margin-left:auto; margin-right:auto;">
		<div id="head" style="width: 500px; height: 450px; border: 1px solid red; float: left; margin-right: 20px;">
			<center>
				<img src="${root}${placeBoard.place_photo}" width=500 height="450" />
			</center>
		</div>
		<div style="width: 500px; height: 450px; border: 1px solid orange; float: left; border-radius: 30px 30px 30px 30px;">
			<br />
			<h3>${placeBoard.place_name}</h3>
			<br /> 주소 ${placeBoard.place_location}<br /> <br /> 전화번호
			${placeBoard.place_phone}<br /> <br /> 운영시간 ${placeBoard.place_time}<br />
			<br /> 예산(2인) ${placeBoard.place_price}원<br /> <br />
			${placeBoard.place_content}<br /> <br />
		</div>
		
		<div style="width: 400px; height: 500px;">
		
		</div>
		
		<div class="commentList">
			<c:forEach var="reviewList" items="${reviewList}">
				<div class="replyDiv" id="${reviewList.review_code}">
					<div class="cssId">${reviewList.review_id}</div>
					<div class="cssStar">${reviewList.review_star/10}점</div>
					<div class="cssContent">${reviewList.review_content}</div>
					<div class="cssDate">
						<fmt:formatDate value="${reviewList.review_date}"/>
					</div>
					<c:if test="${nickName==reviewList.review_id}">
						<div class="cssUpDel">
							<a href="javascript:modifyReply('${reviewList.review_code}','${root}')">수정</a>
							<a href="javascript:deleteToServer('${reviewList.review_code}','${root}')">삭제</a>
						</div> 
					</c:if>
					<div class="replyDiv" id="${reviewList.review_code}_content" style="display: none;">
						<textarea rows="1" cols="80" style="margin: 0px 0px 0px 40px;">${reviewList.review_content}</textarea>
						<input type="button" value="수정하기" onclick="updateToServer('${root}','${reviewList.review_code}')" />
					</div>
				</div>			
			</c:forEach>
		</div>
		
		<button id="moreComment" onclick="moreComment()" style="display:none">댓글 더 보기 </button>
	
		<div class="replyDiv">
			<c:if test="${nickName!=null}">
				<div style="float: left">
					평점 <select id="starReply">
						<option>선택</option>
						<option value="10">1</option>
						<option value="20">2</option>
						<option value="30">3</option>
						<option value="40">4</option>
						<option value="50">5</option>
					</select> <input id="writeReply" type="text" name="write" size="45" /> <input
						type="button" value="평가하기"
						onclick="writeToServer('${root}','${placeBoard.place_code}','${nickName}')" />
				</div>
			</c:if>
	
			<c:if test="${nickName==null}">
				<div style="float: left"> 평점 
					<select disabled="disabled">
						<option>선택</option>
					</select> 
					<input type="text" value="로그인 후 댓글작성이 가능합니다" name="write" size="45" disabled="disabled" /> <input type="button" value="평가하기" />
				</div>
			</c:if>
		</div>
	</div>	
</body>
</html>