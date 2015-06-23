<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<body>
	<c:remove var="id" scope="session"/>
	<%-- <c:remove var="memberLevel" scope="session"/> --%>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	<c:if test="${check==0 }">
		<script type="text/javascript">
			alert("비밀번호가 틀립니다. 다시 입력해주세요.");
			//location.href="${root}/member/delete.jsp";
			$(location).attr("href", "${root}/member/delete.do");
		</script>	
	</c:if>
	
	<c:if test="${check>0 }">
		<script type="text/javascript">
			alert("회원탈퇴가 완료 되었습니다.");
			location.href="${root}/start.jsp";
			$(location).attr("href", "${root}/start.jsp");
		</script>
	</c:if>

</body>
</html>