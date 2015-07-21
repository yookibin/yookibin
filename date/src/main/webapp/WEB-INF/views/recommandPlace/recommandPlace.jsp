<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="${root}/css/placeBoard/style.css" />
<!-- DataTables CSS -->
<link
	href="${root}/css/bootstrab/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet">
<!-- DataTables Responsive CSS -->
<link
	href="${root}/css/bootstrab/bower_components/datatables-responsive/css/dataTables.responsive.css"
	rel="stylesheet">
<!-- Social Buttons CSS -->
<link
	href="${root}/css/bootstrap/bower_components/bootstrap-social/bootstrap-social.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${root}/css/bootstrap/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="${root}/css/recommandPlace/style.css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${root}/css/recommandPlace/script.js"></script>
<script type="text/javascript">
	var addNumber = 10;
	function getCourses(root) {
		$("#course").css("display", "block");
		$("#addButton").css("display", "block");
		$
				.ajax({
					url : root + "/recommandPlace/select2.do",
					type : "post",
					data : {
						place_gu : $("#place_gu").val(),
						place_season : $("#place_season").val(),
						place_weather : $("#place_weather").val(),
						place_time : $("#place_time").val(),
						place_balance : $("#place_balance").val()
					},
					success : function(data) {
						console.log(data);
						var courseList = "";
						if (data.length >= 2) {
							for (var i = 0; i < data.length - 1; i = i + 1) {
								courseList += "<option value='"+data[i].place_code+","+data[i+1].place_code+"'>"
										+ data[i].place_name
										+ "ㅡㅡ>"
										+ data[i + 1].place_name + "</option>"
							}
							$("#courseSelect").empty();
							$("#courseSelect").append(courseList);

							var placeList = "";
							for (var i = 0; i < addNumber; i = i + 1) {
								placeList += "<div>"

										+ "<div id='title'>"
										+ "<div id='title_a'>"
										+ "<figure class='figurefx default'>"
										+ "<img src='"+root+data[i].place_photo+"' width='246' height='176'>"
										+ "<figcaption>" + "<div>";
								if (data[i].place_star <= 0
										&& data[i].place_star < 0.5) {
									placeList += "<img src='/date/resources/star/00.png' width='120' height='25' style='margin:0px 0px 0px 55px;'/>";
								} else if (data[i].place_star <= 0.5
										&& data[i].place_star < 1) {
									placeList += "<img src='/date/resources/star/05.png' width='120' height='25' style='margin:0px 0px 0px 55px;'/>";
								} else if (data[i].place_star <= 1
										&& data[i].place_star < 1.5) {
									placeList += "<img src='/date/resources/star/10.png' width='120' height='25' style='margin:0px 0px 0px 55px;'/>";
								} else if (data[i].place_star <= 1.5
										&& data[i].place_star < 2) {
									placeList += "<img src='/date/resources/star/15.png' width='120' height='25' style='margin:0px 0px 0px 55px;'/>";
								} else if (data[i].place_star <= 2
										&& data[i].place_star < 2.5) {
									placeList += "<img src='/date/resources/star/20.png' width='120' height='25' style='margin:0px 0px 0px 55px;'/>";
								} else if (data[i].place_star <= 2.5
										&& data[i].place_star < 3) {
									placeList += "<img src='/date/resources/star/25.png' width='120' height='25' style='margin:0px 0px 0px 55px;'/>";
								} else if (data[i].place_star <= 3
										&& data[i].place_star < 3.5) {
									placeList += "<img src='/date/resources/star/30.png' width='120' height='25' style='margin:0px 0px 0px 55px;'/>";
								} else if (data[i].place_star <= 3.5
										&& data[i].place_star < 4) {
									placeList += "<img src='/date/resources/star/35.png' width='120' height='25' style='margin:0px 0px 0px 55px;'/>";
								} else if (data[i].place_star <= 4
										&& data[i].place_star < 4.5) {
									placeList += "<img src='/date/resources/star/40.png' width='120' height='25' style='margin:0px 0px 0px 55px;'/>";
								} else if (data[i].place_star <= 4.5
										&& data[i].place_star < 5) {
									placeList += "<img src='/date/resources/star/45.png' width='120' height='25' style='margin:0px 0px 0px 55px;'/>";
								} else if (data[i].place_star == 5.0) {
									placeList += "<img src='/date/resources/star/50.png' width='120' height='25' style='margin:0px 0px 0px 55px;'/>";
								}
								placeList += "</div>"
										/* + "<input type='button' value='평가하기' onclick='openPlaceBoard('"+data[i].place_star+"')'>" */
										+ "<a href='/date/placeBoard/reviewBoard.do?place_code="
										+ data[i].place_code
										+ "'>평가하기</a>"
										+ "</figcaption>"
										+ "</figure>"
										+ "</div>"
										+ "<div id='title_b'>장소이름 : "
										+ data[i].place_name
										+ "<br>"
										+ "가격 : "
										+ data[i].place_balance
										+ "<br>"
										+ "운영시간 : "
										+ data[i].place_runtime
										+ "<br>"
										+ "전화번호 : "
										+ data[i].place_phone
										+ "<br>"
										+ "별점 : "
										+ data[i].place_star
										+ "<br>"
										+ "<div id='"+data[i].place_code+"'>"
										+ "</div></div></div></div>";
							}
							$("#place").empty();
							$("#place").append(placeList);
							if ((addNumber + 10) < data.length) {
								addNumber += 10;
							} else if ((addNumber + 10) >= data.length) {
								addNumber = data.length;
							} else if (addNumber == data.length) {
								$("#addButton").css("display", "none");
							}

						}else{
							$("#place2").empty();
							$("#place2").append("검색한 데이터가 없습니다.");
							$("#course").css("display", "none");
							$("#addButton").css("display", "none");
						}
					}
				});
	}

	function openPlaceBoard(aa) {
		alert(aa);
	}
	
	function idCheckForm(id){
		if(id == null || id==""){
			alert("로그인 후 이용 가능합니다.");
			return false;
		}
	}
</script>
<link type="text/css" rel="stylesheet"
	href="${root}/css/bootstrap/bootstrap.min.css" />
<style type="text/css">
.questAll {
	width: 1000px;
	height: 100px;
}

.ques {
	float: left;
	width: 140px;
}

.ques6 {
	width: 850px;
}

.allView {
	width: 1100px;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
	font-size: 20px;
	font-family: "돋움", "돋움체", "굴림", "굴림체", "나눔고딕";
}

.date_n_finder {
	width: 100%;
	height: 50px;
}

.date_n_top {
	position: relative;
	overflow: hidden;
	width: 100%;
	height: 40px;
	background: #5a474a
		url('http://image2.yanolja.com/site/imageFile/images/V2/dateCourse/images/20141023/bg_date_n_top.png')
		no-repeat 0 top;
}

.date_n_top .tit_date_n {
	float: left;
	margin: 12px 0 0 20px;
	size: 20px;
}

.date_n_top .tit_date_n img {
	vertical-align: middle;
}

.date_n_top .rankingup {
	float: right;
	position: relative;
	width: 292px;
	margin: 12px 20px 0 0;
}
</style>
</head>
<body>
	<div style="width: 1050px; margin-left: auto; margin-right: auto;">
		<jsp:include page="/TOP.jsp" />
		<table class="table table-striped table-bordered table-hover"
			id="dataTables-example">
			<thead>
				<tr>
					<th>번호</th>
					<th>장소명</th>
					<th>지역명</th>
					<th>날씨</th>
					<th>별점</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<c:forEach var="list" items="${list }" varStatus="status">
					<tr>
						<td><a
							href="/date/placeBoard/reviewBoard.do?place_code=${list.place_code }">${status.index+1}</a></td>
						<td><a
							href="/date/placeBoard/reviewBoard.do?place_code=${list.place_code }">${list.place_name }</a></td>
						<td><a
							href="/date/placeBoard/reviewBoard.do?place_code=${list.place_code }">${list.place_gu }</a>
						</td>
						<td class="center"><a
							href="/date/placeBoard/reviewBoard.do?place_code=${list.place_code }">${list.place_weather }</a></td>
						<td class="center"><a
							href="/date/placeBoard/reviewBoard.do?place_code=${list.place_code }">${list.place_star }</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div class="allView">
		<div class="date_n_finder"
			style="background: gray; font-size: 20px; color: white;">
			<div class="date_n_top">
				<h3 class="date_n_top">
					<span> <img
						src="http://image2.yanolja.com/site/imageFile/images/V2/dateCourse/images/20141023/txt_datearea.png"
						alt="데이트 장소 찾기" />
					</span>
				</h3>
			</div>

		</div>
		<form action="${root}/recommandPlace/select.do" method="POST">
			<div class="questAll">
				<div class="ques">
					<p>
						지 역 :<br> <select id="place_gu"
							style="color: black; border-radius: 5px;" name="place_gu">
							<option value="무관">무관</option>
							<c:forEach var="guList" items="${guList }">
								<option>${guList}</option>
							</c:forEach>
						</select><br>
					</p>
				</div>
				<div class="ques">
					<p>
						계 절 : <br> <select id="place_season"
							style="color: black; border-radius: 5px;" name="place_season">
							<option value="">무관</option>
							<option>봄</option>
							<option>여름</option>
							<option>가을</option>
							<option>겨울</option>
						</select><br>
					</p>
				</div>
				<div class="ques">
					<p>
						날 씨 :<br> <select id="place_weather"
							style="color: black; border-radius: 5px;" name="place_weather">
							<option value="">무관</option>
							<option>맑음</option>
							<option>흐림</option>
							<option>비</option>
							<option>눈</option>
						</select><br>
					</p>
				</div>
				<div class="ques">
					<p>
						시간대 :<br> <select id="place_time"
							style="color: black; border-radius: 5px;" name="place_time">
							<option value="무관">무관</option>
							<option value="1">0시~4시</option>
							<option value="2">4시~8시</option>
							<option value="3">8시~12시</option>
							<option value="4">12시~16시</option>
							<option value="5">16시~20시</option>
							<option value="6">20시~24시</option>
						</select><br>
					</p>
				</div>
				<div class="ques">
					<p>
						가격대 :<br> <select id="place_balance"
							style="color: black; border-radius: 5px;" name="place_balance">
							<option value="무관">무관</option>
							<option value="1만원">1만원</option>
							<option value="2만원">2만원</option>
							<option value="3만원">3만원</option>
							<option value="4만원">4만원</option>
							<option value="5만원">5만원</option>
							<option value="6만원">6만원</option>
							<option value="7만원">7만원</option>
							<option value="8만원">8만원</option>
							<option value="9만원">9만원</option>
						</select><br>
					</p>
				</div>

			</div>
			<div class="ques6">
				<div style="text-align: right;">
					<input type="button" id="btn" class="btn btn-warning"
						value="장소검색하기" onclick="getCourses('${root }')">
					<!-- <input type="submit" value="페이지이동"> -->
				</div>

			</div>



		</form>
		<form action="${root}/recommandPlace/selectCourse.do" method="POST" onsubmit="return idCheckForm('${id}')">
			<div id="course" style="display: none">

				<p>
					코스추천 : <select id="courseSelect"
						style="color: black; border-radius: 5px;" name="courseSelect">
						<option>--코스선택--</option>
					</select>&nbsp;&nbsp;
				</p>
				<input type="submit" class="btn btn-warning" value="코스자세히보기">
			</div>
		</form>
		<div id="place"
			style="border: 1px solid black; width: 1000px; height: auto;">
		</div>
		<div id="place2"
			style="font-size:30px; width: 1000px; height: auto;">
		</div>

	</div>
	<div class="ques7" id="addButton"
		style="display: none; text-align: right; width: 1000px; height: 50px;">
		<div>
			<input type="button" id="btn" class="btn btn-warning" value="더보기"
				onclick="test('${root }')">
		</div>

	</div>

	<!-- jQuery -->
	<script
		src="${root }/css/bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="${root }/css/bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="${root }/css/bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script
		src="${root }/css/bootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
	<script
		src="${root }/css/bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="${root }/css/bootstrab/dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
</body>
</html>










