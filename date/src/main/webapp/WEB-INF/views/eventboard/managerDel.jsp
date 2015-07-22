<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="${root }/css/sweetalert-master/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/css/sweetalert-master/dist/sweetalert.css"/>
</head>
<body>
<%-- <h3>managerDel.jsp 이지롱</h3>
	<h4>group_number : ${group_number }</h4>
	<h4>sequence_number : ${sequence_number }</h4>
	<h4>sequence_level : ${sequence_level }</h4> --%>
	
	<form method="post" action="${root}/eventBoard/managerDel.do" name="deleteForm">
		<input type="hidden" name="event_code" value="${event_code }"/>
		<input type="hidden" name="join_code" value="${join_code }"/>
		<input type="hidden" name="eventPageNumber" value="${eventPageNumber }"/>
		<input type="hidden" name="pageNumber" value="${pageNumber }"/>
		<input type="hidden" name="group_number" value="${group_number }"/>
		<input type="hidden" name="sequence_number" value="${sequence_number }"/>
		<input type="hidden" name="sequence_level" value="${sequence_level }"/>
		
		<script type="text/javascript">
			/* var input = confirm('삭제하시겠습니까?');
			//alert(input);
			
			if(input==true){
				document.deleteForm.submit();
			}else{
				var url="${root}/eventBoard/managerList.do?event_code=${event_code}&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}&pageNumber=${pageNumber}";
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
						var url="${root}/eventBoard/managerList.do?event_code=${event_code}&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}&pageNumber=${pageNumber}";
						location.href=url;  
					} 
				});
			
		</script>
		
	</form>
</body>
</html>