<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<style type="text/css">
#Box{position:relative;width:300px; height:300px;}
#head {float:left; width:300px; height:50px;}
#body {clear:left; float:left; width:300px;}
#foot {position:absolute; clear:left; float:left;left:0; bottom:-20px;}

</style>
<link type="text/css" rel="stylesheet" href="reply.css"/>
<script type="text/javascript" src="xhr.js"></script>
<script type="text/javascript" src="${root}/css/reviewBoard/replyWrite.js"></script>
<script type="text/javascript" src="${root}/css/reviewBoard/replyDelete.js"></script>
<script type="text/javascript" src="${root}/css/reviewBoard/replyUpdate.js"></script>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<title>Insert title here</title>
</head>
	<body>
	
	<div id="box">
	<div id="head"style="width:400px; height:400px; border:1px solid red; float:left; margin-right:20px;">
	<center><img src="${root}${placeBoard.place_photo}"></center>
	</div>
	<div  style="width:400px; height:400px; border:1px solid orange; float:left;border-radius: 30px 30px 30px 30px;">
	<br/>
	
	<h3>${placeBoard.place_name}</h3><br/>
	주소
	${placeBoard.place_location}<br/><br/>
	전화번호
	${placeBoard.place_phone}<br/><br/>
	운영시간
	${placeBoard.place_time}<br/><br/>
	예산(2인)
	${placeBoard.place_price}원<br/><br/>
	
	${placeBoard.place_content}<br/><br/>
	</div>
	
	<div id="foot"style="width:830px; height:410px; border:1px solid black; border-radius: 30px 30px 30px 30px;">
	   <div>평점
			<select id="starReply">
				<option>선택</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
				<option>4</option>
				<option>5</option>
			</select>
			<input id="writeReply" type="text" name="write" size="45"/>
			<input type="button" value="평가하기" onclick="writeToServer('${root}','${placeBoard.place_code}')"/>
		</div>
	   
   <div id="listAllDiv">
      <div class="replyDiv" style="display:none;">
         <span class="cssBunho"></span>
         <span class="cssReply"></span>
         <span class="cssUpDel">
            <a href=""></a>&nbsp;
            <a href=""></a>
         </span>   
      </div>

      <c:forEach var="reply" items="${replyList}">
         <div class="replyDiv" id="${reply.bunho}">
            <span class="cssBunho">${reply.bunho}</span>
            <span class="cssReply">${reply.line_reply}</span>
            <span class="cssUpDel">
               <a href="javascript:upSelectToServer('${reply.bunho}','${root}')">수정</a>
               <a href="javascript:deleteToServer('${reply.bunho}','${root}')">삭제</a>
            </span>
         </div>
      </c:forEach>
   </div>

</div>
</div>
</body>
</html>