<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function managerDelFun(root, join_code, event_code, eventPageNumber, pageNumber,group_number,sequence_number,sequence_level){
		var url=root+"/eventBoard/managerDel.do?join_code="+join_code+"&event_code="+event_code+"&eventPageNumber="+eventPageNumber+"&pageNumber="+pageNumber+"&group_number="+group_number+"&sequence_number="+sequence_number+"&sequence_level="+sequence_level;
		//alert(url);
		
		location.href=url;
	}
</script>

</head>
<body>	
<%-- 	<h4>group_number : ${group_number }</h4>
		<h4>sequence_number : ${sequence_number }</h4>
		<h4>sequence_level : ${sequence_level }</h4> --%>
	
		<div>
			<span>글번호</span>
			<span>${eventMember.join_code }</span>		
		</div>
		
		<div>
			<span>작성자</span>
			<span>${eventMember.join_writer }</span>		
		</div>
	
		<div>
			<span>제목</span>
			<span>${eventMember.join_title }</span>		
		</div>
		
		<div>
			<span>글내용</span>
			<span>${eventMember.join_content }</span>		
		</div>
		
		<div>
			<input type="button" value="글삭제" onclick="managerDelFun('${root}','${eventMember.join_code }','${eventMember.event_code }','${eventPageNumber }','${pageNumber }','${group_number }','${sequence_number }','${sequence_level }')"/>			
			<input type="button" value="글목록" onclick="location.href='${root}/eventBoard/managerList.do?eventPageNumber=${eventPageNumber }&pageNumber=${pageNumber }&event_code=${event_code }&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}'"/>	
		</div>
	
</body>
</html>