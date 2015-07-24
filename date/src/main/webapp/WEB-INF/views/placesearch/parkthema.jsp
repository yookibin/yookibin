<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}" />
<title>least.js is a Random &amp; Responsive jQuery, HTML 5
	&amp; CSS3 Gallery with LazyLoad</title>

<meta name="description"
	content="least.js is a Random &amp; Responsive jQuery, HTML 5 &amp; CSS3 Gallery with LazyLoad">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<link href="${root}/css/least/style.min.css" rel="stylesheet">
<link href="${root}/css/least/prism.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/TOP2.jsp"/>
	<div style="width:1100px; height:800px; margin-left:auto; margin-right:auto;">
	<header>
		<h1>You And I</h1>
		<p>Random &amp; Responsive jQuery, HTML 5 &amp; CSS3 Gallery with
			LazyLoad</p>
	</header>

	<!-- Gallery -->
	<c:if test="${thema=='park'}">
		<section>
			<ul id="gallery">
				<c:forEach var="park" items="${parkthema}">
					<li id="fullPreview"></li>
					<li><a href="${root}${park.place_photo}"></a> <img
						data-original="${root}${park.place_photo}"
						src="${root}${park.place_photo}" width="240" height="150"
						alt="Fish" style="display: inline;">
						<div class="overLayer"></div>
						<div class="infoLayer">
							<ul>
								<li>
									<h2>${park.place_name}</h2>
								</li>
								<li>
									<p>View Picture</p>
								</li>
							</ul>
						</div>
						<p class="projectInfo">
							<strong>Monday, 14th April 2093:</strong> sit amet, consetetur
							sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
							labore et dolore magna aliquyam erat, sed diam voluptua. At vero
							eos et accusam et justo duo dolores et ea rebum. <a
								href="${root}/placeBoard/reviewBoard.do?place_code=${park.place_code}"
								style="width: 810px; height: 529px; padding: 80px;"></a>
						</p></li>
				</c:forEach>
			</ul>
		</section>
	</c:if>

	<c:if test="${thema=='art'}">
		<section>
			<ul id="gallery">
				<c:forEach var="art" items="${parkthema}">
					<li id="fullPreview"></li>
					<li><a href="${root}${art.place_photo}"></a> <img
						data-original="${root}${art.place_photo}"
						src="${root}${art.place_photo}" width="240" height="150"
						alt="Fish" style="display: inline;">
						<div class="overLayer"></div>
						<div class="infoLayer">
							<ul>
								<li>
									<h2>${art.place_name}</h2>
								</li>
								<li>
									<p>View Picture</p>
								</li>
							</ul>
						</div>
						<p class="projectInfo">
							<strong>Monday, 14th April 2093:</strong> sit amet, consetetur
							sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
							labore et dolore magna aliquyam erat, sed diam voluptua. At vero
							eos et accusam et justo duo dolores et ea rebum. <a
								href="${root}/placeBoard/reviewBoard.do?place_code=${art.place_code}"
								style="width: 810px; height: 529px; padding: 80px;"></a>
						</p></li>
				</c:forEach>
			</ul>
		</section>
	</c:if>

	<c:if test="${thema=='concert'}">
		<section>
			<ul id="gallery">



				<c:forEach var="concert" items="${parkthema}">

					<li id="fullPreview"></li>
					<li><a href="${root}${concert.place_photo}"></a> <img
						data-original="${root}${concert.place_photo}"
						src="${root}${concert.place_photo}" width="240" height="150"
						alt="Fish" style="display: inline;">

						<div class="overLayer"></div>
						<div class="infoLayer">
							<ul>
								<li>
									<h2>${concert.place_name}</h2>
								</li>
								<li>
									<p>View Picture</p>
								</li>
							</ul>
						</div>

						<p class="projectInfo">
							<strong>Monday, 14th April 2093:</strong> sit amet, consetetur
							sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
							labore et dolore magna aliquyam erat, sed diam voluptua. At vero
							eos et accusam et justo duo dolores et ea rebum. <a
								href="${root}/placeBoard/reviewBoard.do?place_code=${concert.place_code}"
								style="width: 810px; height: 529px; padding: 80px;"></a>
						</p></li>

				</c:forEach>
			</ul>

		</section>
	</c:if>

	<c:if test="${thema=='theaters'}">
		<section>

			<ul id="gallery">



				<c:forEach var="theaters" items="${parkthema}">

					<li id="fullPreview"></li>
					<li><a href="${root}${theaters.place_photo}"></a> <img
						data-original="${root}${theaters.place_photo}"
						src="${root}${theaters.place_photo}" width="240" height="150"
						alt="Fish" style="display: inline;">

						<div class="overLayer"></div>
						<div class="infoLayer">
							<ul>
								<li>
									<h2>${theaters.place_name}</h2>
								</li>
								<li>
									<p>View Picture</p>
								</li>
							</ul>
						</div>

						<p class="projectInfo">
							<strong>Monday, 14th April 2093:</strong> sit amet, consetetur
							sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
							labore et dolore magna aliquyam erat, sed diam voluptua. At vero
							eos et accusam et justo duo dolores et ea rebum. <a
								href="${root}/placeBoard/reviewBoard.do?place_code=${theaters.place_code}"
								style="width: 810px; height: 529px; padding: 80px;"></a>
						</p></li>

				</c:forEach>
			</ul>

		</section>
	</c:if>


	<c:if test="${thema=='shopping'}">
		<section>

			<ul id="gallery">



				<c:forEach var="shopping" items="${parkthema}">

					<li id="fullPreview"></li>
					<li><a href="${root}${shopping.place_photo}"></a> <img
						data-original="${root}${shopping.place_photo}"
						src="${root}${shopping.place_photo}" width="240" height="150"
						alt="Fish" style="display: inline;">

						<div class="overLayer"></div>
						<div class="infoLayer">
							<ul>
								<li>
									<h2>${shopping.place_name}</h2>
								</li>
								<li>
									<p>View Picture</p>
								</li>
							</ul>
						</div>

						<p class="projectInfo">
							<strong>Monday, 14th April 2093:</strong> sit amet, consetetur
							sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
							labore et dolore magna aliquyam erat, sed diam voluptua. At vero
							eos et accusam et justo duo dolores et ea rebum. <a
								href="${root}/placeBoard/reviewBoard.do?place_code=${shopping.place_code}"
								style="width: 810px; height: 529px; padding: 80px;"></a>
						</p></li>

				</c:forEach>
			</ul>

		</section>
	</c:if>

	<c:if test="${thema=='play'}">
		<section>

			<ul id="gallery">



				<c:forEach var="play" items="${parkthema}">

					<li id="fullPreview"></li>
					<li><a href="${root}${play.place_photo}"></a> <img
						data-original="${root}${play.place_photo}"
						src="${root}${play.place_photo}" width="240" height="150"
						alt="Fish" style="display: inline;">

						<div class="overLayer"></div>
						<div class="infoLayer">
							<ul>
								<li>
									<h2>${play.place_name}</h2>
								</li>
								<li>
									<p>View Picture</p>
								</li>
							</ul>
						</div>

						<p class="projectInfo">
							<strong>Monday, 14th April 2093:</strong> sit amet, consetetur
							sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
							labore et dolore magna aliquyam erat, sed diam voluptua. At vero
							eos et accusam et justo duo dolores et ea rebum. <a
								href="${root}/placeBoard/reviewBoard.do?place_code=${play.place_code}"
								style="width: 810px; height: 529px; padding: 80px;"></a>
						</p></li>

				</c:forEach>
			</ul>

		</section>
	</c:if>
	<jsp:include page="/Bottom.jsp"/>
	</div>
	

	<!-- / Gallery -->
	<script src="${root}/css/least/jquery.min.js"></script>
	<script src="${root}/css/least/jquery.lazyload.js"></script>

	<script src="${root}/css/least/least.min.js"></script>
	<script src="${root}/css/least/prism.js"></script>

	<script>
		$(document).ready(function() {
			$('#gallery').least();
		});
	</script>

</body>
</html>