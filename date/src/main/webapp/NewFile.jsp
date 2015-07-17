<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${root}/css/imgSlide/js-image-slider.css" rel="stylesheet"
	type="text/css" />
<script src="${root}/css/imgSlide/js-image-slider.js"
	type="text/javascript"></script>
<link href="${root}/css//imgSlide/generic.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div id="sliderFrame">
		<div id="slider">
			<a href="http://www.menucool.com/jquery-slider" target="_blank">
				<img src="${root}/css/imgSlide/images/image-slider-1.jpg"
				alt="Welcome to jQuery Slider" />
			</a> <a class="lazyImage"
				href="${root}/css/imgSlide/images/image-slider-2.jpg"
				title="Pure Javascript. No jQuery. No Flash.">Pure JavaScript</a> <a
				href="http://www.menucool.com/javascript-image-slider"><b
				data-src="${root}/css/imgSlide/images/image-slider-3.jpg">Image
					Slider</b></a> <a class="lazyImage"
				href="${root}/css/imgSlide/images/image-slider-4.jpg" title="">Slide
				4</a>
		</div>
		<!--thumbnails-->
		<div id="thumbs">
			<div class="thumb">
				<div class="frame">
					<img src="${root}/css/imgSlide/images/thumb1.jpg" />
				</div>
				<div class="thumb-content">
					<p>HTML Content</p>
					Thumbnails allows any HTML content
				</div>
				<div style="clear: both;"></div>
			</div>
			<div class="thumb">
				<div class="frame">
					<img src="${root}/css/imgSlide/images/thumb2.jpg" />
				</div>
				<div class="thumb-content">
					<p>Customizable</p>
					Thumbnail style is customizable
				</div>
				<div style="clear: both;"></div>
			</div>
			<div class="thumb">
				<div class="frame">
					<img src="${root}/css/imgSlide/images/thumb3.jpg" />
				</div>
				<div class="thumb-content">
					<p>Variety of Layouts</p>
					Just a CSS tweak.
				</div>
				<div style="clear: both;"></div>
			</div>
			<div class="thumb">
				<div class="frame">
					<img src="${root}/css/imgSlide/images/thumb4.jpg" />
				</div>
				<div class="thumb-content">
					<p>Integration</p>
					Built-in functions for the thumbnails
				</div>
				<div style="clear: both;"></div>
			</div>
		</div>
		<!--clear above float:left elements. It is required if above #slider is styled as float:left. -->
		<div style="clear: both; height: 0;"></div>
	</div>
</body>
</html>