<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root }/css/placeBoard/script.js"></script>
</head>
<body>
	<form action="${root }/placeBoard/placeBoardsearch.do" onsubmit="return placeListForm(this)">
		<input type="checkbox" name="place_location" value="강남">강남
		<input type="checkbox" name="place_location" value="목동">목동
		<input type="checkbox" name="place_location" value="사당">사당
		<input type="checkbox" name="place_location" value="삼성">삼성
		<input type="checkbox" name="place_location" value="서래마을">서래마을
		<input type="checkbox" name="place_location" value="신림">신림
		<input type="checkbox" name="place_location" value="신사">신사
		<input type="checkbox" name="place_location" value="신천">신천<br/>
		<input type="checkbox" name="place_location" value="압구정">압구정
		<input type="checkbox" name="place_location" value="여의도">여의도
		<input type="checkbox" name="place_location" value="영등포">영등포
		<input type="checkbox" name="place_location" value="잠실">잠실
		<input type="checkbox" name="place_location" value="천호">천호
		<input type="checkbox" name="place_location" value="상암">상암
		<input type="checkbox" name="place_location" value="기타">기타
		<input type="hidden" name="location">
		<input type="submit" value="검색">
	 	
	</form>
	
	<h3>검색결과</h3>
	<a href="${root}/placeBoard/">신규순</a> &nbsp; <a href="">인기순</a>
	
	<c:forEach var="placeBoard" items="${placeBoardList}">
		<div id="placeBoardDisp	">이름=${placeBoard.place_name}<br/>
		     사진=${placeBoard.place_phone}
		</div>
	</c:forEach>
	
</body>
</html>