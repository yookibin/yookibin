<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>