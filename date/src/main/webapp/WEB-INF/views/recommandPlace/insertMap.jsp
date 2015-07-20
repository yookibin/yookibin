<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<style>
.lineA {
	width: 1100px;
	height: 52px;
	border: 1px red solid;
	text-align:center;
}

.titleName {
	width: 121px;
	height: 50px;
	float: left;
	border: 1px black solid;
}

.valueData {
	width: 220px;
	height: 50px;
	float: left;
	border: 1px black solid;
}
</style>
<script type="text/javascript">
	function helpMapCor(root) {
		open(root + "/recommandPlace/helpMap.do", "helpMap",
				"width:600, height:300", "")
	}

	function checkForm(form) {
		if ($("input[name='place_name']").val() == "") {
			alert("장소명을 입력하세요.");
			$("input[name='place_name']").focus();
			return false;
		}
		var price = $("input[name='place_price']").val();
		if (!(price == 8 || price == 9 || price == 13 || price == 46
				|| price == 144 || (price <= 48 && price <= 57) || price == 110 || price == 190)) {
			alert("숫자만 입력가능합니다. 가격을 입력하세요.");
			$("input[name='place_price']").focus();
			return false;
		}
		if ($("input[name='place_cordi1']").val() == "") {
			alert("위도를 입력하세요.");
			$("input[name='place_cordi1']").focus();
			return false;
		}
		if ($("input[name='place_cordi2']").val() == "") {
			alert("경도를 입력하세요.");
			$("input[name='place_cordi2']").focus();
			return false;
		}
		if ($("input[name='place_phone']").val() == "") {
			alert("전화번호를 입력하세요.");
			$("input[name='place_phone']").focus();
			return false;
		}
		if ($("input[name='place_balance']").val() == "") {
			alert("금액대를 입력하세요.");
			$("input[name='place_balance']").focus();
			return false;
		}
		if ($("input[name='place_runtime']").val() == "") {
			alert("운영시간을 입력하세요.");
			$("input[name='place_runtime']").focus();
			return false;
		}
		if ($("input[name='place_location']").val() == "") {
			alert("주소를 입력하세요.");
			$("input[name='place_location']").focus();
			return false;
		}
		if ($("input[name='file']").val() == "") {
			alert("사진파일을 선택하세요.");
			$("input[name='file']").focus();
			return false;
		}
		if ($("input[name='place_gu']").val() == "") {
			alert("[__구]를 입력하세요.");
			$("input[name='place_gu']").focus();
			return false;
		}
		if ($("textarea[name='place_content']").val() == "") {
			alert("장소셜명을 입력하세요.");
			$("input[name='place_content']").focus();
			return false;
		}
	}
</script>
</head>
<body>
	<div style="width: 1100px; margin-left: auto; margin-right: auto;">
		<input type="button" value="좌표따러가기" onclick="helpMapCor('${root}')">
		<form action="${root}/recommandPlace/insertMap.do" method="post"
			onsubmit="return checkForm(this)" enctype="multipart/form-data">
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
					<input type="text" name="place_price" placeholder="숫자로입력">
				</div>
			</div>
			<div class="lineA">
				<div class="titleName">위도</div>
				<div class="valueData">
					<input type="text" name="place_cordi1">
				</div>
				<div class="titleName">추천시간</div>
				<div class="valueData">
					<select id="place_time" style="color: black; border-radius: 5px;"
						name="place_time">
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
					<input type="text" name="place_weather" value="맑음,흐림,비,눈">
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
					<input type="text" name="place_season" value="봄,여름,가을,겨울">
				</div>
				<div class="titleName">사진경로</div>
				<div class="valueData">
					<input type="file" name="file" />
				</div>
				<div class="titleName">무슨구?</div>
				<div class="valueData">
					<input type="text" name="place_gu">
				</div>
			</div>
			<div class="lineA">
				<div class="titleName">장소설명</div>
				<div>
					<textarea rows="2" cols="130" name="place_content"></textarea>
				</div>
			</div>
			<input type="submit" value="저장" />
		</form>
	</div>
</body>
</html>