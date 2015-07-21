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
<script type="text/javascript">
function chatStart(root){
	var url=root+"/chatStart.do";
	window.open(url,"chating","width=540,height=520,resizable=no");		
}
</script>
<style type="text/css">
.AllAll {
	width: 1100px;
	height: 1111px;
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
	width: 175px;
}

.menu-Aaa {
	margin: 0 0 3px 67px;
}
</style>
</head>
<body>
	<div class="AllAll">
		<c:if test="${id==null}">
			<div class="menu-B">
				<div
					style="width: 70px; height: 40px; float: right; margin: 10px 30px 0 0; font-size: 16px; color: #D2916C;">
					<span>
						<a href="${root }/member/register.do" style=" color: #D2916C;">회원가입</a>
					</span>
				</div>
				<div style="width: 50px; height: 40px; float: right; margin: 10px 0 0 0; font-size: 16px; color: #D2916C;">
					<span>
						<a href="${root }/member/login.do" style=" color: #D2916C;">로그인</a>
					</span>
				</div>
			</div>
		</c:if>

		<c:if test="${id!=null}">
			<div class="menu-B">
				<div
					style="width: 70px; height: 40px; float: right; margin: 10px 30px 0 0; font-size: 16px; color: #D2916C;">
					<span>
						<a href="${root }/member/logout.do" style=" color: #D2916C;">로그아웃</a>
					</span>
				</div>
				<div style="width: 70px; height: 40px; float: right; margin: 10px 0 0 0; font-size: 16px; color: #D2916C;">
					<span>
						<a href="${root }/member/update.do?id=${id}" style=" color: #D2916C;">회원수정</a>
					</span>
				</div>
				<div style="width: 70px; height: 40px; float: right; margin: 10px 0 0 0; font-size: 16px; color: #D2916C;">
					<span>
						<a href="${root }/member/delete.do" style=" color: #D2916C;">회원탈퇴</a>
					</span>
				</div>
				<c:if test="${memberLevel=='AA'}">
					<div style="width: 85px; height: 40px; float: right; margin: 10px 0 0 0; font-size: 16px; color: #D2916C;">
						<span>
							<a href="${root }/eventBoard/write.do" style=" color: #D2916C;">이벤트추가</a>
						</span>
					</div>
					<div style="width: 70px; height: 40px; float: right; margin: 10px 0 0 0; font-size: 16px; color: #D2916C;">
						<span>
							<a href="${root }/recommandPlace/insertM.do" style=" color: #D2916C;">장소추가</a>
						</span>
						<br />
					</div>
				</c:if>
			</div>
				<%-- v style="width: 100px; height: 40px; float: right;">
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
			</div> --%> 
		</c:if>
		<div class="menu-A">
			<div class="menu-Aa" style="margin: 0 0 0 20px;">
				<a href="./thisIndex.jsp"> <img alt="" src="${root}/resources/main/logo.gif"
					width="200" height="95">
				</a>
			</div>
			<div class="menu-Aa" style="margin: 0 0 0 50px;">
				<div class="menu-Aaa">
					<i class="fa fa-3x fa-diamond wow bounceIn text-primary" style="color: #D2916C;"></i>
				</div>
				<div id="topMenu">
					<ul>
						<li class="topMenuLi" style="margin: 0 0 0 14px;"><a
							class="menuLink"
							href="http://unikys.tistory.com/category/Programming%20Lecture" style="color: #FFF2E6;">데이트
								코스추천</a>
							<ul class="submenu" style="z-index: 1;">
								<li><a href="${root }/recommandPlace/findPlace.do"
									class="submenuLink" style="color: #8A4924;">데이트코스 추천</a></li>
								<li><a href="${root}/randomplace/randomPlaceStart.do"
									class="submenuLink" style="color: #8A4924;">랜덤데이트 추천</a></li>
								<li><a href="${root }/placesearch/choice.do"
									class="submenuLink" style="color: #8A4924;">테마별장소 선택</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
			<div class="menu-Aa">
				<div class="menu-Aaa">
					<i class="fa fa-3x fa-paper-plane wow bounceIn text-primary" style="color: #D2916C;"></i>
				</div>
				<div id="topMenu">
					<ul>
						<li class="topMenuLi" style="margin: 0 0 0 14px;"><a
							class="menuLink" href="${root }/memberboard/list.do" style="color: #FFF2E6;">회원추천 게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="menu-Aa">
				<div class="menu-Aaa">
					<i class="fa fa-3x fa-newspaper-o wow bounceIn text-primary" style="color: #D2916C;"></i>
				</div>
				<div id="topMenu">
					<ul>
						<li class="topMenuLi" style="margin: 0 0 0 14px;"><a
							class="menuLink" href="${root }/placeBoard/boardList.do" style="color: #FFF2E6;">장소
								게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="menu-Aa">
				<div class="menu-Aaa">
					<i class="fa fa-3x fa-heart wow bounceIn text-primary" style="color: #D2916C;"></i>
				</div>
				<div id="topMenu">
					<ul>
						<li class="topMenuLi" style="margin: 0 0 0 14px;"><a
							class="menuLink" href="${root }/eventBoard/list.do" style="color: #FFF2E6;">이벤트 게시판</a></li>
					</ul>
				</div>
			</div>
			<div class="menu-Aa" style="width:100px; margin-left: 15px;">
				<a href="#"> <img alt="채팅하기" src="${root}/resources/main/chat.png" 
					width="100" height="75" onclick="chatStart('${root}')">
				</a>
			</div>
		</div>
		<div id="sliderFrame">
			<div id="slider">
				<a href="${root}/placeBoard/reviewBoard.do?place_code=kang007"
					target="_blank"> <img
					src="${root}/css/imgSlide/images/amain1.png" alt="전망보고 영화보고~" />
				</a> <a href="${root}/placeBoard/reviewBoard.do?place_code=jong008"
					target="_blank"> <img
					src="${root}/css/imgSlide/images/amain2.JPG" alt="와 저높은 빌딩은 뭐야~!?" />
				</a> <a href="${root}/placeBoard/reviewBoard.do?place_code=song014"
					target="_blank"> <img
					src="${root}/css/imgSlide/images/amain3.png" alt="롯데월드는 지헤공주와 함께~" />
				</a> <a href="${root}/placeBoard/reviewBoard.do?place_code=song010"
					target="_blank"> <img
					src="${root}/css/imgSlide/images/amain4.png" alt="으헤헤헤헤우하하하하" />
				</a>
			</div>
			<!--thumbnails-->
			<div id="thumbs">
				<div class="thumb">
					<div class="frame">
						<img href="#" src="${root}/css/imgSlide/images/amain1.png" />
					</div>
					<div class="thumb-content">
						<p>청담동 CGV</p>
						넓고 쾌적한 환경의 영화관
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="thumb">
					<div class="frame">
						<img src="${root}/css/imgSlide/images/amain2.JPG" />
					</div>
					<div class="thumb-content">
						<p>종로타워</p>
						종로의 명소, 한번은 꼭 가야할 그 곳
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="thumb">
					<div class="frame">
						<img src="${root}/css/imgSlide/images/amain3.png" />
					</div>
					<div class="thumb-content">
						<p>롯데월드몰</p>
						쇼핑하기에 너무나도 좋은 롯데월드몰~!
					</div>
					<div style="clear: both;"></div>
				</div>
				<div class="thumb">
					<div class="frame">
						<img src="${root}/css/imgSlide/images/amain4.png" />
					</div>
					<div class="thumb-content">
						<p>송파CGV</p>
						송파에서 가장 큰 영화관~!
					</div>
					<div style="clear: both;"></div>
				</div>
			</div>
			<!--clear above float:left elements. It is required if above #slider is styled as float:left. -->
			<div style="clear: both; height: 0;"></div>
		</div>
		<div style="margin: 10px 0 0 5px; height: 300px;">
			<div class="event-A">
				<button class="prev-A" type="button">
					<img alt="" src="${root}/css/imgSlide/images/left.png">
				</button>
				<ul>
					<li><img src="${root}/css/imgSlide/images/slide_1.png" alt=""
						onclick="javascript:place_A('${root}','kang001')"></li>
					<li><img src="${root}/css/imgSlide/images/slide_2.png" alt=""
						onclick="javascript:place_A('${root}','jong001')"></li>
					<li><img src="${root}/css/imgSlide/images/slide_3.png" alt=""
						onclick="javascript:place_A('${root}','jong014')"></li>
				</ul>
				<button class="next-A" type="button">
					<img alt="" src="${root}/css/imgSlide/images/rigth.png">
				</button>
			</div>
			<div class="event-B">
				<button class="prev-B" type="button">
					<img alt="" src="${root}/css/imgSlide/images/left.png">
				</button>
				<ul>
					<li><div class="event_div" style="background-color: #FFA7A7;"
							onclick="javascript:events_A('${root}','77','1')">철구를 잡아라 !</div></li>
					<li><div class="event_div" style="background-color: #98F791;"
							onclick="javascript:events_A('${root}','78','1')">잠실에 싱크홀이
							?!</div></li>
					<li><div class="event_div" style="background-color: #36FFFF;"
							onclick="javascript:events_A('${root}','84','1')">청정도시 상암</div></li>
				</ul>
				<button class="next-B" type="button">
					<img alt="" src="${root}/css/imgSlide/images/rigth.png">
				</button>
			</div>
		</div>
		<div>
			<section class="bg-primary" id="about">
				<div class="container" id="footer">
					<div class="row">
						<div class="col-lg-8 col-lg-offset-2 text-center">
							<h2 class="section-heading">We've got what you need!</h2>
							<hr class="light">
							<p class="text-faded">Start Bootstrap has everything you need
								to get your new website up and running in no time! All of the
								templates and themes on Start Bootstrap are open source, free to
								download, and easy to use. No strings attached!</p>
							<a href="#" class="btn btn-default btn-xl">Get Started!</a>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>

</body>

</html>
