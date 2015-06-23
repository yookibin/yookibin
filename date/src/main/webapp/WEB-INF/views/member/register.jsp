<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="${root }/css/member/script.js"></script>
<script type="text/javascript" src="${root }/css/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/css/member/style.css" />
</head>
<body>
	
	<div align="center">
		<font size="2"><b>회원가입(*필수입력사항입니다.)</b></font>
	</div>

	<div align="center">
		<form class="form_style" name="memberForm" action="${root }/member/register.do" method="post" onsubmit="return registerForm(this)">
			<div class="line">
				<label class="title">아이디</label>
				<span class="content">
					*<input type="text" name="id" />	
					<input type="button" value="아이디중복" onclick="idCheck(memberForm, '${root}')" />
				</span>
			</div>
		
			<div class="line">
				<label  class="title">비밀번호</label>
				<span class="content">
					*<input type="password" name="pw" />
				</span>
			</div>
			
			<div class="line">
				<label class="title">비밀번호확인</label>
				<span class="content">
					*<input type="password" name="passwordCheck"/>
				</span>
			</div>
			
			<div class="line">
				<label class="title">닉네임</label>
				<span class="content">
					*<input type="text" name="nickName" />	
					<input type="button" value="닉네임중복" onclick="nickNameCheck(memberForm, '${root}')" />
				</span>
			</div>
			
			<!-- <div class="line">
				<label class="title">이름</label>
				<span class="content">
					*<input type="text" name="name"/>
				</span>
			</div> -->
			
			<div class="line">
				<label class="title">나이</label>
				<span class="content">
					<input type="text" name="age" size="25" />
				</span>
			</div>
			
			
			<!-- <div class="line">
				<label class="title">이메일</label>
				<span class="content">
					<input type="text" name="email" size="25" />
				</span>
			</div> -->
			
			<div class="line">
				<label class="title">휴대폰번호</label>
				<span class="content">
					<input type="text" name="phone" size="25" />
				</span>
			</div>
			
			<div class="line">
				<label class="title">생년월일</label>
				<span class="content">
					<select name="year" >
						<option></option>
						<c:forEach var="i" begin="1988" end="2006">
							<c:if test="${i==1996 }">
								<option value="${i}" selected>${i}</option>	
							</c:if>
							<c:if test="${i!=1996 }">
								<option value="${i}">${i}</option>	
							</c:if>
							
						</c:forEach>
					</select>
					
					<select name="month">
						<option></option>
						<c:forEach var="i" begin="1" end="12">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select>
					
					<select name="day">
						<option></option>
						<c:forEach var="i" begin="1" end="31">
							<option value="${i}">${i}</option>
						</c:forEach>
					</select> 
					<input type="hidden" name="birthday"/>
					
				</span>
			</div>
			
			<div class="line">
				<label class="title">우편번호</label>
				<span class="content">
					<input type="text" name="zipcode" />
					<input type="button" value="우편번호검색" onclick="zipcodeCheck(memberForm, '${root}')"/>
				</span>
		  	</div>
			
			<div class="line">
				<label class="title">주소</label>
				<span class="content">
					<input type="text" name="addr" size="48" />
				</span>
			</div>
			
			
			
			<div class="line" style="width:498px; border-width:2px; text-align:center;">
				<input type="submit" value="가입" />
				<input type="reset" value="취소" />
			</div>
		</form>
	</div>
</body>
</html>