<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>로그인</title>
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

<script type="text/javascript">
  	function findID(){
  		$(document).ready(function(){
  			$("#findID").submit();
  		});
  	}
  	
  	function findPW(){
  		$(document).ready(function(){
  			$("#findPW").submit();
  		});
  	}

</script>

</head>
<body>

	 <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Login</h3>
                    </div>
                    <div class="panel-body">
                        <form action="${root }/member/login.do" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="ID" name="id" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="password" type="password">
                                </div>          
                                
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" class="btn btn-lg btn-success btn-block" value="로그인"/>
                            </fieldset>
                        </form>
                        <br/>
                        <!-- ------------------------------------------------------------------------------ -->
			        	<!-- modal -->
			        	<div class="row">
			                <div style="width:300px;height:20px; margin-left: 18px;">    
			                    <!-- Button trigger modal -->
			                    <a data-toggle="modal" data-target="#myModal">아이디 찾기  |</a>&nbsp;
			                    <a data-toggle="modal" data-target="#myModal2">비밀번호 찾기  |</a>
			                    <a href="${root }/member/register.do">회원가입</a>
			                    
			                    <!-- Modal -->
			                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			                        <div class="modal-dialog">
			                            <div class="modal-content" style="width:430px;">
			                                <div class="modal-header">
			                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                                    <h4 class="modal-title" id="myModalLabel">아이디 찾기</h4>
			                                </div>
			                                <div class="modal-body">
			                                    	<form id="findID" action="${root }/member/findID.do" method="post">
														<div style="width:400px">
															<label style="width:70px">닉네임</label>
															<input type="text" class="form-control" id="nickName" name="nickName" size="40px;">
														</div><br/>
														<div style="width:400px">
															<label style="width:70px">휴대폰</label>
															<input type="text" class="form-control" id="phone" name="phone" size="40px;">
														</div><br/>
													</form>
			                                </div>
			                                <div class="modal-footer">
			                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			                                    <button type="button" class="btn btn-primary" onclick="findID()">아이디 찾기</button>
			                                </div>
			                            </div>
			                            <!-- /.modal-content -->
			                        </div>
			                        <!-- /.modal-dialog -->
			                    </div>
			                    <!-- /.modal -->
			                    
			                    <!-- Modal -->
			                    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			                        <div class="modal-dialog">
			                            <div class="modal-content" style="width:430px;">
			                                <div class="modal-header">
			                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			                                    <h4 class="modal-title" id="myModalLabel">비밀번호 찾기</h4>
			                                </div>
			                                <div class="modal-body">
			                                    	<form id="findPW" action="${root }/member/findPW.do" method="post">
														<div style="width:400px">
															<label style="width:70px">아이디</label>
															<input type="text" class="form-control" id="id" name="id" size="40px;">
														</div><br/>
														<div style="width:400px">
															<label style="width:70px">휴대폰</label>
															<input type="text" class="form-control" id="phone" name="phone" size="40px;">
														</div><br/>
													</form>
			                                </div>
			                                <div class="modal-footer">
			                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			                                    <button type="button" class="btn btn-primary" onclick="findPW()">비밀번호 찾기</button>
			                                </div>
			                            </div>
			                            <!-- /.modal-content -->
			                        </div>
			                        <!-- /.modal-dialog -->
			                    </div>
			                    <!-- /.modal -->
			                </div>
			                <!-- /.col-lg-6 -->                
			            </div>
			            <!-- /.row -->
        
       				<!-- ------------------------------------------------------------------------------ -->
                    
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

    <!-- Page-Level Demo Scripts - Notifications - Use for reference -->
    <script>
    // tooltip demo
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    })

    // popover demo
    $("[data-toggle=popover]")
        .popover()
    </script>
	
</body>
</html>