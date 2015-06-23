<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 글쓰기</title>
	<script type="text/javascript" src="${root}/css/board/script.js"></script>
	<link rel="stylesheet" type="text/css" href="${root}/css/board/style.css"/>
</head>
<body>
	${nickName}
	<form class="form_style"  action="${root }/memberboard/write.do"  method="post" onsubmit="return checkForm(this)">	
		<%-- <input type="hidden" name="boardNumber" value="${boardNumber}"/> --%>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		<input type="hidden" name="board_writer" value="${nickName}"/>
			
		<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root}/board/list.do">글목록</a>
		</div>
			
		
		
		<div class="line">
			<label class="title">제목</label>
				<span class="content"><input type="text" size="50" name="board_title"/></span>
		</div>
		
		<div class="line">
			<label class="title">파일첨부</label>
		</div>
		
		<div class="line" style="height:230px;">
			<label class="title" style="height:230px;">내용</label>
			<span class="content" style="height:230px;">
				<textarea rows="14" cols="58" name="board_content"></textarea>
			</span>
		</div>
		
		
		<div class="line" style="width:598px; border-width:2px; text-align:center;">
			<input type="submit" value="확인"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/board/list.do'"/> 
		</div>
		
	</form>
</body>
</html>