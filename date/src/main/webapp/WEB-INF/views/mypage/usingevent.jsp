<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<title>Insert title here</title>
<style type="text/css">
body {
  font: 400 16px 'Muli', sans-serif !important;
  margin: 0;
  padding: 0;
}

header {
  margin: 0;
  max-width: 100%;
  padding: 5px;
  text-align: center;
  overflow: auto;
}

ul{
  list-style-type: none;
  margin: 0 auto;
  padding: 0
}

li{
  background: slategrey;
  display: inline-block;
  margin: 5px;
  padding: 5px 7px;
}

li > a {
  color: white; 
  font-size: 16px;
}

li > a:hover{
  color: #262626;
  text-decoration: none;
}

.inner {
  padding: 30px;
}
/* headings */

.container-fluid h2 {
  font-family: 'Montserrat', sans-serif;
}

.site-title {
  font-size: 50px;
  font-weight: 300;
  text-transform: uppercase;
}

/* text colors */

.black,
.k {
  font-color: #262626;
}

/* background colors */

.sq {
  /*  alignment  */
  float: left;
  margin: 5px;
  /*  size  */
  width: 200px;
  height: 200px;
  /*  box text  */
  color: #262626;
/*   font: 200 16px/180px 'Muli', helvetica; */
  text-align: center;
}

.sq:hover {
  border: 6px solid rgba(255,255,255, 0.5);
}

.sq p {
  vertical-align: middle;
  text-align: center;
  position: relative;
  top: 40px;
}

.c {
  display: block;
  width: 100px;
  height: 100px;
  border-radius: 100%;
  margin: 10px;
}

/* table */

.tableizer-table > tbody > div.tableizer-firstrow > th {
  padding: 10px;
  background: lavenderblush;
}
.tableizer-table {

  display: table;
  margin: 10px auto;

}

.row {

  display: table-row;
}

.column {

  display: table-cell;

}



body > div.container-fluid.inner > .tableizer-table > tbody > tr > td{
  border: 4px solid #fff;
  width: 170px;
  padding: 10px;
  background: #f8f8f8;
}




</style>
</head>
<body>
	
	${eventDto}
	
	<html lang="en">
<head>
    <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
  <title></title>
          
<link href="http://fonts.googleapis.com/css?family=Montserrat:300,400,700" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Muli:300,400" rel="stylesheet" type="text/css">

<!--   CSS for 147 Colors   -->
<link href="http://docs.justinav.info/cfbc.css" rel="stylesheet" type="text/css"> 
    
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<header class="lv-bg">
  <h1 class="site-title">응모한 이벤트</h1>
  <p>this is my using event</p>  
</header>
  
          
<!--    color palettes       -->
  
  <div class="container-fluid inner">
  	<div class="tableizer-table">
	  <div class="row" id ="tableizer-firstrow">
		  <div class="column">HTML</div>
		  <div class="column">Colorname</div>
		  <div class="column">Hex Value</div>
		  <div class="column">RGB Value</div>
		  <div class="column">RGBA Value</div>
		  <div class="column">Class Selector</div>
	  </div>
   
   <div>
   	<div>
   		<div class="row" id="c aw-bg"></div>
   	</div>
   		<div class="column">aliceblue</div>
   		<div class="column">#F0F8FF</div>
   		<div class="column">rgb(240,248,255)</div>
   		<div class="column">rgba(240,248,255,0)</div>
   		<div class="column">.ab-bg</div>
   </div>
   	<div>
   		<div><div class="row" id="c aw-bg"></div>
   		</div>
   		<div class="column">antiquewhite</div>
   		<div class="column">#FAEBD7</div>
   		<div class="column">rgb(250,235,215)</div>
   		<div class="column">rgb(250,235,215)</div>
   		<div class="column">.aw-bg</div>
   	
   
   <div>
   		<div><div class="row" id="c aq-bg"></div>
   		</div>
   		<div class="column">aqua</div>
   		<div class="column">#00FFFF</div>
   		<div class="column">rgb(0,255,255)</div>
   		<div class="column">rgba(0,255,255,0)</div>
   		<div class="column">.aq-bg</div>
   	</div>
  
  </div>

  </div>
  </div>
</body>
</html>