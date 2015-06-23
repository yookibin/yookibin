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
	<link rel="stylesheet" type="text/css" href="${root }/css/board/style.css"/>
</head>
<body>
	
		<table width="530" align="center">
			<tr>
				<td align="right" bgcolor="D1DBDB"><a href="${root }/board/write.do">글쓰기</a></td>
			</tr>
		</table>
		
		<c:if test="${count==0 }">
			<table border="1" width="530" cellpadding="2" cellspacing="0" align="center">
				<tr>
					<td align="center">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
	</c:if>

	<c:if test="${count>0 }">
		<table border="1" width="530" cellpadding="2" cellspacing="0" align="center">
			<tr> 
				<td align="center" width="30">번호</td>
				<td align="center" width="250">제목</td>
				<td align="center" width="70">작성자</td>
				<td align="center" width="100">작성일</td>
				<td align="center" width="50">조회수</td>
			</tr>
			
			<!-- Board List -->
		<c:forEach var="memberBoard" items="${memberBoardList }">
			<tr>
				<td>${board.boardNumber }</td>
				<td>
					<c:if test="${board.sequenceLevel>0 }">
						<c:forEach begin="0" end="${board.sequenceLevel }" step="1">
							&nbsp;&nbsp;
						</c:forEach>
					</c:if>
					<a href="${root }/board/read.do?boardNumber=${board.boardNumber}&pageNumber=${currentPage }">${board.subject }</a>
				</td> 
				<td>${board.writer }</td>
				<td>
					<fmt:formatDate value="${board.writeDate }" type="date"/>
				</td>
				<td>${board.readCount }</td>
				<td>${board.ip }</td>
			</tr>
		</c:forEach>
		</table>
		<br/>
		
		<!-- 페이지 번호 -->
		<center>
			<c:if test="${count>0 }">
				<c:set var="pageBlock" value="${5}"/>
				<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1 )}"/>
				
				<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
				<c:set var="startPage" value="${rs*pageBlock+1 }"/>
				<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
				
				<c:if test="${endPage> pageCount }">
					<c:set var="endPage" value="${pageCount }"/>
				</c:if>
				
				<c:if test="${startPage>pageBlock }">
					<a href="${root }/board/list.do?pageNumber=${startPage-pageBlock}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href="${root }/board/list.do?pageNumber=${i}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${endPage<pageCount }">
					<a href="${root }/board/list.do?pageNumber=${startPage+pageBlock}">[다음]</a>
				</c:if>
			</c:if>
		</center>
	</c:if>
</body>
</html>