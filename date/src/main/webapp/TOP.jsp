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
<title>YouAndI Main</title>
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="${root}/resources/font-awesome/css/font-awesome.min.css"
	type="text/css">
<link href="${root}/css/bootstrap/subMenu.css" rel="stylesheet">
<link href="${root}/css/imgSlide/js-image-slider.css" rel="stylesheet"
	type="text/css" />
<script src="${root}/css/imgSlide/js-image-slider.js"
	type="text/javascript"></script>
<link href="${root}/css//imgSlide/generic.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="${root}/resources/css/bootstrap.min.css"
	type="text/css">
<!-- Custom Fonts -->
<link
	href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
<!-- Custom CSS -->
<link rel="stylesheet" href="${root}/resources/css/creative.css"
	type="text/css">
<style type="text/css">
.AllAll {
	width: 1100px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
}

.menu-A {
	width: 1100px;
	height: 100px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 20px;
}

.menu-Aa {
	float: left;
	width: 150px;
}

.menu-Aaa {
	margin: 0 0 0 98px;
}

.event-A {
	border: solid 1px black;
	float: left;
	width: 300px;
	height: 200px;
}
</style>
</head>
<body>
	<div class="AllAll">
		<div class="menu-A">
			<div class="menu-Aa" style="margin: 0 0 0 92px;">
				<a href="#"> <img alt="" src="${root}/resources/main/logo.gif"
					width="200" height="95">
				</a>
			</div>
			<div class="menu-Aa">
				<div class="menu-Aaa">
					<i class="fa fa-4x fa-diamond wow bounceIn text-primary"></i>
				</div>
				<div id="topMenu">
					<ul>
						<li class="topMenuLi" style="margin: 0 0 0 14px;"><a
							class="menuLink"
							href="http://unikys.tistory.com/category/Programming%20Lecture">데이트
								코스추천</a>
							<ul class="submenu" style="z-index: 1;">
								<li><a href="${root }/recommandPlace/findPlace.do"
									class="submenuLink">데이트코스 추천</a></li>
								<li><a href="${root}/randomplace/randomPlaceStart.do"
									class="submenuLink">랜덤데이트 추천</a></li>
								<li><a href="${root }/placesearch/choice.do"
									class="submenuLink">테마별장소 선택</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<div class="menu-Aa">
				<div class="menu-Aaa">
					<i class="fa fa-4x fa-paper-plane wow bounceIn text-primary"></i>
				</div>
				<div id="topMenu">
					<ul>
						<li class="topMenuLi" style="margin: 0 0 0 14px;"><a
							class="menuLink" href="${root }/memberboard/list.do">회원추천 게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="menu-Aa">
				<div class="menu-Aaa">
					<i class="fa fa-4x fa-newspaper-o wow bounceIn text-primary"></i>
				</div>
				<div id="topMenu">
					<ul>
						<li class="topMenuLi" style="margin: 0 0 0 14px;"><a
							class="menuLink" href="${root }/placeBoard/boardList.do">장소
								게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="menu-Aa">
				<div class="menu-Aaa">
					<i class="fa fa-4x fa-heart wow bounceIn text-primary"></i>
				</div>
				<div id="topMenu">
					<ul>
						<li class="topMenuLi" style="margin: 0 0 0 14px;"><a
							class="menuLink" href="${root }/eventBoard/list.do">이벤트 게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="menu-Aa" style="margin: 0 0 0 70px;">
				<a href="#"> <img alt="" src="${root}/resources/main/chat.png"
					width="95" height="95">
				</a>
			</div>
		</div>
	</div>

</body>

</html>
