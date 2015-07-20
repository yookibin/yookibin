<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<link rel="stylesheet" href="${root}/css/test/common.css"/>
<link rel="stylesheet" href="${root}/css/test/unit.css"/>
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.17.0/TweenMax.min.js"></script>
<script type="text/javascript" src="${root}/css/test/controller.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Image Slide</title>
</head>
<body>
	<div class="slide">
		<button class="prev" type="button"><img alt="" src="${root}/resources/star/00.png"></button>
		<ul>
			<li><img src="${root}/resources/board/1435200403502_Lighthouse.jpg" alt=""></li>
			<li><img src="${root}/resources/board/1435200403502_Lighthouse.jpg" alt=""></li>
			<li><img src="${root}/resources/board/1435200403502_Lighthouse.jpg" alt=""></li>
			<li><img src="${root}/resources/board/1435200403502_Lighthouse.jpg" alt=""></li>
			<li><img src="${root}/resources/board/1435200403502_Lighthouse.jpg" alt=""></li>
		</ul>		
		<button class="next" type="button"><img alt="" src="${root}/resources/star/00.png"></button>
	</div>
</body>
</html>