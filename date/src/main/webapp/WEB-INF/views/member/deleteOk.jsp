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
</head>
<body>
	<c:remove var="id" scope="session"/>
	<%-- <c:remove var="memberLevel" scope="session"/> --%>
	
	<c:if test="${check==0 }">
		<script type="text/javascript">
			//alert("비밀번호가 틀립니다. 다시 입력해주세요.");
			//location.href="${root}/member/delete.jsp";
			//$(location).attr("href", "${root}/member/delete.do");
			swal({ 
					  title: "BAD!",
					  text: "비밀번호가 틀립니다. 다시 입력해주세요.",
					  type: "error" 
					  },
					  function(){
						  //$(location).attr("href", "${root}/member/delete.do");
						  location.href="${root}/member/delete.jsp";
					});
		</script>	
	</c:if>
	
	<c:if test="${check>0 }">
		<script type="text/javascript">
			//alert("회원탈퇴가 완료 되었습니다.");
			//location.href="${root}/start.jsp";
			//$(location).attr("href", "${root}/thisIndex.jsp");
			swal({ 
				  title: "GOOD!",
				  text: "회원탈퇴가 완료 되었습니다.",
				  type: "success" 
				  },
				  function(){
					  //$(location).attr("href", "${root}/thisIndex.jsp");
					  location.href="${root}/thisIndex.jsp";
				});
		</script>
	</c:if>

</body>
</html>