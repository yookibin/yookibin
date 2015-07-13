<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link style=""></link>
<style type="text/css">
 {font-family: Helvetica Neue, Arial, sans-serif; } 


h1, div { text-align: center; }

body {
	width:1200px ; height:620px; 
	background-image: linear-gradient(#aaa 25%, #000);}

.racetimes  { text-align: center; }

h1 { text-align: center; }

.racetimes {border-collapse: collapse;  width: 70%; margin: 100px; padding:50px; }

#firstrow, .column { padding: 1.5rem; font-size: 1.3rem; }


.row {
	border: 0px solid red;
	background: hsl(50, 50%, 80%);
}

.row, .column { transition: .4s ease-in; } 

#firstrow {	border: 0px solid red;
			background: hsla(12, 100%, 40%, 0.5); 
		   	}

.row:nth-child(even) { background: hsla(50, 50%, 80%, 0.7); }

.column:empty {background: hsla(50, 25%, 60%, 0.7); }

.row:hover:not(#firstrow), .row:hover .column :empty {background: #ff0; pointer-events: visible;}
.row:hover:not(#firstrow) { transform: scale(1.2); font-weight: 700; box-shadow: 0px 3px 7px rgba(0, 0, 0, 0.5);}



.container {

  display: table;

}

.row {

  display: table-row;
}

.column {

  display: table-cell;

}

</style>
<title>Insert title here</title>
</head>
<body>

	
<h1>Using Point </h1>

<div class="racetimes">

	

	<div  class="row" id="firstrow">
	 
		<div class="column">날짜 </div>
		<div class="column">포인트 사용 내역</div>
		<div class="column">내역  </div>
		<div class="column">포인트 </div>
		
	</div>
	
	<c:forEach var="dto" items="${mypageDto}">
	<div class="row" >
	
		<div class="column">SAIT Open</div>
		<div class="column">${dto.point_content}</div>
		<div class="column">${dto.point_manage}</div>
		<div class="column">${dto.point_total}</div>
		
	</div>
	</c:forEach>



</div>


</body>
</html>