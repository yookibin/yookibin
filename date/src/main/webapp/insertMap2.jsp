<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<script type="text/javascript" src="${root }/css/member/script.js"></script>
<script type="text/javascript" src="${root }/css/jquery.js"></script>
<link rel="stylesheet" type="text/css"
	href="${root }/css/member/style.css" />

<!-- 로그인 부트스트랩 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap Core CSS -->
<link
	href="${root }/css/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="${root }/css/bootstrap/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="${root }/css/bootstrap/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${root }/css/bootstrap/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

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
		if ($("input[name='place_weather']").val() == "") {
			alert("날씨를 입력하세요.");
			$("input[name='place_weather']").focus();
			return false;
		}
		if ($("input[name='place_season']").val() == "") {
			alert("계절을 입력하세요.");
			$("input[name='place_season']").focus();
			return false;
		}
		var star = $("input[name='place_star']").val();
		if (!(star == 8 || star == 9 || star == 13 || star == 46
				|| star == 144 || (star >= 0 && star <= 5) || star == 110 || star == 190)) {
			alert("별점을(1~5사이) 입력하세요.");
			$("input[name='place_star']").focus();
			return false;
		}
		if ($("input[name='place_time']").val() == "") {
			alert("추천시간을 입력하세요.");
			$("input[name='place_time']").focus();
			return false;
		}
		if ($("input[name='place_balance']").val() == "") {
			alert("가격대를 입력하세요.");
			$("input[name='place_balance']").focus();
			return false;
		}
		if ($("input[name='place_location']").val() == "") {
			alert("주소를 입력하세요.");
			$("input[name='place_location']").focus();
			return false;
		}
		var price = $("input[name='place_price']").val();
		if (!(price == 8 || price == 9 || price == 13 || price == 46
				|| price == 144 || (price <= 48 && price <= 57) || price == 110 || price == 190)) {
			alert("숫자만 입력가능합니다. 가격을 입력하세요.");
			$("input[name='place_price']").focus();
			return false;
		}
		if ($("input[name='place_phone']").val() == "") {
			alert("전화번호를 입력하세요.");
			$("input[name='place_phone']").focus();
			return false;
		}
		if ($("input[name='place_runtime']").val() == "") {
			alert("운영시간을 입력하세요.");
			$("input[name='place_runtime']").focus();
			return false;
		}
		/* if ($("input[name='place_runtime']").val() == "") {
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
		} */
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">장소추가하기</h3>
					</div>
					<div class="panel-body">
						<form action="${root}/recommandPlace/insertMap.do" method="post"
			onsubmit="return checkForm(this)" enctype="multipart/form-data">
							<fieldset>
								<div class="form-group">
									<input type="button" class="btn btn-lg btn-success btn-block"
										value="좌표보기" onclick="helpMapCor('${root}')" />
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="장소명" name="place_name"
										type="text" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="위도"
										name="place_cordi1" type="text" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="경도"
										name="place_cordi2" type="text" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="맑음,흐림,비,눈"
										name="place_weather" type="text" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="봄,여름,가을,겨울"
										name="place_season" type="text" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="별점(1~5)"
										name="place_star" type="text" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="추천시간"
										name="place_time" type="text" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="가격대"
										name="place_balance" type="text" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="주소"
										name="place_location" type="text" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="실제가격"
										name="place_price" type="text" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="전화번호"
										name="place_phone" type="text" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="운영시간"
										name="place_runtime" type="text" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="테마" name="place_thema"
										type="text" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="무슨구?" name="place_gu"
										type="text" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="파일" name="file"
										type="file" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="장소설명"
										name="place_content" type="text" value="">
								</div>

								<!-- Change this to a button or input when using this as a form -->
								<input type="submit" class="btn btn-lg btn-success btn-block"
									value="add Place" />
							</fieldset>
						</form>
					</div>
				</div>
			</div>
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

	<!-- Custom Theme JavaScript -->
	<script src="${root }/css/bootstrap/dist/js/sb-admin-2.js"></script>

</body>
</html>