<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 삭제</title>
<script type="text/javascript" src="${root }/css/eventBoard/script.js"></script>
<link href="${root }/css/eventBoard/style.css" rel="stylesheet"/>
</head>
<body>
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	
	<form method="post" action="${root}/eventBoard/delete.do" name="deleteForm">
		<input type="hidden" name="event_code" value="${event_code }"/>
		<input type="hidden" name="pageNumber" value="${pageNumber }"/>
		
		<script type="text/javascript">
			var input = confirm('삭제하시겠습니까?');
			//alert(input);
			
			if(input==true){
				document.deleteForm.submit();
			}
			if(input==false){
				//alert("gkgk");
				//var url=${root }+"/eventBoard/list.do";
				//alert(url);
				//location.href=url;
			}
			
		</script>
		
		
	</form>
</body>
</html>