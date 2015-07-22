<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function aaa(){
		alert("a");
	}
</script>
</head>
<body>
	<hr> 
		<a href="${root }/recommandPlace/findPlace.do">장소추천</a>
		<a href="${root }/recommandPlace/insertM.do">장소입력</a>
		<a href="${root }/recommandPlace/selectMap0.do">Map</a>
		<a href="${root }/recommandPlace/selectMap.do">select Map</a>
		<a href="${root }/recommandPlace/selectMap2.do">select Map2</a>
		<a href="${root }/recommandPlace/selectMap3.do">지도에 선그리기</a>
	<hr>
	<div onmouseover="aaa()">  ddsdsd  </div>
</body>
</html>