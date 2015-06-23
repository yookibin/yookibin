<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인페이지</title>
<script type="text/javascript" src="script.js"></script>
<link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>	
<c:set var="root" value="${pageContext.request.contextPath }"/>
<%-- <a href="${root }/member/aStart.do">aStart</a> --%>
<a href="${root }/start.jsp">aStart</a>

	<div align="center">
		안녕하세요. <c:out value="${id }"/> 님 <br/>
		즐거운 시간 되세요.
	</div>
</body>
</html>