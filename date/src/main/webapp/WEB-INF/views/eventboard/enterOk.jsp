<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check>0 }">
		<script type="text/javascript">
			alert("응모되었습니다.");
			location.href="${root}/eventBoard/list.do?pageNumber=${pageNumber}";
		</script>
	</c:if>
	
	<c:if test="${check==0 }">
		<c:if test="${firstCheck==0 }">
			<script type="text/javascript">
			alert("응모에 실패하였습니다. 다시 시도해주세요.");
			location.href="${root}/eventBoard/list.do?pageNumber=${pageNumber}";
			</script>
		</c:if>
		
		<c:if test="${firstCheck!=0 }">
			<script type="text/javascript">
				alert("이벤트에는 한 번만 응모가 가능합니다.");
				location.href="${root}/eventBoard/list.do?pageNumber=${pageNumber}";
			</script>
		</c:if>
		
	</c:if>	
</body>
</html>