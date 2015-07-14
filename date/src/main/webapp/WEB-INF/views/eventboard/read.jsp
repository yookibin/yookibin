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
	 
	 <div class="board_boarder">
		<div class="board_title_list yaja_board_text">
			<h3>이벤트 게시판</h3>
		</div>
		
		<div class="board_read">
			<div class="borad_read_title">
				<p class="read_title">${eventBoard.event_title }</p>
				<ul>
					<li>
						<span>${eventBoard.writer }</span>
						<span class="read_bar">|</span>
					</li>
					<li class="board_read_title_etc">
						<span>${eventBoard.event_period }</span>
						<span class="read_bar">|</span>
					</li>
					<li class="board_read_title_etc">
						<span>${eventBoard.read_count }</span>
						<span class="read_bar">|</span>
					</li>
					<li class="board_read_title_etc">
						<span>${eventBoard.event_point }</span>
						<span class="read_bar">|</span>
					</li>
					<li class="board_read_title_etc">
						<span>${eventBoard.event_giveaway }</span>
						<span class="read_bar">|</span>
					</li>
					<li class="board_read_title_etc">
						<span>${eventBoard.event_progress }</span>
						<span class="read_bar">|</span>
					</li>
				</ul>
			
			</div>
			<div class="board_read_content">
				<span>${eventBoard.event_content }</span>	
			</div>
			<div class="board_nav">
				<ul>
					<li>
						<c:if test="${eventBoard.event_progress=='진행' }">
							<button type="button" class="" onclick="enterFun('${root}','${eventBoard.event_code }','${pageNumber }','${eventBoard.event_point }')">참가하기</button>
						</c:if>
						<c:if test="${eventBoard.event_progress=='종료' }">
							<input type="text" value="기간이 지난 이벤트 입니다."/>
						</c:if>
					</li>
					<li>
						<button type="button" class="" onclick="location.href='${root}/eventBoard/list.do?pageNumber=${pageNumber }'">
							<span>글목록</span>
						</button>
					</li>
				</ul>
				<c:if test="${memberLevel=='AA' }">
					<p>
						<button type="button" class="" onclick="updateFun('${root}','${eventBoard.event_code }','${pageNumber }')">
							<span>글수정</span>
						</button>
						<button type="button" class="" onclick="delFun('${root}','${eventBoard.event_code }','${pageNumber }')">
							<span>글삭제</span>
						</button>
						<button type="button" class="" onclick="manageFun('${root}','${eventBoard.event_code }','${eventBoard.group_number }','${eventBoard.sequence_number }','${eventBoard.sequence_level }','${pageNumber }')">
							<span>응모회원관리</span>
						</button>
					</p>
				</c:if>
			</div>
		</div>
		
	</div>
</body>
</html>