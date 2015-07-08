<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root }/css/placeBoard/script.js"></script>
<script type="text/javascript" src="${root }/css/jquery.js"></script>
</head>
<body>
	<form action="${root }/placeBoard/placeBoardsearch.do" onsubmit="return placeListForm(this)">
		<input type="radio" name="place_location" value="강남">강남
		<input type="radio" name="place_location" value="목동">목동
		<input type="radio" name="place_location" value="사당">사당
		<input type="radio" name="place_location" value="삼성">삼성
		<input type="radio" name="place_location" value="서래마을">서래마을
		<input type="radio" name="place_location" value="신림">신림
		<input type="radio" name="place_location" value="신사">신사
		<input type="radio" name="place_location" value="신천">신천<br/>
		<input type="radio" name="place_location" value="압구정">압구정
		<input type="radio" name="place_location" value="여의도">여의도
		<input type="radio" name="place_location" value="영등포">영등포
		<input type="radio" name="place_location" value="잠실">잠실
		<input type="radio" name="place_location" value="천호">천호
		<input type="radio" name="place_location" value="상암">상암
		<input type="radio" name="place_location" value="기타">기타
		<input type="hidden" name="location">
		<input type="submit" value="검색">
	</form>
	
	<h3>검색결과</h3>
		<a href="">신규순</a> &nbsp; <a href="">인기순</a> <br/>
		
		<c:forEach var="placeBoard" items="${placeBoardList}" varStatus="status">
			<div style="float:left">
		 		<span id="${status.index}" onmouseover="mouseOver('${placeBoard.place_star}','${status.index}','${placeBoard.place_code}')" onmouseout="mouseOut('${status.index}', '${placeBoard.place_code}')" style="position:relative; width:60; height:60;">
		  			<img src="${root}${placeBoard.place_photo}" width="180" height="180"/>
				</span><br/>
				
				<span>장소명=${placeBoard.place_name}</span><br/>
				
			    <span id="${placeBoard.place_code}" style="position: relative; top:-120px; width:40; height:40;"></span><br/>
			    
				<a href="${root}/placeBoard/reviewBoard.do?place_code=${placeBoard.place_code}">평가하기</a><br/><br/><br/>
			</div>  
		</c:forEach>
	
	<!-- 페이지 번호 
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
			<a href="${root }/placeBoard/list.do?pageNumber=${startPage-pageBlock}">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<a href="${root }/placeBoard/list.do?pageNumber=${i}">[${i}]</a>
		</c:forEach>
		
		<c:if test="${endPage<pageCount }">
			<a href="${root }/placeBoard/list.do?pageNumber=${startPage+pageBlock}">[다음]</a>
		</c:if>
	</c:if>
	-->
</body>
</html>