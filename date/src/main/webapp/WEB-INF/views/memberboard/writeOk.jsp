<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>

<!-- 현재상태: 디비에는 들어가고 mav에 담기전에도 check값 1이 찍힘/ 자바스크립트가 안먹는듯 ..? -->
	
<c:if test="${check>0}">
		<script type="text/javascript">
			location.href="${root}/memberboard/list.do?pageNumber=${pageNumber}";
			// 나중에 read로 이동하게 해야함.
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			location.href="${root}/memberboard/write.do?pageNumber=${pageNumber}";
			
		</script>
	</c:if>

</body>
</html>