<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function saveCourse(courseCode1, courseCode2){
		alert(courseCode1);
		alert(courseCode2);
	}
</script>
</head>
<body>

${placeDtoList[1].place_code}
<c:forEach var="list" items="${placeDtoList}">
	${list.place_name }
</c:forEach>

<input type="button" value="코스담기" onclick="saveCourse('${placeDtoList[0].place_code}','${placeDtoList[1].place_code}')">
</body>
</html>