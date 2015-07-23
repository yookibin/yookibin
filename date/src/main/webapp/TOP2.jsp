<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.AllAll {
	width: 1100px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
}

.menu-A {
	width: 1100px;
	height: 100px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 20px;
}

.menu-B {
	width: 1100px;
	height: 30px;
	/* margin-left: auto; */
	/* margin-right: 230px; */
	/* margin-top: 20px; */
	text-align: right;
}

.menu-Aa {
	float: left;
	width: 175px;
}

.menu-Aaa {
	margin: 0 0 3px 67px;
}
</style>
</head>
<body>
	<div class="AllAll">
		<div class="menu-Aa" style="margin: 0 0 0 20px;">
				<a href="${root}/thisIndex.jsp"> <img alt="" src="${root}/resources/main/logo.png"
					width="200" height="95">
				</a>
			</div>

		<c:if test="${id==null}">
			<div class="menu-B">
				<div
					style="width: 70px; height: 40px; float: right; margin: 10px 30px 0 0; font-size: 16px; color: #D2916C;">
					<span> <a href="${root }/member/register.do"
						style="color: #D2916C;">회원가입</a>
					</span>
				</div>
				<div
					style="width: 50px; height: 40px; float: right; margin: 10px 0 0 0; font-size: 16px; color: #D2916C;">
					<span> <a href="${root }/member/login.do"
						style="color: #D2916C;">로그인</a>
					</span>
				</div>
			</div>
		</c:if>

		<c:if test="${id!=null}">
			<div class="menu-B">
				<div
					style="width: 70px; height: 40px; float: right; margin: 10px 30px 0 0; font-size: 16px; color: #D2916C;">
					<span> <a href="${root }/member/logout.do"
						style="color: #D2916C;">로그아웃</a>
					</span>
				</div>
				<div
					style="width: 70px; height: 40px; float: right; margin: 10px 0 0 0; font-size: 16px; color: #D2916C;">
					<span> <a href="${root }/member/update.do?id=${id}"
						style="color: #D2916C;">회원수정</a>
					</span>
				</div>
				<div
					style="width: 70px; height: 40px; float: right; margin: 10px 0 0 0; font-size: 16px; color: #D2916C;">
					<span> <a href="${root }/member/delete.do"
						style="color: #D2916C;">회원탈퇴</a>
					</span>
				</div>
				<div
					style="width: 80px; height: 40px; float: right; margin: 10px 0 0 0; font-size: 16px; color: #D2916C;">
					<span> <a href="${root}/mypage/mycourse.do"
						style="color: #D2916C;">마이페이지</a>
					</span>
				</div>
				<c:if test="${memberLevel=='AA'}">
					<div
						style="width: 85px; height: 40px; float: right; margin: 10px 0 0 0; font-size: 16px; color: #D2916C;">
						<span> <a href="${root }/eventBoard/write.do"
							style="color: #D2916C;">이벤트추가</a>
						</span>
					</div>
					<div
						style="width: 70px; height: 40px; float: right; margin: 10px 0 0 0; font-size: 16px; color: #D2916C;">
						<span> <a href="${root }/recommandPlace/insertM.do"
							style="color: #D2916C;">장소추가</a>
						</span> <br />
					</div>
				</c:if>
			</div>
			<%-- v style="width: 100px; height: 40px; float: right;">
				<c:if test="${memberLevel=='AA'}">
					<div style="width: 100px; height: 40px; float: right;">
						<a href="${root }/eventBoard/write.do"><img alt=""
							src="${root}/resources/main/event.png" width="85" height="30"></a>
					</div>
					<div style="width: 100px; height: 40px; float: right;">
						<a href="${root }/recommandPlace/insertM.do"><img alt=""
							src="${root}/resources/main/place.png" width="70" height="30"></a>
						<br />
					</div>
				</c:if>
			</div> --%>
		</c:if>
	</div>
</body>
</html>