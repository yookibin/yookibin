<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 
	<form class="form_style" method="post" action="${root}/eventBoard/join.do" name="joinForm">
		<div class="line">
			<label class="title">현재 잔여 포인트</label>
			<span class="content"></span>
		</div>
		
	 	<div class="line" style="width:598px; border-width:2px; text-align:center;">
			<input type="submit" value="글쓰기"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/eventBoard/list.do'"/>
		</div>
	</form>

</body>
</html>