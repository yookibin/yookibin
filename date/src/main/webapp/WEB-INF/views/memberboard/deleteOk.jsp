<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>

<script src="${root }/css/sweetalert-master/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/css/sweetalert-master/dist/sweetalert.css"/>
</head>
<body>
	
	<c:if test="${check>0 }">
		<script type="text/javascript">
			swal({ 
				  title: "GOOD!",
				  text: "삭제되었습니다.",
				  type: "success" 
				  },
				  function(){
				    window.location.href ="${root}/memberboard/list.do?pageNumber=${pageNumber}";
				});
			/* alert("삭제가 완료되었습니다.");
			location.href="${root}/memberboard/list.do?pageNumber=${pageNumber}"; */
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
		swal({ 
			  title: "GOOD!",
			  text: "삭제가 실패되었습니다. \r\n 비밀번호를 확인하세요.",
			  type: "error" 
			  },
			  function(){
			    window.location.href ="${root}/board/list.do?pageNumber=${pageNumber}";
			});
			/* alert();
			location.href="${root}/board/list.do?pageNumber=${pageNumber}"; */
		</script>
	</c:if>
</body>
</html>