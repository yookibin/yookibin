<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${root }/css/eventBoard/style.css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="${root }/css/sweetalert-master/dist/sweetalert.css"/>
<script type="text/javascript">
	function managerDelFun(root, join_code, event_code, eventPageNumber, pageNumber,group_number,sequence_number,sequence_level){
		var url=root+"/eventBoard/managerDel.do?join_code="+join_code+"&event_code="+event_code+"&eventPageNumber="+eventPageNumber+"&pageNumber="+pageNumber+"&group_number="+group_number+"&sequence_number="+sequence_number+"&sequence_level="+sequence_level;
		//alert(url);		
		location.href=url;
	}
</script>

</head>
<body>	
<div class="totalDiv">

	<jsp:include page="/TOP.jsp"/>
	
	<!-- eventBoard와 pageNumber를 넘겨줌 -->
	
	 <input style="margin-left:80%" type="button" align="middle" value="글목록" onclick="location.href='${root}/eventBoard/managerList.do?eventPageNumber=${eventPageNumber }&pageNumber=${pageNumber }&event_code=${event_code }&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}'"/>
	 <div class="line7">
		<p class="orangeLine"></p>
	</div>
	 <div class="line7">
		<div class="centers">			
			<span id="readTitle">${eventMember.join_title }</span>
		</div>
		
		<div class="centers">			
			<span style="widows:30%">${eventMember.join_writer }</span>					
		</div>
	</div>	
	
	<div class="line7">
		<p class="orangeLine"></p>
	</div>
	
	<div class="line6">
		<span>${eventMember.join_content }</span>
	</div>
	<div class="line7">
		<p class="orangeLine"></p>
	</div>
	<div class="line2" style="text-align:center; height:100px;">	
		<button type="button" class="btn btn-warning" onclick="managerDelFun('${root}','${eventMember.join_code }','${eventMember.event_code }','${eventPageNumber }','${pageNumber }','${group_number }','${sequence_number }','${sequence_level }')">
			<span>글삭제</span>
		</button>
		<button type="button" class="btn btn-warning" onclick="location.href='${root}/eventBoard/managerList.do?eventPageNumber=${eventPageNumber }&pageNumber=${pageNumber }&event_code=${event_code }&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}'">
			<span>글목록</span>
		</button>			
	</div>
	<jsp:include page="/Bottom.jsp"/>	
</div>	
</body>
</html>