<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	//alert("ddd");
	</script>
	<h3>${area}</h3>
	
	<c:if test="${area=='송파구'}">
		
	
		<a href="${root}/placesearch/parkthema.do?area=송파구&park=park"><img src="${root}/resources/img/park.png">공원테마</a>
		
		<a href=""><img src="${root}/resources/img/art.png">미술관테마</a>
		<br/><br/>
		<a href=""><img src="${root}/resources/img/concert.png">공연테마</a>
		
		<a href=""><img src="${root}/resources/img/movie.png">극장테마</a>
		<br/><br/>
		<a href=""><img src="${root}/resources/img/shopping.png">쇼핑테마</a>
		
	</c:if>
	
	
	
</body>
</html>