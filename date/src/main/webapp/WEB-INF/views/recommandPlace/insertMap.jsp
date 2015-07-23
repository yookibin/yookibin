<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${root }/css/alertify.js-0.3.11/lib/alertify.min.js"></script>
<link rel="stylesheet"
	href="${root }/css/alertify.js-0.3.11/themes/alertify.core.css" />
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


<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<style>
.lineA {
	width: 1100px;
	height: 52px;
	text-align: center;
	background-color: #FFF2E6;
}

.titleName {
	width: 121px;
	height: 50px;
	float: left;
	background-color: #8A4924;
	color: white;
	font-size: 20px;
	vertical-align: center;
}

.valueData {
	width: 230px;
	height: 50px;
	float: left;
	background-color: #FFF2E6;
	font-size: 17px;
}

input {
	background-color: #FFFFEF;
	border-radius: 5px;
}

select {
	width: 210px;
	background-color: #FFFFEF;
	border-radius: 5px;
}

textarea {
	background-color: #FFFFEF;
	border-radius: 5px;
}
</style>
<script type="text/javascript">
	function helpMapCor(root) {
		open(root + "/recommandPlace/helpMap.do", "helpMap",
				"width:600, height:300", "")
	}

	function checkForm(form) {
		if ($("input[name='place_name']").val() == "") {
			alertify.alert("장소명을 입력하세요.");
			$("input[name='place_name']").focus();
			return false;
		}
		var price = $("input[name='place_price']").val();
		if (!(price == 8 || price == 9 || price == 13 || price == 46
				|| price == 144 || (price >= 0 && price <= 1000000) || price == 110 || price == 190)) {
			alertify.alert("숫자만 입력가능합니다. 가격을 입력하세요.");
			$("input[name='place_price']").focus();
			return false;
		}
		if ($("input[name='place_cordi1']").val() == "") {
			alertify.alert("위도를 입력하세요.");
			$("input[name='place_cordi1']").focus();
			return false;
		}
		if ($("input[name='place_cordi2']").val() == "") {
			alertify.alert("경도를 입력하세요.");
			$("input[name='place_cordi2']").focus();
			return false;
		}
		if ($("input[name='place_phone']").val() == "") {
			alertify.alert("전화번호를 입력하세요.");
			$("input[name='place_phone']").focus();
			return false;
		}
		if ($("input[name='place_balance']").val() == "") {
			alertify.alert("금액대를 입력하세요.");
			$("input[name='place_balance']").focus();
			return false;
		}
		if ($("input[name='place_runtime']").val() == "") {
			alertify.alert("운영시간을 입력하세요.");
			$("input[name='place_runtime']").focus();
			return false;
		}
		if ($("input[name='place_location']").val() == "") {
			alertify.alert("주소를 입력하세요.");
			$("input[name='place_location']").focus();
			return false;
		}
		if ($("input[name='file']").val() == "") {
			alertify.alert("사진파일을 선택하세요.");
			$("input[name='file']").focus();
			return false;
		}
		if ($("input[name='place_gu']").val() == "") {
			alertify.alert("[__구]를 입력하세요.");
			$("input[name='place_gu']").focus();
			return false;
		}
		if ($("textarea[name='place_content']").val() == "") {
			alertify.alert("장소셜명을 입력하세요.");
			$("input[name='place_content']").focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div style="width: 1100px; margin-left: auto; margin-right: auto;">
		<jsp:include page="/TOP.jsp" />	
		<div class="map_button">
			<input type="button" class="btn btn-primary btn-lg btn-block"
				onclick="helpMapCor('${root}')" value="좌표따러가기">
		</div>
		<form action="${root}/recommandPlace/insertMap.do" method="post"
			onsubmit="return checkForm(this)" enctype="multipart/form-data">
			<div class="lineA">
				<div class="titleName">장소명</div>
				<div class="valueData">
					<input style="margin-top: 15px;" type="text" name="place_name">
				</div>
				<div class="titleName">별점</div>
				<div class="valueData">
					<select style="margin-top: 15px;" id="place_star"
						style="color: black; border-radius: 5px;" name="place_star">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
					</select>
				</div>
				<div class="titleName">실제금액</div>
				<div class="valueData">
					<input style="margin-top: 15px;" type="text" name="place_price"
						placeholder="숫자로입력">
				</div>
			</div>
			<div class="lineA">
				<div class="titleName">위도</div>
				<div class="valueData">
					<input style="margin-top: 15px;" type="text" name="place_cordi1">
				</div>
				<div class="titleName">추천시간</div>
				<div class="valueData">
					<select style="margin-top: 15px;" id="place_time"
						style="color: black; border-radius: 5px;" name="place_time">
						<option value="1">0~4시</option>
						<option value="2">4~8시</option>
						<option value="3">8~12시</option>
						<option value="4">12~16시</option>
						<option value="5">16~20시</option>
						<option value="6">20~24시</option>
					</select>
				</div>
				<div class="titleName">전화번호</div>
				<div class="valueData">
					<input style="margin-top: 15px;" type="text" name="place_phone">
				</div>
			</div>
			<div class="lineA">
				<div class="titleName">경도</div>
				<div class="valueData">
					<input style="margin-top: 15px;" type="text" name="place_cordi2">
				</div>
				<div class="titleName">장소금액</div>
				<div class="valueData">
					<input style="margin-top: 15px;" type="text" name="place_balance">
				</div>
				<div class="titleName">운영시간</div>
				<div class="valueData">
					<input style="margin-top: 15px;" type="text" name="place_runtime">
				</div>
			</div>
			<div class="lineA">
				<div class="titleName">날씨</div>
				<div class="valueData">
					<input style="margin-top: 15px;" type="text" name="place_weather"
						value="맑음,흐림,비,눈">
				</div>
				<div class="titleName">주소</div>
				<div class="valueData">
					<input style="margin-top: 15px;" type="text" name="place_location">
				</div>
				<div class="titleName">테마</div>
				<div class="valueData">
					<select style="margin-top: 15px;" id="place_thema"
						style="color: black; border-radius: 5px;" name="place_thema">
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
					<input style="margin-top: 15px;" type="text" name="place_season"
						value="봄,여름,가을,겨울">
				</div>
				<div class="titleName">사진경로</div>
				<div class="valueData">
					<input style="margin-top: 15px;" type="file" name="file" />
				</div>
				<div class="titleName">무슨구?</div>
				<div class="valueData">
					<input style="margin-top: 15px;" type="text" name="place_gu">
				</div>
			</div>
			<div class="lineA" style="height:130px">
				<div class="titleName" style="height:130px">장소설명</div>
				<div style="height:130px; float:left;">
					<textarea style="margin:12px 0 0 0;" rows="5" cols="115" name="place_content"></textarea>
				</div>
			</div>
			<div class="map_button">
				<input type="submit" class="btn btn-primary btn-lg btn-block"
					value="장소저장하기">
			</div>
		</form>
	</div>
	<div style="height:20px;"></div>
	<jsp:include page="/Bottom.jsp" />
</body>
</html>