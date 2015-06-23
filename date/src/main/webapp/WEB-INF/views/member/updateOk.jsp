<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script type="text/javascript" src="${root }/css/jquery.js"></script>
</head>
<body>
<c:set var="root" value="${pageContext.request.contextPath }"/>
	<c:if test="${check==0}">
		<script type="text/javascript">
			alert("수정이 실패하였습니다.");
			//location.href="${root}/member/update.do";
			$(location).attr("href", "${root}/member/update.do");
		</script>
	</c:if>
	
	<c:if test="${check>0 }">
		<script type="text/javascript">
			alert("수정이 완료되었습니다.");
			//location.href="${root}/member/main.do"
			$(location).attr("href", "${root}/member/main.do");
		</script>
	</c:if>

</body>
</html>