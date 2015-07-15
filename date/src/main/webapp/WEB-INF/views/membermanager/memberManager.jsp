<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<style type="text/css">
#memberManager{
	width: 1100px;
	height: 1200px;
}
.member{
	float:left;
	border: 0px solid #F05F40;
	font-size:15px;
}

</style>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<script type="text/javascript">
	function memberDelete(root,id){
		var check=confirm("정말로 삭제하시겠습니까?");
		if(check==true){
			location.href=root+"/membermanager/memberManagerDelete.do?id="+id;
		}else if(check==false){
			return false;
		}
	}
	
	function memberUpdate(id){
		
		$("#"+id).css("display","none");
		$("."+id+"update").css("display","block");
		
	}
	
	function memberUpdateOk(root,id){
		var member_level=$("#"+id+"name").val();
		var check=confirm("정말로 수정하시겠습니까?");
		if(check==true){
			location.href=root+"/membermanager/memberManagerUpdate.do?member_level="+member_level+"&id="+id;
		}else if(check==false){
			return false;
		}
	}
	
	function memberUpdateNo(id){
		$("#"+id).css("display","block");
		$("."+id+"update").css("display","none");
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="memberManager">
		<c:forEach var="member" items="${list}" varStatus="status">
			<div id="${member.id}div" style="float: left">
				<div class="member">아이디 : ${member.id}&nbsp;&nbsp;</div>
				<div class="member">비밀번호 : ${member.pw}&nbsp;&nbsp;</div>
				<div class="member">이름 : ${member.nickName}&nbsp;&nbsp;</div>
				<div class="member">전화번호 : ${member.phone}&nbsp;&nbsp;</div>
				<div class="member">우편번호 : ${member.zipcode}&nbsp;&nbsp;</div>
				<div class="member">집주소 : ${member.addr}&nbsp;&nbsp;</div>
				<div class="member">생년월일 : ${member.birthday}&nbsp;&nbsp;</div>
				<div id="${member.id}" class="member">회원등급 : ${member.member_level}&nbsp;&nbsp;</div>
				<input type="text" value="${member.member_level}" class="${member.id}update" id="${member.id}name" style="display:none; float:left">
				<input type="button" value="수정" onclick="memberUpdateOk('${root}','${member.id}')" class="${member.id}update" style="display:none; float:left">
				<input type="button" value="취소" onclick="memberUpdateNo('${member.id}')" class="${member.id}update" style="display:none; float:left">
				<a href="javascript:memberUpdate('${member.id}')">등급수정</a>
				<a href="javascript:memberDelete('${root}','${member.id}')">삭제</a>
			</div>
		</c:forEach>
	</div>

</body>
</html>