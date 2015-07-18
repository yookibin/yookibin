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
<%
    int i=0;
    if(request.getParameter("Reload")!=null){
        i=Integer.parseInt(request.getParameter("Reload"))+1;   // 여기서 주의 할 점 null 이면 에러 나죠.
    }
%>

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
    
<script type="text/javascript" src="<c:url value="/static/jquery.js"/>"></script>
<link href="${root }/css/chat/style.css" rel="stylesheet"/>
<script type="text/javascript">
/* 	function sleep(num){
	  var now = new Date();
	  var stop = now.getTime() + num;
	  while(true){
	    now = new Date();
	    if(now.getTime() > stop)return;
	  }
	}
	
 	$(document).ready(function(){
		while(true){	 		
			location.reload();
			sleep(500000);
		}
	});  */ 
	
</script>
<script type="text/javascript">
	function makeRoom(root){	
		
		var roomName=prompt("방 제목을 입력하세요.","");
		if(roomName==null||roomName==""){
			alert("방 제목을 입력하세요.");
		}else{
			var url=root+"/chatDB.do?chatId=${chatId}&roomName="+roomName;
			location.href=url;
		}	
		
	}
	
	function entranceRoom(root,roomNum,roomName){
		//alert("roomName: "+button.value);
		//alert("button id: "+button.id);
		var url=root+"/chatRoom.do?chatId=${chatId}&roomName="+roomName+"&roomNum="+roomNum;
		location.href=url;
		
		//$(document).find("#enterForm").attr("action",url).submit();
	}
	
	function mouseOver(room,roomName,roomNum){
		room.style.opacity="0.4";			
		$(function (){
			$("#"+roomNum+":eq(0)").fadeIn(0, function(){ 
				$("#"+roomNum+":eq(1)").fadeIn(100);
			});
		});
	}
	
	function mouseOut(room,roomName,roomNum){		
		room.style.opacity="1.0";
		$(function (){
			$("#"+roomNum+":eq(0)").fadeOut(0, function(){ 
				$("#"+roomNum+":eq(1)").fadeOut(500);
			});
		});
		
	}
	
	function fnReload(index){
	    if(index < 1){
	        document.reload.action ="${root}/chat.do?";	        
	        document.reload.submit();
	   }
	}
</script>
<style>
.roomTextB{
	position:absolute;
	width:140px;
	height:140px;
	top:0; left:0;
	margin-top: 50px;
}

.roomTextDiv{
	position:absolute;
	font-size:20px;text-align:center;
	color:black;vertical-align:center;
	/* background:red; */
	padding-top:25px;
	top:0; left:0; display:none;
}

.parentsDiv{
	position:relative; 
}

.orangeLine2{
	border-style:dotted;border-width:1px;border-color:#F05F40;
}

#reloadButton{
	position:absolute;
	left:460px;
	margin-top: 3px;
}

</style>

</head>
<body onload="fnReload(<%= i %>);">	
	<div>
		<form name="reload" method="get">
			<input type="hidden" name="Reload" value="<%= i %>">
			<input type="hidden" name="chatId" value="${chatId }"/>
		</form>
		<form id="enterForm"method="post">		 	
			<br/>
			<div style="align:center; text-align:center;">
				<button type="button" class="btn btn-danger" style="background:#F05F40;" onclick="makeRoom('${root}')">방 만들기</button>
				<img src="${root }/resources/chat/reload.png" id="reloadButton" style="width:28px; height:28px; vertical-align:center;" onclick="fnReload('0')"></img>
			</div>
			<br/>
			<div class="line1">
				<p class="orangeLine"></p>
			</div>
			
			<c:set var="i" value="0"/>
			<c:set var="count" value="1"/>
			
			<div id="rooms" style="margin-left: 35px;">
				<c:if test="${list.size()==0 }">
					<div style="align:center;text-align: center;">
						<b>개설된 방이 없습니다. 방을 만들어 채팅을 즐기세요!</b>
					</div>
				</c:if>
				
				<c:forEach var="room" items="${list }">
					<c:if test="${i==0 || i==6 }">
						<c:set var="i" value="1"/>
					</c:if>						
					
					<span class="parentsDiv" style="width:140px; height:140px;display:inline-block;" onclick="entranceRoom('${root}','${room.chatRoom_num }','${room.chatRoom_name }')">		
						<img class="roomImg" width="140" height="140" src="${root }/resources/chat/${i }.png" style="opacity:1" onmouseover="mouseOver(this,'${room.chatRoom_name }','${room.chatRoom_num }')" onmouseout="mouseOut(this,'${room.chatRoom_name }','${room.chatRoom_num }')"/>
						<span style="width:140px; height:140px;" class="roomTextDiv" id="${room.chatRoom_num }">
							<b class="roomTextB" id="${room.chatRoom_num }">
								${room.chatRoom_name }
							</b>
						</span>					
					</span>
					
					<b>&nbsp;&nbsp;</b>	
					
					<c:if test="${count%3==0 }">
						<br/><br/>
					</c:if>
					 								
					<c:set var="i" value="${i+1 }"/>	
					<c:set var="count" value="${count+1 }"/>								 	 
				</c:forEach>
			</div>	
			
			<div class="line1">
				<br/>
				<p class="orangeLine"></p>
			</div>	
		</form>
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