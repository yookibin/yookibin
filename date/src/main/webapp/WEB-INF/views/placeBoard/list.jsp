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
	
	<div class="radioDiv" style="width:750px; border:1px solid black;">
		<h3>데이트 장소 찾기</h3>
		<form action="${root}/placeBoard/boardList.do" onsubmit="return placeListForm(this)">
			<input type="radio" name="place_location" value="강남">강남 &nbsp;
			<input type="radio" name="place_location" value="목동">목동 &nbsp;
			<input type="radio" name="place_location" value="사당">사당 &nbsp;
			<input type="radio" name="place_location" value="삼성">삼성 &nbsp;
			<input type="radio" name="place_location" value="서래마을">서래마을 &nbsp;
			<input type="radio" name="place_location" value="신림">신림 &nbsp;
			<input type="radio" name="place_location" value="신사">신사 &nbsp;
			<input type="radio" name="place_location" value="신천">신천<br/>
			<input type="radio" name="place_location" value="압구정">압구정 &nbsp;
			<input type="radio" name="place_location" value="여의도">여의도 &nbsp;
			<input type="radio" name="place_location" value="영등포">영등포 &nbsp;
			<input type="radio" name="place_location" value="잠실">잠실 &nbsp;
			<input type="radio" name="place_location" value="천호">천호 &nbsp;
			<input type="radio" name="place_location" value="상암">상암 &nbsp;
			<input type="radio" name="place_location" value="기타">기타 &nbsp;
			<input type="submit" value="검색">
		</form>
	</div>
	
	<h3>검색결과</h3>
	<a href="">신규순</a> &nbsp; <a href="">인기순</a> <br/>
	
	<div style="width:760px; height:830px;">
	<c:forEach var="placeBoard" items="${boardList}" varStatus="status">
		<div style="float:left">
			<div id="starDiv" style="display:none">
				<c:if test="${placeBoard.place_star==0 || placeBarod.place_star<0.5}">
					<img src="${root}/resources/img/shopping.png"></c:if>
					
				<c:if test="${placeBoard.place_star==0.5 || placeBarod.place_star<1}">
					<img src="${root}/resources/img/shopping.png"></c:if>
					
				<c:if test="${placeBoard.place_star==1 || placeBarod.place_star<1.5}">
					<img src="${root}/resources/img/shopping.png"></c:if>
					
				<c:if test="${placeBoard.place_star==1.5 || placeBarod.place_star<2}">
					<img src="${root}/resources/img/shopping.png"></c:if>
					
				<c:if test="${placeBoard.place_star==2 || placeBarod.place_star<2.5}">
					<img src="${root}/resources/img/shopping.png"></c:if>
					
				<c:if test="${placeBoard.place_star==2.5 || placeBarod.place_star<3}">
					<img src="${root}/resources/img/shopping.png"></c:if>
					
				<c:if test="${placeBoard.place_star==3 || placeBarod.place_star<3.5}">
					<img src="${root}/resources/img/shopping.png"></c:if>
				
				<c:if test="${placeBoard.place_star==3.5 || placeBarod.place_star<4}">
					<img src="${root}/resources/img/shopping.png"></c:if>
					
				<c:if test="${placeBoard.place_star==4 || placeBarod.place_star<4.5}">
					<img src="${root}/resources/img/shopping.png"></c:if>
				
				<c:if test="${placeBoard.place_star==4.5|| placeBarod.place_star<5}">
					<img src="${root}/resources/img/shopping.png"></c:if>
				</div>
			
	 		<span id="${status.index}" onmouseover="mouseOver('${placeBoard.place_star}','${status.index}','${placeBoard.place_code}')" onmouseout="mouseOut('${status.index}', '${placeBoard.place_code}')" style="position:relative; width:60; height:60;">
	  			<img src="${root}${placeBoard.place_photo}" width="180" height="180"/>
			</span><br/>
			
			<span style="text-align:center;">${placeBoard.place_name}</span><br/>
			
		    <span id="${placeBoard.place_code}" style="position: relative; top:-120px; width:40; height:40;"></span><br/>
		    
			<a href="${root}/placeBoard/reviewBoard.do?place_code=${placeBoard.place_code}">평가하기</a><br/><br/><br/>
		</div>  
	</c:forEach><br/>
	</div>


	<div style="width:650px;">
		<center>
			<c:if test="${count>0}">
				<c:set var="pageBlock" value="${5}"/>
				<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0 ? 0:1 )}"/>
				
				<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
				<c:set var="startPage" value="${rs*pageBlock+1 }"/>
				<c:set var="endPage" value="${startPage+pageBlock-1 }"/>
				
				<c:if test="${endPage> pageCount }">
					<c:set var="endPage" value="${pageCount }"/>
				</c:if>
				
				<c:if test="${startPage>pageBlock }">
					<a href="${root }/placeBoard/boardList.do?pageNumber=${startPage-pageBlock}">[이전]</a>
				</c:if>
				
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href="${root }/placeBoard/boardList.do?pageNumber=${i}">[${i}]</a>
				</c:forEach>
				
				<c:if test="${endPage<pageCount }">
					<a href="${root }/placeBoard/boardList.do?pageNumber=${startPage+pageBlock}">[다음]</a>
				</c:if>
			</c:if>
		</center>
	</div>
</body>
</html>