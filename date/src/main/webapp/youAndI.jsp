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
<link href="${root}/css/imgSlide/js-image-slider.css" rel="stylesheet"
	type="text/css" />
<script src="${root}/css/imgSlide/js-image-slider.js"
	type="text/javascript"></script>
<link href="${root}/css//imgSlide/generic.css" rel="stylesheet"
	type="text/css" />
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

<body id="page-top">

	<nav id="mainNav" class="navbar navbar-default navbar-fixed-top" style="position:relative;">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand page-scroll" href="#page-top">You and I</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="page-scroll" href="#about">메뉴1</a></li>
					<li><a class="page-scroll" href="#services">메뉴2</a></li>
					<li><a class="page-scroll" href="#portfolio">메뉴3</a></li>
					<li><a class="page-scroll" href="#contact">메뉴4</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
		<div class="container-fluid">
			<div id="topMenu">
				<ul>
					<li class="topMenuLi"><a class="menuLink" href="">데이트 코스추천</a>
						<ul class="submenu">
							<li><a href="${root }/recommandPlace/findPlace.do" class="submenuLink longLink">데이트코스 추천</a></li>
							<li><a href="${root}/randomplace/randomPlaceStart.do" class="submenuLink longLink">랜덤데이트 추천</a></li>
							<li><a href="${root }/placesearch/choice.do" class="submenuLink longLink">테마별장소 선택</a></li>
						</ul></li>
					<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="${root }/memberboard/list.do">회원추천 게시판</a></li>
					<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="${root }/placeBoard/boardList.do">장소 게시판</a>
					<li>|</li>
					<li class="topMenuLi"><a class="menuLink" href="${root }/eventBoard/list.do">이벤트 게시판</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<header>
		<div class="header-content">
			<div class="header-content-inner">
				<h1>Your Favorite Source of Free Bootstrap Themes</h1>
				<hr>
				<p>Start Bootstrap can help you build better websites using the
					Bootstrap CSS framework! Just download your template and start
					going, no strings attached!</p>
				<!-- <a href="#about" class="btn btn-primary btn-xl page-scroll">Find
					Out More</a> -->
			</div>
			
		</div>
	</header>
	
	<section class="bg-primary" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">We've got what you need!</h2>
                    <hr class="light">
                    <p class="text-faded">Start Bootstrap has everything you need to get your new website up and running in no time! All of the templates and themes on Start Bootstrap are open source, free to download, and easy to use. No strings attached!</p>
                    <a href="#" class="btn btn-default btn-xl">Get Started!</a>
                </div>
            </div>
        </div>
    </section>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

                    <div id="sliderFrame">
						<div id="slider">
							<a href="${root}/placeBoard/reviewBoard.do?place_code=kang007" target="_blank">
								<img src="${root}/css/imgSlide/images/amain1.png"
								alt="전망보고 영화보고~" />
							</a> 
							<a href="${root}/placeBoard/reviewBoard.do?place_code=jong008" target="_blank">
								<img src="${root}/css/imgSlide/images/amain2.JPG"
								alt="와 저높은 빌딩은 뭐야~!?" />
							</a> 
							<a href="${root}/placeBoard/reviewBoard.do?place_code=song014" target="_blank">
								<img src="${root}/css/imgSlide/images/amain3.png"
								alt="롯데월드는 지헤공주와 함께~" />
							</a> 
							<a class="lazyImage" href="${root}/css/imgSlide/images/amain4.png" 
								title="ㅋㅋㅋㅋㅋㅋㅋㅋㅋ">Slide4
							</a>
						</div>
						<!--thumbnails-->
						<div id="thumbs">
							<div class="thumb">
								<div class="frame">
									<img src="${root}/css/imgSlide/images/amain1.png" />
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
     
					

	<section id="services">
		<div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Menu</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
		<div class="container" style="height: 120px;">

			<div class="row">
				<div class="col-lg-3 col-md-6 text-center">
					<div class="service-box">
						<!-- fa-diamond이부분이 그림 사진으로 변경가능 -->
						<i class="fa fa-4x fa-diamond wow bounceIn text-primary"></i>
						<!-- <p class="text-muted">Our templates are updated regularly so they don't break.</p> -->
						<div id="topMenu">
							<ul>
								<li class="topMenuLi" style="margin: 0 0 0 14px;"><a
									class="menuLink" href="">데이트 코스추천</a>
									<ul class="submenu">
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
								<li class="topMenuLi" style="margin: 0 0 0 14px;"><a
									class="menuLink" href="">회원추천 게시판</a></li>
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
								<li class="topMenuLi" style="margin: 0 0 0 14px;"><a
									class="menuLink" href="">장소 게시판</a></li>
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
								<li class="topMenuLi" style="margin: 0 0 0 14px;"><a
									class="menuLink" href="">이벤트 게시판</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>


	</section>
	

	<section class="no-padding" id="portfolio">
		<div class="container-fluid">
			<div class="row no-gutter">
				<div class="col-lg-4 col-sm-6">
					<a href="#" class="portfolio-box"> <img
						src="${root}/resources/img/portfolio/1.jpg" class="img-responsive"
						alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">장소이름</div>
								<div class="project-name">별점 이나 다른것</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a href="#" class="portfolio-box"> <img
						src="${root}/resources/img/portfolio/2.jpg" class="img-responsive"
						alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">Category</div>
								<div class="project-name">Project Name</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a href="#" class="portfolio-box"> <img
						src="${root}/resources/img/portfolio/3.jpg" class="img-responsive"
						alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">Category</div>
								<div class="project-name">Project Name</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a href="#" class="portfolio-box"> <img
						src="${root}/resources/img/portfolio/4.jpg" class="img-responsive"
						alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">Category</div>
								<div class="project-name">Project Name</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a href="#" class="portfolio-box"> <img
						src="${root}/resources/img/portfolio/5.jpg" class="img-responsive"
						alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">Category</div>
								<div class="project-name">Project Name</div>
							</div>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6">
					<a href="#" class="portfolio-box"> <img
						src="${root}/resources/img/portfolio/6.jpg" class="img-responsive"
						alt="">
						<div class="portfolio-box-caption">
							<div class="portfolio-box-caption-content">
								<div class="project-category text-faded">Category</div>
								<div class="project-name">Project Name</div>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>

	<aside class="bg-dark">
		<div class="container text-center">
			<div class="call-to-action">
				<!-- <h2>Free Download at Start Bootstrap!</h2>
				<a href="#" class="btn btn-default btn-xl wow tada">Download
					Now!</a> -->
			</div>
		</div>
	</aside>

	<section id="contact">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 text-center">
					<h2 class="section-heading">Let's Get In Touch!</h2>
					<hr class="primary">
					<p>Ready to start your next project with us? That's great! Give
						us a call or send us an email and we will get back to you as soon
						as possible!</p>
				</div>
				<div class="col-lg-4 col-lg-offset-2 text-center">
					<i class="fa fa-phone fa-3x wow bounceIn"></i>
					<p>123-456-6789</p>
				</div>
				<div class="col-lg-4 text-center">
					<i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>
					<p>
						<a href="mailto:your-email@your-domain.com">feedback@startbootstrap.com</a>
					</p>
				</div>
			</div>
		</div>
	</section>

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
