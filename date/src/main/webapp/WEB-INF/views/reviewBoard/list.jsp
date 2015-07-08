<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${root}/css/reviewBoard/style.css" />
<script type="text/javascript" src="${root}/css/reviewBoard/replyWrite.js"></script>
<script type="text/javascript" src="${root}/css/reviewBoard/replyDelete.js"></script>
<script type="text/javascript" src="${root}/css/reviewBoard/replyUpdate.js"></script>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="head" style="width: 400px; height: 400px; border: 1px solid red; float: left; margin-right: 20px;">
		<center>
			<img src="${root}${placeBoard.place_photo}">
		</center>
	</div>
	<div style="width: 400px; height: 400px; border: 1px solid orange; float: left; border-radius: 30px 30px 30px 30px;"><br/>
		<h3>${placeBoard.place_name}</h3><br/> 
		주소 ${placeBoard.place_location}<br/><br/>
		전화번호 ${placeBoard.place_phone}<br/><br/> 
		운영시간 ${placeBoard.place_time}<br/><br/> 
		예산(2인) ${placeBoard.place_price}원<br/><br/>
		${placeBoard.place_content}<br/><br/>
	</div>

	<div id="foot">
		<c:forEach var="review" items="${reviewList}">
			<div class="replyDiv" id="${review.review_code}">
				<div class="cssCode">${review.review_code}</div>
				<div class="cssId">${review.review_id}</div>
				<div class="cssStar">${review.review_star/10}점</div>
				<textarea rows="30" cols="100" class="cssContent">${review.review_content}</textarea>
				<textarea rows="30" cols="100" class="cssContent" style="display:none;">${review.review_content}</textarea>
				<input type="button" value="평가하기" style="display:none;" onclick="writeToServer('${root}','${placeBoard.place_code}','${nickName}')" />
				<div class="cssDate">${review.review_date}</div>
				<div class="cssUpDel">
					<a href="javascript:upSelectToServer('${review.review_code}','${root}')">수정</a>
					<a href="javascript:deleteToServer('${review.review_code}','${root}')">삭제</a>
				</div>
			</div>
		</c:forEach>
		
	</div>
	<div>
		<c:if test="${nickName!=null}">
			<div>평점
				<select id="starReply">
					<option>선택</option>
					<option value="10">1</option>
					<option value="20">2</option>
					<option value="30">3</option>
					<option value="40">4</option>
					<option value="50">5</option>
				</select>
				<input id="writeReply" type="text" name="write" size="45" /> 
				<input type="button" value="평가하기" onclick="writeToServer('${root}','${placeBoard.place_code}','${nickName}')" />
			</div>
		</c:if>

		<c:if test="${nickName==null}">
			<div>평점 
				<select disabled="disabled">
					<option>선택</option>
				</select>
				<input type="text" value="로그인 후 댓글작성이 가능합니다" name="write" size="45" disabled="disabled" /> 
				<input type="button" value="평가하기" />
			</div>
		</c:if>
	</div>
</body>
</html>