 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- Bootstrap Core CSS -->
    <link href="${root }/css/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${root }/css/bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Social Buttons CSS -->
    <link href="${root }/css/bootstrap/bower_components/bootstrap-social/bootstrap-social.css" rel="stylesheet">

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
<link type="text/css" rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css"/>
<link href="${root }/css/chat/style.css" rel="stylesheet"/>
<script type="text/javascript" src="<c:url value="/static/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/sockjs-0.3.4.js"/>"></script>
<script type="text/javascript">
    
    $(document).ready(function(){
    	
    	$("#message").focus();    	
        $("#sendBtn").click(function(){  
            sendMessage();
           	
        });
    });
    
    var sock=new SockJS("<c:url value="/echo"/>");
    
    sock.onmessage=onMessage;
    
    sock.onclose=onClose;
    
    sock.onopen=onOpen;
    
    function onOpen(){
    	sock.send("${roomNum},${chatId },님이 접속하셨습니다./0");
    }
    
    function sendMessage(){
    	sock.send("${roomNum},${chatId},"+$("#message").val()+"/1");
    	
    	$('#message').val("");
    	$('#message').focus();
       
    }
    
    function onMessage(evt){
    	var data = evt.data;
     	var realData=data.split(",")[0];
    	var userCount=data.split(",")[1];  
      	
    	$("#data").append(realData);
    	
    	//alert(userCount);
    	$("#userCount").val("접속자 수 : "+userCount);
    	
    	$('textarea').scrollTop($('textarea')[0].scrollHeight);
    	
    }
    
    function onClose(evt){    	
    	$("#data").append("Connection closed!");
    }   
    
    function exit(root){
    	var url=root+"/chat.do?chatId=${chatId}";
		location.href=url;
    }
    
</script>
</head>
<body>
	<div style="padding-left: 20px;">
		<span style="width:30px; display:inline-block; height:25px; font-size: 18px;">[${roomNum}]</span>
		<span style="width:400px; display:inline-block; font-size:18px;">${roomName}</span>
	</div>
	<div style="height:30px; padding-left:20px;">
		<span style="font-size:18px;">${chatId }님</span>
		<span style="display:inline-block;width:100px;align:center; text-align:center;position:absolute;left:420px;">
			<input type="text" id="userCount" size="10px" disabled="disabled"/>
		</span>
	</div>
	<div class="line1">
		<p class="orangeLine"></p>
	</div>
	<div class="form-group">
      <div class="col-lg-10">      
        <textarea class="form-control" id="data" rows="15" cols="20" disabled="disabled" style="resize:none; width:510px;"></textarea>
      </div>
    </div>			
	
	<div class="form-group">
	  <div class="input-group" style="width:490px; margin-left: 15px;">
	    <textarea class="form-control" id="message" style="width: 450px;" onKeyDown="if(event.keyCode==13){sendMessage(); return false;}"></textarea>
	    <span class="input-group-btn">
	      <button style="height:54px;" class="btn btn-default" id="sendBtn" type="button">SEND</button>
	    </span>
	  </div>
	</div>

	<div style="align:center; width:520px; margin-left: 15px;">
		<%-- <img  src="${root }/resources/chat/chick.png" width="400" height="34"/>  --%>
		<button type="button" style="color:black; background:#F05F40; margin-left: 427px;" class="btn btn-danger" onclick="exit('${root}')">방 나가기</button>
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
