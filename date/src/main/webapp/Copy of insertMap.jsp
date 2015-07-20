<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.lineA {
	width: 1100px;
	height: 52px;
	border: 1px red solid;
}

.titleName {
	width: 121px;
	height: 50px;
	float: left;
	border: 1px black solid;
}

.valueData {
	width: 242px;
	height: 50px;
	float: left;
	border: 1px black solid;
}
</style>
<script type="text/javascript">
	function helpMapCor(root){
		open(root+"/recommandPlace/helpMap.do","helpMap","width:600, height:300","")
	}
</script>
<body>
	<input type="button" value="좌표따러가기" onclick="helpMapCor('${root}')">
	<div style="width: 1100px; margin-left: auto; margin-right: auto;">
		<form action="${root}/recommandPlace/insertMap.do" method="post"
			enctype="multipart/form-data">
			<div class="lineA">
				<div class="titleName">장소명</div>
				<div class="valueData">
					<input type="text" name="place_name">
				</div>
				<div class="titleName">별점</div>
				<div class="valueData">
					<select id="place_star" style="color: black; border-radius: 5px;"
						name="place_star">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>
				<div class="titleName">실제금액</div>
				<div class="valueData">
					<input type="text" name="place_price" value="숫자로입력">
				</div>
			</div>
			<div class="lineA">
				<div class="titleName">위도</div>
				<div class="valueData">
					<input type="text" name="place_cordi1">
				</div>
				<div class="titleName">추천시간</div>
				<div class="valueData">
					<input type="text" name="place_time">
				</div>
				<div class="titleName">전화번호</div>
				<div class="valueData">
					<input type="text" name="place_phone">
				</div>
			</div>
			<div class="lineA">
				<div class="titleName">경도</div>
				<div class="valueData">
					<input type="text" name="place_cordi2">
				</div>
				<div class="titleName">장소금액</div>
				<div class="valueData">
					<input type="text" name="place_balance">
				</div>
				<div class="titleName">운영시간</div>
				<div class="valueData">
					<input type="text" name="place_runtime">
				</div>
			</div>
			<div class="lineA">
				<div class="titleName">날씨</div>
				<div class="valueData">
					<input type="text" name="place_weather">
				</div>
				<div class="titleName">주소</div>
				<div class="valueData">
					<input type="text" name="place_location">
				</div>
				<div class="titleName">테마</div>
				<div class="valueData">
					<select id="place_thema" style="color: black; border-radius: 5px;"
						name="place_thema">
						<option>shopping</option>
						<option>theaters</option>
						<option>play</option>
						<option>concert</option>
						<option>art</option>
						<option>park</option>
					</select>
				</div>
			</div>
			<div class="lineA">
				<div class="titleName">계절</div>
				<div class="valueData">
					<select id="place_season" style="color: black; border-radius: 5px;"
						name="place_season">
						<option>봄</option>
						<option>여름</option>
						<option>가을</option>
						<option>겨울</option>
					</select>
				</div>
				<div class="titleName">사진경로</div>
				<div class="valueData">
					<input type="file" name="file"/>
				</div>
				<div class="titleName">무슨구?</div>
				<div class="valueData">
					<input type="text" name="place_gu">
				</div>
			</div>
			<div class="lineA"></div>
			<input type="submit" value="저장" />
		</form>





	</div>
</body>
</html>