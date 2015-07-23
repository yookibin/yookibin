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

<link href="${root }/css/eventBoard/style.css" rel="stylesheet"/>
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
<div class="totalDiv">

	<jsp:include page="/TOP.jsp"/>
	
	<!-- eventBoard와 pageNumber를 넘겨줌 -->
	<c:set var="root" value="${pageContext.request.contextPath }"/>
	 <button style="margin-left:80%" type="button" class="btn btn-warning" align="middle" onclick="location.href='${root}/eventBoard/list.do?pageNumber=${pageNumber }'">글목록</button>
	 <div class="line7">
		<p class="orangeLine"></p>
	</div>
	 <div class="line7">
		<div class="centers">			
			<span id="readTitle">${eventBoard.event_title }</span>
		</div>
		
		<div class="centers">			
			<span style="widows:30%">${eventBoard.writer }ㅣ</span>			
			<span>${eventBoard.event_period }ㅣ</span>
			<span>조회</span>
			<span>${eventBoard.read_count }ㅣ</span>
			<span>${eventBoard.event_point}ㅣ</span>
			<span>${eventBoard.event_giveaway }ㅣ</span>
			<span>${eventBoard.event_progress }</span>			
		</div>
	</div>	
	
	<div class="line7">
		<p class="orangeLine"></p>
	</div>
	
	<div class="line2">
		<span>${eventBoard.event_content }</span>
	</div>
	<div class="line7">
		<p class="orangeLine"></p>
	</div>
	<div class="line7" style="text-align:center;">	
		<c:if test="${eventBoard.event_progress=='진행' }">
			<button type="button" class="btn btn-warning" onclick="enterFun('${root}','${eventBoard.event_code }','${pageNumber }','${eventBoard.event_point }')">참가하기</button>
		</c:if>
		<c:if test="${eventBoard.event_progress=='종료' }">
			<input size="25" style="text-align: center;" disabled="disabled" type="text" value="기간이 지난 이벤트 입니다."/>
		</c:if>
		
		<button type="button" class="btn btn-warning" onclick="location.href='${root}/eventBoard/list.do?pageNumber=${pageNumber }'">
			<span>글목록</span>
		</button>
		<br/><br/>
		<c:if test="${memberLevel=='AA' }">
			<p>
				<button type="button" class="btn btn-warning" onclick="updateFun('${root}','${eventBoard.event_code }','${pageNumber }')">
					<span>글수정</span>
				</button>
				<button type="button" class="btn btn-warning" onclick="delFun('${root}','${eventBoard.event_code }','${pageNumber }')">
					<span>글삭제</span>
				</button>
				<button type="button" class="btn btn-warning" onclick="manageFun('${root}','${eventBoard.event_code }','${eventBoard.group_number }','${eventBoard.sequence_number }','${eventBoard.sequence_level }','${pageNumber }')">
					<span>응모회원관리</span>
				</button>
			</p>
		</c:if>		
	</div>
	
</div>	 

</body>
</html>