<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${root}/css/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function (){
	$(".myButton").click(function () {
	    // Set the effect type
	    var effect = 'slide';
	
	    // Set the options for the effect type chosen
	    var options = { direction: $('.mySelect').val() };
	
	    // Set the duration (default: 400 milliseconds)
	    var duration = 500;
	
	    $('#myDiv').toggle(effect, options, duration);
	});
});
</script>
<style type="text/css">
/** Style for the body **/
 body {
    font: 12px Tahoma, Arial, Helvetica, Sans-Serif;
}
/** Style for the button & div **/
 .myButton {
    padding: .2em 1em;
    font-size: 1em;
}
.mySelect {
    padding: .2em 0;
    font-size: 1em;
}
#myDiv {
    color:Green;
    background-color:#eee;
    border:2px solid #333;
    display:none;
    text-align:justify;
}
#myDiv p {
    margin: 15px;
    font-size: 0.917em;
}
/** Style for the cointainer **/
 #body {
    clear: both;
    margin: 0 auto;
    max-width: 534px;
}
html, body {
    background-color:White;
}
hr {
    margin-bottom:40px;
}
</style>
</head>
<body>
	<div id="body">
    
	<h2>Slide toggle from right to left and left to right.</h2>

    <hr/>
    <p>
        <select class="mySelect">
            <option value="right">Right</option>
            <option value="left">Left</option>            
            <option value="up">Up</option>
            <option value="down">Down</option>
        </select>
        <button id="button" class="myButton">Run Effect</button>
    </p>
    <div id="myDiv">
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
        <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>
    </div>
	</div>
</body>
</html>