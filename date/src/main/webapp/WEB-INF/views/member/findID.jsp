<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
	<!-- 로그인 부트스트랩 -->
	
	<!-- Bootstrap Core CSS -->
    <link href="${root }/css/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${root }/css/bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

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

<%-- <link type="text/css" rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css"/> --%>

<script type="text/javascript" src="${root }/css/member/script.js"></script>
<script type="text/javascript" src="${root }/css/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/css/member/style.css" />
</head>
<body>
<%-- 
	<c:if test="${id==null }">
		<h3>해당 정보에 맞는 아이디가 없습니다.</h3>
		<a href=""></a>
	</c:if>
	<c:if test="${id!=null }">
		${id }
	</c:if> --%>
	
	<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">아이디 찾기</h3>
                    </div>
                    <div class="panel-body">
	                    <fieldset>
	                        <div class="form-group">
	                        	<label>회원님의 아이디</label>
	                        	<c:if test="${id!=null }">
	                            	<input class="form-control" name="id" type="text" value="${id }" disabled="disabled" autofocus/>
	                            </c:if>
	                            <c:if test="${id==null }">
	                            	<h5>해당 정보에 맞는 아이디가 없습니다.</h5>
	                            </c:if>
	                        </div> 
	                        <div>
	                        	<button type="button" class="btn btn-primary" onclick="location.href='${root }/member/login.do'">로그인하기</button>
	                        </div>        
	                    </fieldset>
                    </div>
            	</div>
        	</div>
    	</div>
    </div>
	
	<!-- jQuery -->
    <script src="${root }/css/bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${root }/css/bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${root }/css/bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${root }/css/bootstrap/dist/js/sb-admin-2.js"></script>
</body>
</html>