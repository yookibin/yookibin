<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Circle Hover Effects with CSS Transitions" />
<meta name="keywords"
	content="circle, border-radius, hover, css3, transition, image, thumbnail, effect, 3d" />
<meta name="author" content="Codrops" />
<link rel="shortcut icon" href="../favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${root}/css/example/demo.css" />
<link rel="stylesheet" type="text/css"
	href="${root}/css/example/common.css" />
<link rel="stylesheet" type="text/css"
	href="${root}/css/example/style4.css" />
<link rel="stylesheet" type="text/css"
	href="${root}/css/example/style6.css" />
<link rel="stylesheet" type="text/css"
	href="${root}/css/example/style7.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700'
	rel='stylesheet' type='text/css' />
<!-- Bootstrap Core CSS -->
<link
	href="${root}/css/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="${root}/css/bootstrap/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Social Buttons CSS -->
<link
	href="${root}/css/bootstrap/bower_components/bootstrap-social/bootstrap-social.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="${root}/css/bootstrap/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${root}/css/bootstrap/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${root}/css/mypage/style.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="${root}/css/modernizr.custom.79639.js"></script>

<style type="text/css">
.allAll {
	border: 1px solid black;
	width: 1100px;
	height: 1200px;
	margin-left: auto;
	margin-right: auto;
}

#css_tabs {
	font-family: 'nanumgothic', '나눔고딕', 'malgun gothic', '맑은 고딕', 'dotum',
		'돋움', sans-serif
}
/* 탭 선택 시 표시할 요소(div) 정의(1번 탭 선택 시 첫 번째 div 요소 표시) */
#css_tabs input:nth-of-type(1), #css_tabs input:nth-of-type(1) ~ div:nth-of-type(1),
	#css_tabs input:nth-of-type(2), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(2),
	#css_tabs input:nth-of-type(3), #css_tabs input:nth-of-type(3) ~ div:nth-of-type(3)
	{
	display: none
}

#css_tabs input:nth-of-type(1):checked ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2):checked 
	 ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3):checked ~ div:nth-of-type(3)
	{
	display: block
}
/* 라벨 기본 스타일 지정 */
#css_tabs>label {
	display: inline-block;
	font-variant: small-caps;
	font-size: .9em;
	padding: 5px;
	text-align: center;
	width: 20%;
	line-height: 1.8em;
	font-weight: 700;
	border-radius: 3px 3px 0 0;
	background: #eee;
	color: #777;
	border: 1px solid #ccc;
	border-width: 1px 1px 0
}

#css_tabs>label:hover {
	cursor: pointer
}

#css_tabs label[for=tab1] {
	margin-left: 1.5em
}
/* 선택된 라벨, 커서를 올린 라벨 스타일 지정 */
#css_tabs input:nth-of-type(1):checked ~ label:nth-of-type(1), #css_tabs>label[for=tab1]:hover
	{
	background: tomato;
	color: #fff
}

#css_tabs input:nth-of-type(2):checked ~ label:nth-of-type(2), #css_tabs>label[for=tab2]:hover
	{
	background: gold;
	color: #fff
}

#css_tabs input:nth-of-type(3):checked ~ label:nth-of-type(3), #css_tabs>label[for=tab3]:hover
	{
	background: green;
	color: #fff
}
/* 실제 내용이 담긴 div 요소 스타일 지정 */
#css_tabs .tab1_content, #css_tabs .tab2_content, abs .tab3_content {
	padding: 2em;
	border: 1px solid #ddd;
	width: 100%;
	height: 100%
}
</style>
<title>Insert title here</title>
<script type="text/javascript">
	function myCourse(root, id) {
		$
				.ajax({
					url : root + "/mypage/getMyCourse.do",
					type : "post",
					data : {
						id : id
					},
					success : function(data) {
						console.log(data);

						var str = "";
						for (var i = 0; i < data.length; i++) {
							str += "<div class='a' id="+data[i].num+">"
									+ "<div class='a1'>" + "<span> &nbsp;"
									+ (i + 1)
									+ "</span>"
									+ "</div>"
									+ "<div class='a2'>"
									+ "<div>"
									+ "<img alt='' src='"+root+data[i].save_cplace1.place_photo+"' width='250' height='150'>"
									+ "</div>"
									+ "<div>"
									+ data[i].save_cplace1.place_name
									+ "<br>"
									+ "</div>"
									+ "</div>"
									+ "<div class='a3'>"
									+ "<div>"
									+ "<img alt='' src='"+root+data[i].save_cplace2.place_photo+"' width='250' height='150'>"
									+ "</div>"
									+ "<div>"
									+ data[i].save_cplace2.place_name
									+ "<br>"
									+ "</div>"
									+ "</div>"
									+ "<div class='ab'>"
									+ "date : "
									+ data[i].save_date
									+ "<br> <input type='button' class='btn btn-outline btn-danger' value='삭제' onclick='deleteCourse()'"                 
									+ root
									+ "\',"
									+ data[i].num
									+ ")'>"
									+ "</div>" + "</div>"
						}

						$("#loadMyCourse").append(str);
					}
				});
	}
	function deleteCourse(root, num) {
		alert(num);
		alert(root);
		$.ajax({
			url : root + "/mypage/delete.do",
			type : "post",
			data : {
				num : num
			},
			success : function(data) {
				console.log(data);
				if (data == 1) {
					$("#" + num).remove();
				}
			}
		});
	}

	function myPoint(root, id) {

	}
</script>
</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="myModal23" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Using Point</h4>
				</div>
				<div class="racetimes" id="">
					<div class="row" id="firstrow">
						<div class="column">날짜</div>
						<div class="column">포인트 사용 내역</div>
						<div class="column">내역</div>
						<div class="column">포인트</div>
					</div>
				</div>
				<div class="modal-body">
					지혜공주님이 만들어야 할 자리
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->



	<!-- 모달시작 -->
	<div class="modal fade" id="myCourseLode" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" id="loadMyCourse">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">나의저장코스</h4>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<!-- 모달끝 -->








	<c:if test="${id==null}">
		<a href="${root }/member/register.do">회원가입</a>
		<a href="${root }/member/login.do">로그인</a>
	</c:if>


	<div class="allAll">
		<div id="css_tabs" style="border: 1px solid red;">
			<input id="tab1" type="radio" name="tab" checked="checked" /> <input
				id="tab2" type="radio" name="tab" /> <input id="tab3" type="radio"
				name="tab" /> <label for="tab1">내 코스 관리</label> <label for="tab2">포인트
				관리</label> <label for="tab3">내 흔적</label>
			<div class="tab1_content">

				<section class="main">

					<ul class="ch-grid">
						<li>
							<div class="ch-item ch-img-1">
								<div class="ch-info-wrap">
									<div class="ch-info">
										<div class="ch-info-front ch-img-1"></div>
										<div class="ch-info-back" data-toggle="modal"
											data-target="#myCourseLode" onclick="myCourse('${root}','rkaqo2')">
											<h3>나의추천코스</h3>
											<p>by Gumball Creative View on choiceCourse</p>
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
										<div class="ch-info-back">
											<a href="${root}/mypage/randomcourse.do">
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
										<div class="ch-info-back">
											<a href="${root}/mypage/middlecourse.do">
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
									<div class="ch-info-backs">
										<h3>잔여포인트</h3>
										<p>by Alexander Shumihin View on remainingpoint</p>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="ch-items">
								<div class="ch-infos">
									<div class="ch-info-fronts ch-img-5"></div>
									<div class="ch-info-backs"  data-toggle="modal"
										data-target="#myModal23" onclick="myPoint('${root}','rkaqo2')">
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
									<div class="ch-info-backs">
										<a href="${root}/eventBoard/list.do">
											<h3>포인트사용(이벤트게시판이동)</h3>
											<p>by Eileen Tjan View on usingpoint</p>
										</a>
									</div>
								</div>
							</div>
						</li>
					</ul>

				</section>


				<a href="${root}/mypage/usingevent.do?id=${id}">내가응모한 이벤트</a><br />
				<br />

			</div>

			<div class="tab3_content">
				<section class="main">

					<ul class="ch-grid">
						<li>
							<div class="ch-itema ch-img-8">
								<div class="ch-info-wrapa">
									<div class="ch-infoa">
										<div class="ch-info-front ch-img-8"></div>
										<div class="ch-info-backa">
											<a href="">
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
										<div class="ch-info-backa">
											<a href="">
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
										<div class="ch-info-backa">
											<a href="">
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
	</div>
	<!-- jQuery -->
	<script
		src="${root}/css/bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="${root}/css/bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="${root}/css/bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="${root}/css/bootstrap/dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Notifications - Use for reference -->
	<script>
		// tooltip demo
		$('.tooltip-demo').tooltip({
			selector : "[data-toggle=tooltip]",
			container : "body"
		})

		// popover demo
		$("[data-toggle=popover]").popover()
	</script>



</body>
</html>