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
<script type="text/javascript" src="${root }/css/jquery.js"></script>
</head>
<body>
	
	<c:if test="${check>0 }">
		<script type="text/javascript">
			//alert("회원가입이 완료 되었습니다.");
			//location.href="${root}/member/register.do";
			//$(location).attr("href", "${root}/member/login.do");
			
			swal({ 
				  title: "GOOD!",
				  text: "회원가입이 완료 되었습니다.",
				  type: "success" 
				  },
				  function(){
				    window.location.href ="${root}/member/login.do";
				});
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			//alert("회원가입이 완료 되지 않았습니다.");
			//location.href="${root}/member/register.do";
			//$(location).attr("href", "${root}/member/register.do");
			
			swal({ 
				  title: "BAD!",
				  text: "회원가입이 완료 되지 않았습니다.",
				  type: "error" 
				  },
				  function(){
					  window.location.href ="${root}/member/register.do";
				});
		</script>
	</c:if>

</body>
</html>