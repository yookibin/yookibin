<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0">        
        <meta name="description" content="Circle Hover Effects with CSS Transitions" />
        <meta name="keywords" content="circle, border-radius, hover, css3, transition, image, thumbnail, effect, 3d" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 	<link rel="stylesheet" type="text/css" href="${root}/css/example/demo.css" />
	<link rel="stylesheet" type="text/css" href="${root}/css/example/common.css" />
	<link rel="stylesheet" type="text/css" href="${root}/css/example/style4.css" />
    <link rel="stylesheet" type="text/css" href="${root}/css/example/style6.css" />
    <link rel="stylesheet" type="text/css" href="${root}/css/example/style7.css" />
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700' rel='stylesheet' type='text/css' />
<script type="text/javascript" src="${root}/css/modernizr.custom.79639.js"></script> 

<style type="text/css">
#css_tabs {
    font-family:'nanumgothic', '나눔고딕', 'malgun gothic', '맑은 고딕', 'dotum', '돋움', sans-serif
}
/* 탭 선택 시 표시할 요소(div) 정의(1번 탭 선택 시 첫 번째 div 요소 표시) */
#css_tabs input:nth-of-type(1), #css_tabs input:nth-of-type(1) ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3), #css_tabs input:nth-of-type(3) ~ div:nth-of-type(3) {
    display:none
}
#css_tabs input:nth-of-type(1):checked ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2):checked ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3):checked ~ div:nth-of-type(3) {
    display:block
}
/* 라벨 기본 스타일 지정 */
#css_tabs > label {
    display:inline-block;
    font-variant:small-caps;
    font-size:.9em;
    padding:5px;
    text-align:center;
    width:20%;
    line-height:1.8em;
    font-weight:700;
    border-radius:3px 3px 0 0;
    background:#eee;
    color:#777;
    border:1px solid #ccc;
    border-width:1px 1px 0
}
#css_tabs > label:hover {
    cursor:pointer
}
#css_tabs label[for=tab1] {
    margin-left:1.5em
}
/* 선택된 라벨, 커서를 올린 라벨 스타일 지정 */
#css_tabs input:nth-of-type(1):checked ~ label:nth-of-type(1), #css_tabs > label[for=tab1]:hover {
    background:tomato;
    color:#fff
}
#css_tabs input:nth-of-type(2):checked ~ label:nth-of-type(2), #css_tabs > label[for=tab2]:hover {
    background:gold;
    color:#fff
}
#css_tabs input:nth-of-type(3):checked ~ label:nth-of-type(3), #css_tabs > label[for=tab3]:hover {
    background:green;
    color:#fff
}
/* 실제 내용이 담긴 div 요소 스타일 지정 */
#css_tabs .tab1_content, #css_tabs .tab2_content,abs .tab3_content {
    padding:2em;
    border:1px solid #ddd;
    width:70%;
    height:100%
}


</style>

<title>Insert title here</title>
</head>
<body>
	<div id="css_tabs">
    	<input id="tab1" type="radio" name="tab" checked="checked" />
    	<input id="tab2" type="radio" name="tab" />
    	<input id="tab3" type="radio" name="tab" />
    	<label for="tab1">내 코스 관리</label>
    	<label for="tab2">포인트 관리</label>
    	<label for="tab3">내 흔적</label>
    		<div class="tab1_content">
    			
    			<section class="main">
				
				<ul class="ch-grid">
					<li>
						<div class="ch-item ch-img-1">				
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-1"></div>
									<div class="ch-info-back"><a href="${root}/mypage/mycourse/recommend.do">
										<h3>추천코스</h3>
										<p>by Gumball Creative View on choiceCourse</p>
										</a>
									</div>	
								</div>
							</div>
						</div>
					</li>
					<li>
        			<div class="ch-item ch-img-2">
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-2"></div>
									<div class="ch-info-back"><a href="${root}/mypage/mycourse/randomcourse.do">
										<h3>랜덤코스</h3>
										<p>by Brian Hurst View on RandomCourse</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="ch-item ch-img-3">
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-3"></div>
									<div class="ch-info-back"><a href="${root}/mypage/mycourse/middlecourse.do">
										<h3>중간코스</h3>
										<p>by Tad Carpenter View on Dribbble</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>				
			</section>
			</div>
			
    		<div class="tab2_content">
        		
        		<section class="main">
			
				<ul class="ch-grid">
					<li>
						<div class="ch-items">				
							<div class="ch-infos">
								<div class="ch-info-fronts ch-img-4"></div>
								<div class="ch-info-backs"><a href="">
									<h3>잔여포인트</h3>
									<p>by Alexander Shumihin  View on remainingpoint</p>
									</a>
								</div>	
							</div>
						</div>
					</li>
					<li>
						<div class="ch-items">
							<div class="ch-infos">
								<div class="ch-info-fronts ch-img-5"></div>
								<div class="ch-info-backs"><a href="">
									<h3>포인트사용조회</h3>
									<p>by Zoe Ingram View on usingcheck</p>
									</a>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="ch-items">
							<div class="ch-infos">
								<div class="ch-info-fronts ch-img-6"></div>
								<div class="ch-info-backs"><a href=""> 
									<h3>포인트사용(이벤트게시판이동)</h3>
									<p>by Eileen Tjan View on usingpoint</p>
									</a>
								</div>
							</div>
						</div>
					</li>
				</ul>
				
			</section>
        		
				
			<a href="">내가응모한 이벤트</a><br/><br/>
        		
        	</div>
        		
    		<div class="tab3_content">
        		<section class="main">
			
				<ul class="ch-grid">
					<li>
						<div class="ch-itema ch-img-8">				
							<div class="ch-info-wrapa">
								<div class="ch-infoa">
									<div class="ch-info-front ch-img-8"></div>
									<div class="ch-info-backa"><a href="">
										<h3>회원정보수정</h3>
										<p>by Josh Schott View on Dribbble</p>
										</a>
									</div>	
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="ch-itema ch-img-9">
							<div class="ch-info-wrapa">
								<div class="ch-infoa">
									<div class="ch-info-front ch-img-9"></div>
									<div class="ch-info-backa"><a href="">
										<h3>내가 쓴 게시글</h3>
										<p>by Jeremy Slagle View on Dribbble</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="ch-itema ch-img-10">
							<div class="ch-info-wrapa">
								<div class="ch-infoa">
									<div class="ch-info-front ch-img-10"></div>
									<div class="ch-info-backa"><a href="">
										<h3>내가 쓴 댓글</h3>
										<p>by Dustin Leer View on Dribbble</p>
										</a>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
				
			</section>
        		
			</div>	
		
			
	

</div>
  	
	
	
	
	
</body>
</html>