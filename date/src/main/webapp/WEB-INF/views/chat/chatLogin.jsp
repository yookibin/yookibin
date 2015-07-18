<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/static/jquery.js"/>"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#chatId").focus();
	});
</script>
<script type="text/javascript">
	function entrance(root){
		if($("#chatId").val()==""||$("#chatId").val()==null){
			alert("닉네임을 입력하세요.");
			$("#chatId").focus();
		}else{
			var url=root+"/chat.do?chatId="+$("#chatId").val();
			location.href=url;
		}
	}
</script>
<link type="text/css" rel="stylesheet" href="${root}/css/bootstrap/bootstrap.min.css"/>

</head>
<body>
<%-- 	<input type="text" id="chatId" onKeyDown="if(event.keyCode==13){entrance('${root}'); return false;}"/>
	<input type="button" value="입장하기" onclick="entrance('${root}')"/> --%>
	
	<div style="display:table-cell; vertical-align:middle; text-align:center; width:500px; height:500px;">
		<div style="width:180px; height:50px; position:absolute; top:0; left:0;">
			<img src="${root }/resources/chat/YouAndI.png" width="180px" height="50px"/>
		</div> 
		<div style="width:500px;height:200px;"> 
			<img src="${root }/resources/chat/chat.png" width="200px" height="200px"/>
		</div>
		<br/><br/>
		<div class="input-group" style="width:400px; margin-left: 50px;" >
		    <input class="form-control" type="text" id="chatId" placeholder="닉네임을 입력하세요." onKeyDown="if(event.keyCode==13){entrance('${root}'); return false;}">
		    <span class="input-group-btn">
		      <button class="btn btn-default" type="button" onclick="entrance('${root}')">채팅 시작하기</button>
		    </span>
	  	</div>
	</div>
</body>
</html>