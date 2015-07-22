<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 삭제</title>
<script type="text/javascript" src="${root }/css/eventBoard/script.js"></script>
<link href="${root }/css/eventBoard/style.css" rel="stylesheet"/>
<script src="${root }/css/alertify.js-0.3.11/lib/alertify.min.js"></script>
<link rel="stylesheet" href="${root }/css/alertify.js-0.3.11/themes/alertify.core.css"/>
<script src="${root }/css/sweetalert-master/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/css/sweetalert-master/dist/sweetalert.css"/>
</head>
<body>
	
	<form method="post" action="${root}/eventBoard/delete.do" name="deleteForm">
		<input type="hidden" name="event_code" value="${event_code }"/>
		<input type="hidden" name="pageNumber" value="${pageNumber }"/>
		
		<script type="text/javascript">
			/* var input = alertify.confirm('삭제하시겠습니까?');
			
			if(input==true){
				document.deleteForm.submit();
			}
			if(input==false){
				//alert("gkgk");
				//var url=${root }+"/eventBoard/list.do";
				//alert(url);
				//location.href=url;
				var url="${root}/eventBoard/list.do";
				location.href=url;
			} */
			
			swal({   
				title: "삭제하시겠습니까?",   
				text: "You will not be able to recover this imaginary file!",   
				type: "warning",   
				showCancelButton: true,   
				confirmButtonColor: "#DD6B55",   
				confirmButtonText: "Yes, delete it!",   
				closeOnConfirm: false 
				}, 
				function(isConfirm){   
					if (isConfirm){     
						document.deleteForm.submit();
					}else{     
						var url="${root}/eventBoard/list.do";
						location.href=url;   
					} 
				});
			
		</script>
		
		
	</form>
</body>
</html>