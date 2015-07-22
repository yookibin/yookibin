<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script src="${root }/css/sweetalert-master/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/css/sweetalert-master/dist/sweetalert.css"/>

<!-- <script type="text/javascript">
	function sleep(num){	//[1/1000초]
		 var now = new Date();
		   var stop = now.getTime() + num;
		   while(true){
			 now = new Date();
			 if(now.getTime() > stop)return;
		   }
	}
</script> -->
</head>
<body>

	<%-- <c:if test="${check>0 }">
		<script type="text/javascript">
			alertify.alert("수정되었습니다.");		
			//sleep(5000);
			location.href="${root}/eventBoard/list.do?pageNumber=${pageNumber}";
		</script>
	</c:if>

	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			alertify.alert("수정되지 않았습니다.");
			location.href="${root}/eventBoard/update.do?event_code=${event_code}&pageNumber=${pageNumber}";
		</script>
	</c:if> --%>
	
	<c:if test="${check>0 }">
		<script type="text/javascript">
			//alertify.alert("삭제되었습니다.");
			//location.href="${root}/eventBoard/list.do?pageNumber=${pageNumber}";
			swal({ 
				  title: "GOOD!",
				  text: "수정되었습니다.",
				  type: "success" 
				  },
				  function(){
				    window.location.href ="${root}/eventBoard/list.do?pageNumber=${pageNumber}";
				});
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			//alertify.alert("삭제되지 않았습니다.");
			//location.href="${root}/eventBoard/list.do?pageNumber=${pageNumber}";
			swal({ 
				  title: "BAD!",
				  text: "수정되지 않았습니다.",
				  type: "error" 
				  },
				  function(){
				    window.location.href ="${root}/eventBoard/list.do?pageNumber=${pageNumber}";
				});
		</script>
	</c:if>
</body>
</html>