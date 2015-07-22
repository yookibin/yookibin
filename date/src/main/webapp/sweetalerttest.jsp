<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${root }/css/sweetalert-master/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/css/sweetalert-master/dist/sweetalert.css"/>
</head>
<body>
	<script type="text/javascript">
		alert("일반 alert");
		//swal("Here's a message!");
		//swal("Good job!", "You clicked the button!", "success");
		//location.href="${root}/eventBoard/list.do";
		
	/* 	swal({ 
			  title: "Error",
			   text: "wrong user or password",
			    type: "error" 
			  },
			  function(){
			    window.location.href ="${root}/eventBoard/list.do";
			}); */
			
			swal({ 
				  title: "Error",
				   text: "wrong user or password",
				    type: "error" 
				  },
				  function(){
				    window.location.href ="${root}/eventBoard/list.do";
				});
	</script>
</body>
</html>