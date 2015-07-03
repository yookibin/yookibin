<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 삭제</title>
	<script type="text/javascript" src="${root }/css/board/script.js"></script>
	<link rel="stylesheet" type="text/css" href="${root }/css/board/style.css"/>
</head>
<body>
	${board_num } ${pageNumber }
	<form method="post" action="${root }/board/deleteOk.do">
		<input type="hidden" name="board_num" value="${board_num}"/>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		<table border="1" width="300" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td align="center" bgcolor="D1DBDB">
					비밀번호 입력해주세요.
				</td>
			</tr>
			
			<tr>
				<td align="center">비밀번호
					<input type="password" name="password" size="8" maxlength="12"/>
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<input type="submit" value="글삭제"/>
					<input type="button" value="목록보기" onclick="location.href='${root}/board/list.do?pageNumber=${pageNumber}'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>