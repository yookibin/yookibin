<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록보기</title>
<link rel="stylesheet" type="text/css" href="${root }/css/eventboard/style.css">
</head>



<body>	
	
	<table width="530" align="center">
		<tr>
			<td align="right" bgcolor="D1DBDB">
				<a href="${root }/eventBoard/wirte.do">글쓰기(운영자만)</a>
			</td>
		</tr>
	</table>
	
	<c:if test="${count==0 }">
		<table border="1" width="530" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
			</tr>
		</table>
	</c:if>

	<c:if test="${count!=0 }">
		<table border="1" width="530" cellpadding="2" cellspacing="0" align="center">
			<tr> 
				<td align="center" width="30">번호</td>
				<td align="center" width="150">이미지</td>
				<td align="center" width="130">제목</td>
				<td align="center" width="100">기간</td>
				<td align="center" width="70">작성자</td>
				<td align="center" width="50">조회수</td>
			</tr>
			
			<!-- Board List -->
			<c:forEach var="eventBoard" items="${list }">
				<tr>
					<td>${eventBoard.event_code }</td>
					<td>						
						<img src="${root}/resources/eventBoard/${eventBoard.event_filePath }" width="150" height="150"/>
						<%-- ${eventBoard.event_fileName } --%>
						<!-- ServiceImpl에서 filePath에서 timeName만 짤라서 이리로 보내 -->
						<!-- 그 다음에 ${root}/resources/eventBoard/${timeName} -->
						<%-- ${eventBoard.event_filePath } src="${eventBoard.event_filePath }" --%>
						<!-- /date/src/main/webapp/resources/eventBoard/1435141590720_Koala.jpg -->		
						${eventBoard.event_filePath }			
						
					</td>
					<td>
						<a href="${root }/eventBoard/read.do?event_code=${eventBoard.event_code}&pageNumber=${currentPage}">${eventBoard.event_title }</a>				
					</td>
					<td>${eventBoard.event_period }</td>				
					<td>${eventBoard.writer }</td>
					<td>${eventBoard.read_count }</td>					
				</tr>
			</c:forEach>
		</table>
		<br/>
	</c:if>
	
	<!-- 페이지 번호 -->
	<center>
		<c:if test="${count>0 }">
			<c:set var="pageBlock" value="${5 }"/>
			
			<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0?0:1) }"/>
			
			<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
			<c:set var="startPage" value="${rs*pageBlock+1 }"/>
			
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount }"/>
			</c:if>
			
			<!-- ----------------------------------------------------------- -->
			<c:if test="${startPage>pageBlock }">
				<a href="${root}/eventBoard/list.do?pageNumber=${startPage-pageBlock}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1" >
				<a href="${root}/eventBoard/list.do?pageNumber=${i}">[${i }]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<a href="${root}/eventBoard/list.do?pageNumber=${startPage+pageBlock}">[다음]</a>
			</c:if>
			
		</c:if>
	</center> 

</body>
</html>