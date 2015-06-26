<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<title>Insert title here</title>
</head>
<body>
		
		
		<c:forEach var="park" items="${parkthema}">
			<tr>
				<td>${park.place_photo}</td>
				<td>${park.place_name}</td>
			</tr>				
				
			<img src="${root}/resources/img/park/olympicpark.png"></img>
		</c:forEach>
		
		
		
</body>
</html>