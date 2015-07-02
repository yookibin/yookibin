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
</head>
<body>	
	<c:if test="${memberLevel=='AA' }">
		<a href="${root }/eventBoard/write.do">글쓰기(운영자만)</a>
	</c:if>
	
	
	<c:if test="${count==0 }">
		<center>게시판에 저장된 글이 없습니다.</center>
	</c:if>

	<c:if test="${count!=0 }">
			<span>번호</span>
			<span style="width: 150px">이미지</span>
			<span>제목</span>
			<span>기간</span>
			<span>작성자</span>
			<span>조회수</span>
			<span>진행상황</span>
			<span>차감포인트</span>
			<span>경품</span>
			<br/><br/>
			
			<!-- Board List -->
			<c:forEach var="eventBoard" items="${list }">
				
					${eventBoard.event_code }
					
					<c:if test="${eventBoard.event_fileSize!=0 }">
						<span>					
						<img src="${root}/resources/eventBoard/${eventBoard.event_filePath }" width="150" height="150"/>						
						${eventBoard.event_filePath }									
						</span>
					</c:if>
					
					<c:if test="${eventBoard.event_fileSize==0 }">
						<span style="width: 150px">
							이미지가 없네요
						</span>
					</c:if>
					
					<span>
						<a href="${root }/eventBoard/read.do?event_code=${eventBoard.event_code}&pageNumber=${currentPage}">${eventBoard.event_title }</a>				
					</span>
					<span>${eventBoard.event_period }</span>				
					<span>${eventBoard.writer }</span>
					<span>${eventBoard.read_count }</span>		
					<span>${eventBoard.event_progress }</span>		
					<span>${eventBoard.event_point }</span>
					<span>${eventBoard.event_giveaway }</span>	
				<br/>
			</c:forEach>
		
		<br/>
	</c:if>
		
	<!-- 페이지 번호 -->
	<center>
		<c:if test="${count>0 }">
			<c:set var="pageBlock" value="${2 }"/>
			
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