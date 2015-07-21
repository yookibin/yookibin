<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복 체크</title>
<script type="text/javascript" src="${root }/css/member/script.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/css/member/style.css" />

<!-- Bootstrap Core CSS -->
    <link href="${root }/css/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${root }/css/bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="${root }/css/bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="${root }/css/bootstrap/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${root }/css/bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${root }/css/bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<c:if test="${check==1 }">
	<div align="center" style="padding-top: 20px">
		<form action="${root }/member/idCheck.do" method="get">
			<input class="form-control" type="text" name="id"/>
			<input class="btn btn-primary" type="submit" value="확인"/>
		</form>
		<h4><strong>이미 사용중인 아이디 입니다.</strong></h4>
	</div>
</c:if>

<c:if test="${check==0 }">
	<div align="center">
		<h4><strong>사용 가능한 아이디 입니다.</strong></h4>
	</div>
</c:if>
	<br/>
	
	<script type="text/javascript">
		opener.memberForm.id.value="${id}";
	</script>
	
	<div align="center">
		<input type="button" onclick="location.href='javascript:self.close()'" type="button" class="btn btn-primary" value="닫기"/>
	</div>
</body>
</html>