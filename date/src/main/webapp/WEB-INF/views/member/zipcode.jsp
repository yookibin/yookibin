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

<!-- Bootstrap Core CSS -->
    <link href="${root }/css/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${root }/css/bootstrap/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="${root }/css/bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="${root }/css/bootstrap/bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${root }/css/bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${root }/css/bootstrap/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<div style="padding: 20px 10px 10px 70px">
		<form action="${root }/member/zipcodeCheck.do" method="POST">
			<input type="text" class="form-control" name="dong"/>
			<input type="submit" class="btn btn-primary" value="검색"/>
		</form>

	
		<c:if test="${list==null }">
		<div style="padding: 50px 10px 10px 100px">
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
							<a class="aZip" href="javascript:sendAddress('${zipDto.zipcode }', '${zipDto.sido }', '${zipDto.gugun }', '${zipDto.dong }', '${zipDto.ri }', '${zipDto.bunji }')">
								${zipDto.zipcode } ${zipDto.sido } ${zipDto.gugun } ${zipDto.dong } ${zipDto.ri } ${zipDto.bunji }
							</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		</c:if> 
	</div>
	
</body>
</html>