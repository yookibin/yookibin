<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 읽기</title>

<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript">
	
	function delFun(root, event_code, pageNumber){
		var url=root+"/eventBoard/delete.do?event_code="+event_code+"&pageNumber="+pageNumber;
		//alert(url);
		
		location.href=url;
	}
	
	function updateFun(root, event_code, pageNumber){
		var url=root+"/eventBoard/update.do?event_code="+event_code+"&pageNumber="+pageNumber;
		//alert(url);
		
		location.href=url;
	}

</script>
</head>

<body>
<!-- eventBoard와 pageNumber를 넘겨줌 -->
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	
	<table border="1" width="510" cellpadding="2"  cellspacing="0" align="center">
		<tr>
			<td align="center"  height="20" width="125">글번호:ㅇ</td>
			<td align="center"  height="20" width="125">${eventBoard.event_code }</td>
			
			<td align="center"  height="20" width="125">조회수:P</td>
			<td align="center"  height="20" width="125">${eventBoard.read_count }</td>
		</tr>
		
		<tr>
			<td align="center"  height="20" width="125">작성자</td>
			<td align="center"  height="20" width="125">${eventBoard.writer }</td>
			
			<td align="center"  height="20" width="125">이벤트 기간</td>
			<td align="center"  height="20" width="125">${eventBoard.event_period }</td>
		</tr>
		
		<tr>
			<td align="center"  height="20" width="125">차감포인트</td>
			<td align="center"  height="20" width="125">${eventBoard.event_point }</td>
			
			<td align="center"  height="20" width="125">경품</td>
			<td align="center"  height="20" width="125">${eventBoard.event_giveaway }</td>
		</tr>
		
		<tr>
			<td align="center"  height="20" width="125">제목</td>
			<td align="center"  height="20" width="125">${eventBoard.event_title }</td>
			<td align="center"  height="20" width="125">진행상황</td>
			<td align="center"  height="20" width="125">${eventBoard.event_progress }</td>
		</tr>
		
		<tr>
			<td align="center"  height="200" width="125">글내용</td>
			<td valign="top"  height="200" colspan="3" align="center">
				<c:if test="${eventBoard.event_fileSize!=0 }">												
					<img src="${root}/resources/eventBoard/${eventBoard.event_filePath }" width="200" height="200"/><br/>						
					${eventBoard.event_filePath }														
				</c:if>	<br/>			
				${eventBoard.event_content }
			</td>
		</tr>
<%-- 		
		<c:if test="${eventBoard.event_fileName !=null }">
			<tr>
				<td align="center"  height="20" width="125">파일명</td>
				<td colspan="3">
					<a href="${root }/fileBoard/downLoad.do?boardNumber=${eventBoard.event_code}">${eventBoard.event_fileName }</a>
				</td>
			</tr>		
		</c:if>
		 --%>
		<tr>
			<td height="30" colspan="4" align="center">
				<input type="button" value="글수정(운영자만 가능)" onclick="updateFun('${root}','${eventBoard.event_code }','${pageNumber }')" />
				<input type="button" value="글삭제(운영자만 가능)" onclick="delFun('${root}','${eventBoard.event_code }','${pageNumber }')"/>
				<input type="button" value="응모회원관리(운영자만 가능)" onclick="manageFun('${root}','${eventBoard.event_code }','${pageNumber }')"/><br/>
				
				<input type="button" value="참가하기" onclick="location.href='${root}/eventBoard/join.do?event_code=${eventBoard.event_code }&pageNumber=${pageNumber }'"/>
				<input type="button" value="글목록" onclick="location.href='${root}/eventBoard/list.do?pageNumber=${pageNumber }'"/>
			</td>
		</tr>
	</table>
</body>
</html>