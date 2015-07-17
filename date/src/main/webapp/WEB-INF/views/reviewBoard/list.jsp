<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${root}/css/reviewBoard/style.css" />
<script type="text/javascript" src="${root}/css/reviewBoard/replyWrite.js"></script>
<script type="text/javascript" src="${root}/css/reviewBoard/replyDelete.js"></script>
<script type="text/javascript" src="${root}/css/reviewBoard/replyUpdate.js"></script>
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
	<jsp:include page="/youAndITop.jsp"/><br/>
	<div class="col-lg-12">
	<div style="width:1200px; height:1200px; margin-left:auto; margin-right:auto;" >
		<div id="picture">
			<img src="${root}${placeBoard.place_photo}" width="300" height="250"/>
			<div id="starDiv">
				<c:if test="${placeBoard.place_star==0}"><img src="${root}/resources/star/00.png" width="120" height="25" style="margin:0px 0px 0px 52px;"/></c:if>	
				<c:if test="${placeBoard.place_star>0 && placeBoard.place_star<=0.5}"><img src="${root}/resources/star/05.png" width="120" height="25"/></c:if>
				<c:if test="${placeBoard.place_star>0.5 && placeBoard.place_star<=1}"><img src="${root}/resources/star/10.png" width="120" height="25"/></c:if>
				<c:if test="${placeBoard.place_star>1 && placeBoard.place_star<=1.5}"><img src="${root}/resources/star/15.png" width="120" height="25"/></c:if>
				<c:if test="${placeBoard.place_star>1.5 && placeBoard.place_star<=2}"><img src="${root}/resources/star/20.png" width="120" height="25"/></c:if>
				<c:if test="${placeBoard.place_star>2 && placeBoard.place_star<=2.5}"><img src="${root}/resources/star/25.png" width="120" height="25"/></c:if>
				<c:if test="${placeBoard.place_star>2.5 && placeBoard.place_star<=3}"><img src="${root}/resources/star/30.png" width="120" height="25"/></c:if>
				<c:if test="${placeBoard.place_star>3 && placeBoard.place_star<=3.5}"><img src="${root}/resources/star/35.png" width="120" height="25"/></c:if>
				<c:if test="${placeBoard.place_star>3.5 && placeBoard.place_star<=4}"><img src="${root}/resources/star/40.png" width="120" height="25"/></c:if>
				<c:if test="${placeBoard.place_star>4 && placeBoard.place_star<=4.5}"><img src="${root}/resources/star/45.png" width="120" height="25"/></c:if>
				<c:if test="${placeBoard.place_star>4.5 && placeBoard.place_star<=5}"><img src="${root}/resources/star/50.png" width="120" height="25"/></c:if><br/>
				${placeBoard.place_star}점
			</div>
		</div>
		
		<div id="content">
			<b style="font-size:20px;">${placeBoard.place_name}</b><br/>
			<ul>
				<li>
					<b>주 &nbsp; 소</b>
					<span>${placeBoard.place_location}</span>
				</li>
				
				<li>
					<b>전화번호</b>
					<span>${placeBoard.place_phone}</span>
				</li>
				
				<li>
					<b>운영시간</b>
					<span>${placeBoard.place_time}</span>
				</li>
				
				<li>
					<b>예산(2인)</b>
					<span>${placeBoard.place_price}원</span>
				</li>
			</ul>
			
			<p>${placeBoard.place_content}</p>
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
	</div>	
</body>
</html>