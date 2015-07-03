<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${root}/css/recommandPlace/style.css" />
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${root}/css/recommandPlace/script.js"></script>
<script type="text/javascript">
	function test(root) {
		$.ajax({
			url : root + "/recommandPlace/select2.do"
			,type : "post"
			,data:{
					place_location:$("#place_location").val(),
					place_season:$("#place_season").val(),
					place_weather:$("#place_weather").val(),
					place_time:$("#place_time").val(),
					place_price:$("#place_price").val(),
				}
			,success : function(data) {
				console.log(data);
				var courseList = "";
				for(var i=0;i<data.length-1;i=i+1){
					courseList += "<option value='"+data[i].place_code+","+data[i+1].place_code+"'>"+data[i].place_name+"ㅡㅡ>"+data[i+1].place_name+"</option>"
				}
				$("#courseSelect").append(courseList);
				
				
				var placeList = "";
				for(var i=0;i<data.length;i=i+1){
					placeList +="<div>"
						
						+"<div id='title'>"
							+"<div id='title_a'>"
								+"<img src='"+root+data[i].place_photo+"' width='348' height='348'>"
							+"</div>"
				
							+"<div id='title_b'>"+data[i].place_name
								+"<div id='"+data[i].place_code+"'>"
							+"</div></div></div></div>"
				}
				$("#place").empty();
				$("#place").append(placeList);
			}

		});
	}
	function test2(root) {
		$.ajax({
			url : root + "/recommandPlace/test12.do"
			,type : "post"
			,success : function(data) {
				console.log(data);
				alert(data[0]);
				alert(data[1].place_name);
			}
		});
	}
</script>
</head>
<body>
	환영합니다.
	<form action="${root}/recommandPlace/select.do" method="POST">
		지역을 선택하세요<br>
		<div>
			<p>
				지 역<select id="place_location" name="place_location">
					<option value="무관">무관</option>
					<option>강남</option>
					<option>목동</option>
					<option>사당</option>
					<option>삼성</option>
					<option>서래마을</option>
					<option>신림</option>
					<option>신사</option>
					<option>신천</option>
					<option>압구정</option>
					<option>여의도</option>
					<option>영등포</option>
					<option>잠실</option>
					<option>천호</option>
					<option>상암</option>
					<option>기타</option>
				</select><br>
			</p>
			<p>
				계 절<select id="place_season" name="place_season">
					<option value="무관">무관</option>
					<option>봄</option>
					<option>여름</option>
					<option>가을</option>
					<option>겨울</option>
				</select><br>
			</p>
			<p>
				날 씨<select id="place_weather" name="place_weather">
					<option value="무관">무관</option>
					<option>맑음</option>
					<option>흐림</option>
					<option>비</option>
					<option>눈</option>
				</select><br>
			</p>
			<p>
				시간대<select id="place_time" name="place_time">
					<option value="무관">무관</option>	
					<option value="1">새벽(4시~8시)</option>
					<option value="2">오전(8시~12시)</option>
					<option value="3">오후(12시~17시)</option>
					<option value="4">저녁(17시~23시)</option>
					<option value="5">야간(23시~4시)</option>
					<option value="21">야간(21)</option>
				</select><br>
			</p>
			<p>
				가격대<select id="place_price" name="place_price">
					<option value="1234">무관</option>
					<option value="1">1만원</option>
					<option value="3">3만원</option>
					<option value="5">5만원</option>
					<option value="7">7만원</option>
					<option value="9">9만원</option>
					<option value="0">0</option>
				</select><br>
			</p>

			<div>
				<input type="button" id="btn" value="gg" onclick="test('${root }')">
				<input type="button" id="btn" value="11" onclick="test2('${root }')">
				<input type="submit" value="페이지이동">
			</div>
		</div>
	</form>
	<form action="${root}/recommandPlace/selectCourse.do" method="POST">
		<div id="course">
			<p>
				코스추천 : <select id="courseSelect" name="courseSelect">
					<option>--코스선택--</option>
				</select><br>
			</p>
			<input type="submit" value="코스자세히보기">
		</div>
	</form>
	<div id="place"></div>

</body>
</html>










