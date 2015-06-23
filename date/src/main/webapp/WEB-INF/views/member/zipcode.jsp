<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우편번호</title>
<script type="text/javascript" src="${root }/css/member/script.js"></script>
<script type="text/javascript" src="${root }/css/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="${root }/css/member/style.css"/>
<script type="text/javascript">
/* function zipcode(zipcode, address){
	//alert(address);
 	opener.memberForm.zipcode.value=zipcode;
	opener.memberForm.address.value=address; 
} */


</script>

</head>
<body>
	
	<form action="${root }/member/zipcodeCheck.do" method="POST">
		<input type="text" name="dong"/>
		<input type="submit" value="검색"/>
	</form>

	
	<c:if test="${list==null }">
	<div align="center">
		다시검색해주세요.
	</div>
	</c:if>
	
	<c:if test="${list!=null }">
	<div align="center">
		<table>
			<c:forEach begin="0" end="${list.size() }" var="zipDto" items="${list }">
				<tr>
					<%-- <c:set var="address" value="${zipDto.sido } ${zipDto.gugun } ${zipDto.dong } ${zipDto.ri } ${zipDto.bunji }"/> --%>
					<td>
						<a href="javascript:sendAddress('${zipDto.zipcode }', '${zipDto.sido }', '${zipDto.gugun }', '${zipDto.dong }', '${zipDto.ri }', '${zipDto.bunji }')">
							${zipDto.zipcode } ${zipDto.sido } ${zipDto.gugun } ${zipDto.dong } ${zipDto.ri } ${zipDto.bunji }
						</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	</c:if> 
	
</body>
</html>