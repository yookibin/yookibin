<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- Bootstrap Core CSS -->
<link href="${root}/css/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="${root}/css/bootstrap/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Social Buttons CSS -->
<link href="${root}/css/bootstrap/bower_components/bootstrap-social/bootstrap-social.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="${root}/css/bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${root}/css/bootstrap/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${root}/css/mypage/style.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript">
	function deleteCourse(root, num) {
		alert(num);
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
</script>
</head>
<body>
	<div class="aa">
		<div style="float: left;"></div>
		<div style="float: left; width: 250px; margin: 0 0 0 170px;">
			장소1</div>
		<div style="float: left; width: 250px; margin: 0 0 0 50px;">장소2
		</div>
		<div>저장날짜</div>
	</div>
	<c:forEach var="lList" items="${lList }" varStatus="status">
		<div class="a" id="${lList.num}">
			<div class="a1">
				<span> &nbsp;${status.index+1} </span>
			</div>
			<div class="a2">
				<div>
					<img alt="" src="${root}${lList.save_cplace1.place_photo}"
						width="250" height="150">
				</div>
				<div>
					cplace1 : ${lList.save_cplace1.place_name}<br>
				</div>
			</div>
			<div class="a3">
				<div>
					<img alt="" src="${root}${lList.save_cplace2.place_photo}"
						width="250" height="150">
				</div>
				<div>
					cplace2 : ${lList.save_cplace2.place_name}<br>
				</div>
			</div>
			<div>
				date : ${lList.save_date}<br> <input type="button" class="btn btn-outline btn-danger" value="삭제"
					onclick="deleteCourse('${root}','${lList.num}')">
			</div>
		</div>
	</c:forEach>
</body>
</html>