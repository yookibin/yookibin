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
	<h4>group_number : ${group_number }</h4>
	<h4>sequence_number : ${sequence_number }</h4>
	<h4>sequence_level : ${sequence_level }</h4>
	
	<table border="1" width="510" cellpadding="2"  cellspacing="0" align="center">
		<tr>
			<td align="center"  height="20" width="125">글번호</td>
			<td align="center"  height="20" width="125">${eventMember.join_code }</td>
			
			<td align="center"  height="20" width="125">작성자</td>
			<td align="center"  height="20" width="125">${eventMember.join_writer }</td>
		</tr>
		
		<tr>
			<td align="center"  height="20" width="125">제목</td>
			<td align="center"  height="20" width="125">${eventMember.join_title }</td>
		</tr>
		
		<tr>
			<td align="center"  height="200" width="125">글내용</td>
			<td valign="top"  height="200" colspan="3" align="center">
<%-- 				<c:if test="${eventMember.join_fileSize!=0 }">												
					<img src="${root}/resources/eventBoard/${eventMember.join_filePath }" width="200" height="200"/><br/>						
					${eventMember.join_filePath }														
				</c:if>	<br/>	 --%>		
				${eventMember.join_content }
			</td>
		</tr>

		<tr>
			<td height="30" colspan="4" align="center">
				<input type="button" value="글삭제" onclick="managerDelFun('${root}','${eventMember.join_code }','${eventMember.event_code }','${eventPageNumber }','${pageNumber }','${group_number }','${sequence_number }','${sequence_level }')"/>			
				<input type="button" value="글목록" onclick="location.href='${root}/eventBoard/managerList.do?eventPageNumber=${eventPageNumber }&pageNumber=${pageNumber }&event_code=${event_code }&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}'"/>
			</td>
		</tr>
	</table>
</body>
</html>