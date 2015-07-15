<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Creative - Start Bootstrap Theme</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="${root}/resources/css/bootstrap.min.css"
	type="text/css">

<!-- Custom Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>
<link
	href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="${root}/resources/font-awesome/css/font-awesome.min.css"
	type="text/css">

<!-- Plugin CSS -->
<link rel="stylesheet" href="${root}/resources/css/animate.min.css"
	type="text/css">

<!-- Custom CSS -->
<link rel="stylesheet" href="${root}/resources/css/creative.css"
	type="text/css">
<link href="${root}/css/bootstrap/subMenu.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	
		<div class="container" style="height: 120px;">

			<div class="row">
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box">
						<!-- fa-diamond이부분이 그림 사진으로 변경가능 -->
						<i class="fa fa-4x fa-diamond wow bounceIn text-primary"></i>
						<!-- <p class="text-muted">Our templates are updated regularly so they don't break.</p> -->
						<div id="topMenu">
							<ul>
								<li class="topMenuLi" style="margin:0 0 0 14px;"><a class="menuLink" href="">데이트
										코스추천</a>
									<ul class="submenu" style="position: relative; z-index: 1;">
										<li><a href="" class="submenuLink longLink">데이트코스 추천</a></li>
										<li><a href="" class="submenuLink longLink">랜덤데이트 추천</a></li>
										<li><a href="" class="submenuLink longLink">테마별장소 선택</a></li>
									</ul></li>
							</ul>
						</div>

					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box">

						<!-- fa-paper-plane 부분이 그림으로 사진 -->
						<i class="fa fa-4x fa-paper-plane wow bounceIn text-primary"
							data-wow-delay=".1s"></i>
						<!-- <p class="text-muted">You can use this theme as is, or you can make changes!</p> -->
						<div id="topMenu">
							<ul>
								<li class="topMenuLi" style="margin:0 0 0 14px;"><a class="menuLink" href="">회원추천
										게시판</a></li>
							</ul>
						</div>

					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box">

						<!-- fa-newspaper-o 부분이 그림 -->
						<i class="fa fa-4x fa-newspaper-o wow bounceIn text-primary"
							data-wow-delay=".2s"></i>
						<!-- <p class="text-muted">We update dependencies to keep things fresh.</p> -->
						<div id="topMenu">
							<ul>
								<li class="topMenuLi" style="margin:0 0 0 14px;"><a class="menuLink" href="">장소
										게시판</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box">

						<!-- fa-heart 부분이 그림 -->
						<i class="fa fa-4x fa-heart wow bounceIn text-primary"
							data-wow-delay=".3s"></i>
						<!-- <p class="text-muted">You have to make your websites with love these days!</p> -->
						<div id="topMenu">
							<ul>
								<li class="topMenuLi" style="margin:0 0 0 14px;"><a class="menuLink" href="">이벤트 게시판</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</nav>




	<!-- jQuery -->
	<script src="${root}/resources/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="${root}/resources/js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="${root}/resources/js/jquery.easing.min.js"></script>
	<script src="${root}/resources/js/jquery.fittext.js"></script>
	<script src="${root}/resources/js/wow.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="${root}/resources/js/creative.js"></script>

</body>

</html>
