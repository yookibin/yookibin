<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 수정</title>
	<script type="text/javascript" src="${root }/css/eventBoard/script.js"></script>
	<link rel="stylesheet" type="text/css" href="${root }/css/eventBoard/style.css"/>
</head>
<body>
<!-- updateAction에서 board와 (boardNumber는 board에 들어있음), pageNumber를 가져옴 -->	
	<form class="form_style" action="${root}/eventBoard/update.do" method="post" onsubmit="return checkForm()" enctype="multipart/form-data">
		<input type="hidden" name="event_code" value="${eventBoard.event_code }"/>
		<input type="hidden" name="pageNumber" value="${pageNumber }"/>
		
		<input type="hidden" name="event_fileName" value="${eventBoard.event_fileName }"/>
		<input type="hidden" name="event_filePath" value="${eventBoard.event_filePath }"/>
		<input type="hidden" name="event_fileSize" value="${eventBoard.event_fileSize }"/>
		
		<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root }/eventBoard/list.do?pageNumber=${pageNumber}">글목록</a>
		</div>
			
		<div class="line">
			<label class="title">작성자</label>
			<span class="content">
				<input type="text" name="writer" value="${eventBoard.writer }" />
			</span>
		</div>
		
		<div class="line">
			<label class="title">이벤트 기간</label>
			<span class="content"><input type="text" size="50" name="event_period" value="${eventBoard.event_period }"/></span>			
		</div>
		
		<div class="line">
			<label class="title">제목</label>
				<span class="content"><input type="text" size="50" name="event_title" value="${eventBoard.event_title }"/></span>
		</div>
		
		<div class="line" style="height:230px;">
			<label class="title" style="height:230px;">내용</label>
			<span class="content" style="height:230px;">
				<textarea rows="14" cols="58" name="event_content">${eventBoard.event_content }</textarea>
			</span>
		</div>
		
		<div class="line">
			<label class="title">파일명</label>
			<span class="content">		
				<c:if test="${eventBoard.event_fileName==null }">
					<input type="file" name="file"/>
				</c:if>		
				<c:if test="${eventBoard.event_fileName!=null }">
					${eventBoard.event_fileName }<input type="file" name="file"/>	
				</c:if>		
			</span>
		</div>
		
		<div class="line" style="width:598px; border-width:2px; text-align:center;">
			<input type="submit" value="글수정"/>
			<input type="reset" value="취소"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/eventBoard/list.do?pageNumber=${pageNumber}'">
		</div>
	</form>
</body>
</html>