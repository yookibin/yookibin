<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 읽기</title>

<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript">
	
	function delFun(root, event_code, pageNumber){
		var url=root+"/eventBoard/delete.do?event_code="+event_code+"&pageNumber="+pageNumber;
		//alert(url);
		
		location.href=url;
	}
	
	function updateFun(root, event_code, pageNumber){
		var url=root+"/eventBoard/update.do?event_code="+event_code+"&pageNumber="+pageNumber;
		//alert(url);
		
		location.href=url;
	}
	
	function enterFun(root, event_code, pageNumber,event_point){
		var url=root+"/eventBoard/enter.do?event_code="+event_code+"&pageNumber="+pageNumber+"&event_point="+event_point;
		//alert(url);
		
		location.href=url;
	}
	
	function manageFun(root, event_code,group_number,sequence_number,sequence_level,pageNumber){
		var url=root+"/eventBoard/managerList.do?event_code="+event_code+"&group_number="+group_number+"&sequence_number="+sequence_number+"&sequence_level="+sequence_level+"&pageNumber="+pageNumber;
		//alert(url);
		
		location.href=url;
	}

</script>
</head>

<body>
	<!-- eventBoard와 pageNumber를 넘겨줌 -->
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	
	<div>
		<span>글번호</span>
		<span>${eventBoard.event_code }</span>		
	</div>
	
	<div>
		<span>조회수</span>
		<span>${eventBoard.read_count }</span>		
	</div>
	
	<div>
		<span>작성자</span>
		<span>${eventBoard.writer }</span>		
	</div>
	
	<div>
		<span>이벤트 기간</span>
		<span>${eventBoard.event_period }</span>		
	</div>
	
	<div>
		<span>차감포인트</span>
		<span>${eventBoard.event_point }</span>		
	</div>
	
	<div>
		<span>경품</span>
		<span>${eventBoard.event_giveaway }</span>		
	</div>
	
	<div>
		<span>제목</span>
		<span>${eventBoard.event_title }</span>		
	</div>
	
	<div>
		<span>진행상황</span>
		<span>${eventBoard.event_progress }</span>		
	</div>
	
	<div>
		<span>글내용</span>
		<span>${eventBoard.event_content }</span>		
	</div>
	
	<div>
		<c:if test="${memberLevel=='AA' }">
			<input type="button" value="글수정" onclick="updateFun('${root}','${eventBoard.event_code }','${pageNumber }')" />
			<input type="button" value="글삭제" onclick="delFun('${root}','${eventBoard.event_code }','${pageNumber }')"/>
			<input type="button" value="응모회원관리" onclick="manageFun('${root}','${eventBoard.event_code }','${eventBoard.group_number }','${eventBoard.sequence_number }','${eventBoard.sequence_level }','${pageNumber }')"/><br/>
			
		</c:if>
		
 		<c:if test="${eventBoard.event_progress=='진행' }">
			<input type="button" value="참가하기" onclick="enterFun('${root}','${eventBoard.event_code }','${pageNumber }','${eventBoard.event_point }')"/>
		</c:if>
		<c:if test="${eventBoard.event_progress=='종료' }">
			<input type="text" value="기간이 지난 이벤트 입니다."/>
		</c:if>
		
		<input type="button" value="글목록" onclick="location.href='${root}/eventBoard/list.do?pageNumber=${pageNumber }'"/>
	</div>
		
</body>
</html>