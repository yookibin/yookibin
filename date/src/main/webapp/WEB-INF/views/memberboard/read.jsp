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
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 읽기</title>
	<link rel="stylesheet" type="text/css" href="${root }/css/board/style.css">
</head>
<body>
	<table border="1" width="510" cellpadding="2"  cellspacing="0" align="center">
		<tr>
			<td align="center"  height="20" width="125">글제목</td>
			<td align="center"  height="20" width="125" >${memberBoard.board_title }</td>
			
			<td align="center"  height="20" width="125">조회수</td>
			<td align="center"  height="20" width="125" >${memberBoard.board_count }</td>
		</tr>
		
		<tr>
			<td align="center"  height="20" width="125">작성자</td>
			<td align="center"  height="20" width="125" >${memberBoard.board_writer }</td>
			
			<td align="center"  height="20" width="125">작성일</td>
			<td align="center"  height="20" width="125"><fmt:formatDate value="${memberBoard.board_date }" type="date"/></td>
		</tr>
		
		<tr>
			<td align="center"  height="200" width="125">글내용</td>
			<td valign="top"  height="200" colspan="3">${memberBoard.board_content }</td>
		</tr>
		
		
		<tr>
			<td height="30" colspan="4" align="center">
			<c:if test="${memberBoard.board_writer==nickName}">
				<input type="button" value="글수정" onclick="updateFun('${root}','${memberBoard.board_num }', '${pageNumber}')" />
				<input type="button" value="글삭제" onclick="deleteFun('${root}','${memberBoard.board_num }', '${pageNumber}')"/>
			</c:if>
				<input type="button" value="글목록" onclick="location.href='${root}/memberboard/list.do?pageNumber=${pageNumber}'"/>
			</td>
		</tr>
	</table>
</body>
</html>