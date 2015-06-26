<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<script type="text/javascript">
	function replyFun(root, boardNumber, groupNumber, sequenceNumber, sequenceLevel, pageNumber){
		var url=root + "/board/write.do?boardNumber="+boardNumber;
		url+="&groupNumber="+groupNumber +"&sequenceNumber="+sequenceNumber+"&sequenceLevel="+sequenceLevel+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
	
	function deleteFun(root, boardNumber, pageNumber){
		var url=root + "/board/delete.do?boardNumber="+boardNumber+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
	
	function updateFun(root, boardNumber, pageNumber){
		var url=root + "/board/update.do?boardNumber="+boardNumber+"&pageNumber="+pageNumber;
		//alert(url);
		location.href=url;
	}
</script>
<script type="text/javascript" src="${root }/css/board/script.js"></script>
<script type="text/javascript" src="${root }/css/jquery.js"></script>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 읽기</title>
	<link rel="stylesheet" type="text/css" href="${root }/css/board/style.css">
</head>
<body>
	
			글제목
			${memberBoard.board_title }
			
			조회수
			${memberBoard.board_count }
		
			작성자
			${memberBoard.board_writer }
			
			작성일
			<fmt:formatDate value="${memberBoard.board_date }" type="date"/>
		
			<p>글내용</p>
			
				<img src="${root}/resources/board/${memberBoard.board_fileRoot}" width="200" height="200"/><br/>
				${memberBoard.board_content }
			
			<c:if test="${memberBoard.board_writer==nickName}">
				<input type="button" value="글수정" onclick="updateFun('${root}','${memberBoard.board_num }', '${pageNumber}')" />
				<input type="button" value="글삭제" onclick="deleteFun('${root}','${memberBoard.board_num }', '${pageNumber}')"/>
			</c:if>
				<input type="button" value="글목록" onclick="location.href='${root}/memberboard/list.do?pageNumber=${pageNumber}'"/>
			
	
			<div>
				<input type="text" name="reply" id="reply"/>
				<input type="button" value="댓글작성" onclick="writeReply('${root}','${memberBoard.board_num}')"/>
			</div>
			
	
</body>
</html>