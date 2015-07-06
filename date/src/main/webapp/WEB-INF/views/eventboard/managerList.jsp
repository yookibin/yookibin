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
<script type="text/javascript">
	function randomFun(root, event_code, group_number, sequence_number, sequence_level, pageNumber, count){
		//alert("하하하 랜덤추첨!!");
		var num=prompt("현재 응모회원수 : "+count+"\n몇 명의 당첨자?","");
		//alert(num);
		
		if(num!=null&&num!=""&&count>=num){
			var url=root+"/eventBoard/write.do?event_code="+event_code+"&group_number="+group_number+"&sequence_number="+sequence_number+"&sequence_level="+sequence_level+"&pageNumber="+pageNumber+"&num="+num;
			location.href=url;
		}
	}
</script>
</head>
<body>
<a href="${root}/eventBoard/list.do?pageNumber=${pageNumber}">이벤트list로 가기</a><br/>
<input type="button" value="발표 글 쓰기" onclick="randomFun('${root }','${event_code}','${group_number }','${sequence_number }','${sequence_level }','${pageNumber }','${count }')" />
<br/><br/>

	<c:if test="${count==0 }">		
		<h4>해당 이벤트에 참가한 글이 없습니다.</h4>		
	</c:if>

	<c:if test="${count!=0 }">		

			<h4>이벤트 번호 : ${event_code }</h4><br/>
			<h4>group_number : ${group_number }</h4>
			<h4>sequence_number : ${sequence_number }</h4>
			<h4>sequence_level : ${sequence_level }</h4>
	
			<!-- Board List -->
			<c:forEach var="eventMember" items="${list }">
			
				${eventMember.join_code }
				
	<%-- 		<c:if test="${eventMember.join_fileSize!=0 }">											
					<img src="${root}/resources/eventBoard/${eventMember.join_filePath }" width="150" height="150"/>						
					${eventMember.join_filePath }		
				</c:if> --%>
				
				<a href="${root }/eventBoard/managerRead.do?join_code=${eventMember.join_code }&eventPageNumber=${eventPageNumber}&event_code=${eventMember.event_code}&pageNumber=${pageNumber}&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}">${eventMember.join_title }</a>		
				${eventMember.id }			
				${eventMember.join_writer }		
				<br/><br/>
			</c:forEach>
		
		<br/><br/>
		
	</c:if>



<!-- 페이지 번호 -->
	<center>
		<c:if test="${count>0 }">
			<c:set var="pageBlock" value="${1 }"/>
			
			<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0?0:1) }"/>
			
			<fmt:parseNumber var="rs" value="${(eventPageNumber-1)/pageBlock }" integerOnly="true"/>
			<c:set var="startPage" value="${rs*pageBlock+1 }"/>
			
			<c:set var="endPage" value="${startPage+pageBlock-1}"/>
			<c:if test="${endPage>pageCount}">
				<c:set var="endPage" value="${pageCount }"/>
			</c:if>
			
			<!--------------------------------------------------------------->
			<c:if test="${startPage>pageBlock }">
				<a href="${root}/eventBoard/managerList.do?eventPageNumber=${startPage-pageBlock}&pageNumber=${pageNumber}&event_code=${event_code}&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1" >
				<a href="${root}/eventBoard/managerList.do?eventPageNumber=${i}&pageNumber=${pageNumber}&event_code=${event_code}&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}">[${i }]</a>
			</c:forEach>
			
			<c:if test="${endPage<pageCount }">
				<a href="${root}/eventBoard/managerList.do?eventPageNumber=${startPage+pageBlock}&pageNumber=${pageNumber}&event_code=${event_code}&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}">[다음]</a>
			</c:if>
			
		</c:if>
	</center> 
</body>
</html>