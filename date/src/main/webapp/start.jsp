<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> 
	<a href="${root }">기본 제공 HomeController</a><br/><br/>
	
	<a href="${root }/memberboard/write.do">글쓰기</a>
	<a href="${root }/memberboard/list.do">글목록</a>

	<c:if test="${id==null}">
		<a href="${root }/member/register.do">회원가입</a>
		<a href="${root }/member/login.do">로그인</a>
	</c:if>
	
	<c:if test="${id!=null}">
		<a href="${root }/member/logout.do">로그아웃</a>
		<a href="${root }/member/update.do?id=${id}">회원수정</a>
		<a href="${root }/member/delete.do">회원탈퇴</a>
		
		<%-- <c:if test="${memberLevel=='AA' }">
			<a href="">회원관리</a>
		</c:if> --%>
	</c:if><br/><br/>
	
	<a href="${root }/placeBoard/boardList.do">장소게시판</a>
</body>
</html>