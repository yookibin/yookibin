<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="${root }/css/member/script.js"></script>
<script type="text/javascript" src="${root }/css/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/css/member/style.css" />

<!--  -->
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
	
	<div class="contentwrap">
  			<article class="container">
   		 		<div class="page-header">
	  				<h1>회원가입 <small>You And I</small></h1>
    			</div>
    			<form class="form-horizontal" name="memberForm" action="${root }/member/register.do" method="post" onsubmit="return registerForm(this)">
    				<div class="form-group">
    					<label for="inputEmail" class="col-sm-2 control-label">아이디</label>
    					<div class="col-sm-4">
    						<input type="text" class="form-control" id="inputEmail" name="id" placeholder="아이디">
    						<input type="button" value="아이디중복" onclick="idCheck(memberForm, '${root}')" />
    					</div>
    				</div>
    				<div class="form-group">
    					<label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
    					<div class="col-sm-4">
    						<input type="password" class="form-control" id="inputPassword" name="pw" placeholder="비밀번호">
    						<p class="help-block">숫자, 특수문자 포함 8자 이상</p>
   						</div>
    			    </div>
					<div class="form-group">
    					<label for="inputPasswordCheck" class="col-sm-2 control-label">비밀번호 확인</label>
   		 				<div class="col-sm-4">
   		 					<input type="password" class="form-control" id="inputPasswordCheck" name="passwordCheck" placeholder="비밀번호 확인">
      						<p class="help-block">비밀번호를 한번 더 입력해주세요.</p>
    					</div>
   					</div>
    				<div class="form-group">
    					<label for="inputRipple" class="col-sm-2 control-label">닉네임</label>
   					 	<div class="col-sm-4">
    						<input type="text" class="form-control" name="nickName" id="inputRipple" placeholder="닉네임">
    						<input type="button" value="닉네임중복" onclick="nickNameCheck(memberForm, '${root}')" />
    					</div>
    				</div>
    				<div class="form-group">
    					<label for="inputName" class="col-sm-2 control-label">나이</label>
    					<div class="col-sm-4">
    						<input type="text" class="form-control" id="inputName" name="age" placeholder="나이">
    					</div>
    				</div>
    				
	    			<div class="form-group">
	    				<label for="inputNumber" class="col-sm-2 control-label">휴대폰번호</label>
	    				<div class="col-sm-4">
	    					<input type="text" class="form-control" id="inputNumber" name="phone" placeholder="휴대폰번호">
	      					<p class="help-block">- 없이 적어주세요.</p>
	   				 	</div>
	    			</div>
	    			
	    			<div class="form-group">
						<label class="col-sm-2 control-label">생년월일</label>
						<div class="col-sm-4">
							<select name="year" >
								<option></option>
								<c:forEach var="i" begin="1988" end="2006">
									<c:if test="${i==1996 }">
										<option value="${i}" selected>${i}</option>	
									</c:if>
									<c:if test="${i!=1996 }">
										<option value="${i}">${i}</option>	
									</c:if>
									
								</c:forEach>
							</select>
							
							<select name="month">
								<option></option>
								<c:forEach var="i" begin="1" end="12">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select>
							
							<select name="day">
								<option></option>
								<c:forEach var="i" begin="1" end="31">
									<option value="${i}">${i}</option>
								</c:forEach>
							</select> 
							<input type="hidden" name="birthday"/>
							
						</div>
					</div>
	    			
	    			<div class="form-group">
						<label class="col-sm-2 control-label">우편번호</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="zipcode" placeholder="우편번호"/>
							<input type="button" value="우편번호검색" onclick="zipcodeCheck(memberForm, '${root}')"/>
						</div>
				  	</div>
				  	
				  	<div class="form-group">
						<label class="col-sm-2 control-label">주소</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" name="addr" size="48" placeholder="주소"/>
						</div>
					</div>

	   
	    		<div class="form-group">
	    			<label for="inputName" class="col-sm-2 control-label"></label>
				    <div class="col-sm-6">
				    	<button type="submit" class="btn btn-primary">회원가입</button>
	    			</div>
	    		</div>
	    	</form>
	  	</article>
	</div>
</body>
</html>