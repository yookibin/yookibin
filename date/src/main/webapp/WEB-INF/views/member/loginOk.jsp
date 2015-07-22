<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script src="${root }/css/sweetalert-master/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/css/sweetalert-master/dist/sweetalert.css"/>
<script type="text/javascript" src="${root }/css/jquery.js"></script>
</head>
<body>
	
	<c:if test="${id !=null }">
		<c:set var="id" value="${id }" scope="session"/>
		<c:set var="nickName" value="${nickName}" scope="session"/>
		<c:set var="memberLevel" value="${memberLevel}" scope="session"/>
		
		
		<script type="text/javascript">
			//alert("로그인 성공");
			
			//location.href="${root}/thisIndex.jsp";
			//$(location).attr("href", "${root}/member/main.do");
			swal({ 
				  title: "GOOD!",
				  text: "로그인 성공",
				  type: "success" 
				  },
				  function(){
				    window.location.href ="${root}/thisIndex.jsp";
				});
		</script>
	</c:if>
	
 	<c:if test="${id==null }">
		<script>
			//alert("입력하신 정보가 존재하지 않습니다.");
			//$(location).attr("href", "${root}/member/login.do");
			
			swal({ 
				  title: "BAD!",
				  text: "입력하신 정보가 존재하지 않습니다.",
				  type: "error" 
				  },
				  function(){
					  window.location.href ="${root}/member/login.do";
				});
		</script>
	</c:if> 

</body>
</html>