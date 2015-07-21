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
<link rel="stylesheet" href="${root}/css/slide/unit.css" />
<link rel="stylesheet" href="${root}/css/slide/common.css" />
<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/gsap/1.17.0/TweenMax.min.js"></script>
<script type="text/javascript" src="${root}/css/slide/controller.js"></script>
<script type="text/javascript"
	src="${root}/css/slide/eventController.js"></script>
<style type="text/css">
.AllAll {
	width: 1100px;
	height: 1111px;
	margin-left: auto;
	margin-right: auto;
	/* border:1px black solid; */
}

.menu-A {
	width: 1100px;
	height: 100px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 20px;
}

.menu-B {
	width: 1100px;
	height: 30px;
	/* margin-left: auto; */
	/* margin-right: 230px; */
	/* margin-top: 20px; */
	text-align: right;
}

.menu-Aa {
	float: left;
	width: 150px;
}

.menu-Aaa {
	margin: 0 0 0 55px;
}
</style>
</head>
<body>
		<c:if test="${id==null}">
			<div class="menu-B">
				<div
					style="width: 100px; height: 40px; float: right; margin-right: 100px;">
					<a href="${root }/member/login.do"><img alt=""
						src="${root}/resources/main/login.png" width="95" height="30">
					</a>
				</div>
				&nbsp;&nbsp;&nbsp;
				<div style="width: 100px; height: 40px; float: right;">
					<a href="${root }/member/register.do"><img alt=""
						src="${root}/resources/main/memberUp.png" width="95" height="30"></a>
				</div>
			</div>
		</c:if>

		<c:if test="${id!=null}">
			<div class="menu-B">
				<div
					style="width: 100px; height: 40px; float: right; margin-right: 100px;">
					<a href="${root }/member/logout.do"><img alt=""
						src="${root}/resources/main/logout.png" width="95" height="30"></a>
				</div>
				<div style="width: 100px; height: 40px; float: right;">
					<a href="${root }/member/update.do?id=${id}"><img alt=""
						src="${root}/resources/main/memberUpdate.png" width="95"
						height="30"></a>
				</div>
				<div style="width: 100px; height: 40px; float: right;">
					<a href="${root }/member/delete.do"><img alt=""
						src="${root}/resources/main/memberEnd.png" width="95" height="30"></a>
				</div>
				<c:if test="${memberLevel=='AA'}">
					<div style="width: 100px; height: 40px; float: right;">
						<a href="${root }/eventBoard/write.do"><img alt=""
							src="${root}/resources/main/event.png" width="85" height="30"></a>
					</div>
					<div style="width: 100px; height: 40px; float: right;">
						<a href="${root }/recommandPlace/insertM.do"><img alt=""
							src="${root}/resources/main/place.png" width="70" height="30"></a>
						<br />
					</div>
				</c:if>
			</div>
		</c:if>
		<div class="menu-A">
			<div class="menu-Aa" style="margin: 0 0 0 80px;">
				<a href="./thisIndex.jsp"> <img alt="" src="${root}/resources/main/logo.gif"
					width="200" height="95">
				</a>
			</div>
			<div class="menu-Aa" style="margin: 0 0 0 50px;">
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
				<div class="menu-Aaa" style="margin-left: 65px;">
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
				<div class="menu-Aaa" style="margin-left: 65px;">
					<i class="fa fa-4x fa-heart wow bounceIn text-primary"></i>
				</div>
				<div id="topMenu">
					<ul>
						<li class="topMenuLi" style="margin: 0 0 0 14px;"><a
							class="menuLink" href="${root }/eventBoard/list.do">이벤트 게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="menu-Aa" style="margin: 0 0 0 35px;">
				<a href="#"> <img alt="" src="${root}/resources/main/chat.png"
					width="95" height="95">
				</a>
			</div>
		</div>

</body>

</html>
