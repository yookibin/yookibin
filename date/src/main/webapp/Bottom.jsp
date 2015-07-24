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
<style type="text/css">
.AllAll {
	width: 1100px;
	height: auto;
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
	margin: 0 0 3px 0;
	text-align: center;
}

.bt {
	width: 1100px;
	height: 150px;
	/* background-color:#f05f40; */
	border-top: 2px solid #f05f40;
}

.bt_div {
	width: 1100px;
	height: 150px;
	/* 	border: 1px solid blue;
 */
	float: left;
	font-size: 10px;
}

.bt_div_cen {
	margin: 20px 0 30px 0;
	text-align: center;
}

.bt_div_bt {
	width: 1100px;
	height: 50px;
	margin: 10px 0 0 0;
	text-align: center;
	font-size: 10px;
}

.bt_div_cen_img {
	
}
</style>
</head>
<body>
	<div class="AllAll">
		<div style="border-top: 3px red solid;">
			<div class="bt_div_cen">
				<img src="${root}/resources/main/logo1.png" alt=""
					style="width: 30px; height: 30px; margin-bottom: 5px; display: block; margin-left: auto; margin-right: auto;">
				<b>©Cheolgucompany</b>
			</div>
			<div class="bt_div_bt" style="text-align: center;">
				정지혜 : 010-4582-0844 / 박종현 : 010-2726-0813 / 정희준 : 010-4977-4586 /
				<!-- <br/> -->
				이진호 : 010-9893-3333 / 유기빈 : 010-9940-3880 / 정수현 : 010-9878-2587
			</div>
		</div>
	</div>
</body>

</html>