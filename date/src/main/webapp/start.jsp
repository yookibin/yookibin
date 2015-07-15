<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="${root}/css/board/script.js"></script>


	<script type="text/javascript" src="${root }/css/jquery.js"></script>
</head>



<body>
	<a href="${root }">기본 제공 HomeController</a><br/><br/>
	<%-- <a href="${root }/memberboard/write.do">글쓰기</a> --%>
	<a id="writeA" href="" onclick="writeFun('${root}', '${nickName}')">글쓰기</a>

	<a href="${root }/memberboard/list.do">글목록</a>
	<br/><br/>
	
	<a href="${root }/eventBoard/list.do">이벤트 목록보기</a>
	<br/><br/>
	
	<a href="${root }/placesearch/choice.do">서울시 전체지도</a>
	<a href="${root}/mypage/mycourse.do">마이페이지</a>
	<br/><br/><br/>
 
	<c:if test="${id==null}">
		<a href="${root }/member/register.do">회원가입</a>
		<a href="${root }/member/login.do">로그인</a>
	</c:if>
	
	<c:if test="${id!=null}">
		<a href="${root }/member/logout.do">로그아웃</a>
		<a href="${root }/member/update.do?id=${id}">회원수정</a>
		<a href="${root }/member/delete.do">회원탈퇴</a>
		<br/><br/>
		
		<c:if test="${memberLevel=='AA'}">
			<a href="${root }/eventBoard/write.do">이벤트 추가하기(운영자만 가능한 기능)</a><br/>
		</c:if>
	</c:if><br/><br/>		

	<a href="${root }/placeBoard/boardList.do">장소게시판</a><br/>
	
	<hr> 
		<a href="${root }/recommandPlace/findPlace.do">장소추천</a>
<%-- 		<a href="${root }/recommandPlace/insertPlace.do">장소입력</a>
		<a href="${root }/recommandPlace/selectMap0.do"> Map</a>
		<a href="${root }/recommandPlace/selectMap.do">select Map</a>
		<a href="${root }/recommandPlace/selectMap2.do">select Map2</a>
		<a href="${root }/recommandPlace/selectMap3.do">지도에 선그리기</a> --%>
	<hr>
	
	<a href="${root}/randomplace/randomPlaceStart.do">랜덤시작></a>
	<a href="${root}/membermanager/memberManager.do">회원 관리</a>
	
	
		
</body>
</html>
