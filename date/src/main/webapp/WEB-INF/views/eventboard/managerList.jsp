<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath }"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>Insert title here</title>
<!-- Pagination -->
<link href="${root }/css/eventBoard/style.css" rel="stylesheet"/>

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
  
  	<script src="${root }/css/alertify.js-0.3.11/lib/alertify.min.js"></script>
	<link rel="stylesheet" href="${root }/css/alertify.js-0.3.11/themes/alertify.core.css"/>
	<script src="${root }/css/sweetalert-master/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${root }/css/sweetalert-master/dist/sweetalert.css"/>
  
<script type="text/javascript">
	function randomFun(root, event_code, group_number, sequence_number, sequence_level, pageNumber, count, event_period){
		//alert("하하하 랜덤추첨!!");
 		//alert(event_period);
 		var period=event_period.split("~");
		var lastPeriod=period[1].trim();		
		//alert("lastPeriod: "+lastPeriod);  		
  		
  		var today = new Date();  
  		var dateArray = lastPeriod.split("-");  
  		var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);  
  		var day = 1000*60*60*24;  
  		var month = day*30;
  		var year = month*12;

  		var betweenDay = (today.getTime() - dateObj.getTime())/day;  
  		var betweenMonth =  (today.getTime() - dateObj.getTime())/month;   
  		
  		//alert("오늘과의 차이: "+betweenDay);   		
		
   		if(betweenDay<1){
   		//alertify.alert("아직 이벤트 진행기간입니다.");
   			swal({ 
				  title: "warning!",
				  text: "아직 이벤트 진행기간입니다.",
				  type: "warning" 
				 });
  		}else{
  		/* 	var num=prompt("현재 응모회원수 : "+count+"\n몇 명의 당첨자?","");
			//alert(num);
			
			if(num!=null&&num!=""&&count>=num){
				var url=root+"/eventBoard/write.do?event_code="+event_code+"&group_number="+group_number+"&sequence_number="+sequence_number+"&sequence_level="+sequence_level+"&pageNumber="+pageNumber+"&num="+num;
				location.href=url;
			} */
			
  			swal({   
  				title: "몇 명의 당첨자?",   
  				text: "현재 응모회원수 : "+count,   
  				type: "input",   
  				showCancelButton: true,   
  				closeOnConfirm: false,   
  				animation: "slide-from-top",   
  				inputPlaceholder: "명수를 입력하세요." }, 
  				function(inputValue){   
  					if (inputValue === false) return false;      
  					if (inputValue === ""){     
  						swal.showInputError("You need to write something!");     
  						return false   
  					} 					
  					
  					//swal("Nice!", "You wrote: " + inputValue, "success");
  					var url=root+"/eventBoard/write.do?event_code="+event_code+"&group_number="+group_number+"&sequence_number="+sequence_number+"&sequence_level="+sequence_level+"&pageNumber="+pageNumber+"&num="+inputValue;
  					location.href=url;
  					
  				});
  		} 

	}
	
	function noRandomFun(root, event_code, group_number, sequence_number, sequence_level, pageNumber, count, event_period){
		//alert("하하하 랜덤추첨!!");
 		//alert(event_period);
 		var period=event_period.split("~");
		var lastPeriod=period[1].trim();		
		//alert("lastPeriod: "+lastPeriod);  		
  		
  		var today = new Date();  
  		var dateArray = lastPeriod.split("-");  
  		var dateObj = new Date(dateArray[0], Number(dateArray[1])-1, dateArray[2]);  
  		var day = 1000*60*60*24;  
  		var month = day*30;
  		var year = month*12;

  		var betweenDay = (today.getTime() - dateObj.getTime())/day;  
  		var betweenMonth =  (today.getTime() - dateObj.getTime())/month;   
  		
  		//alert("오늘과의 차이: "+betweenDay);   		
		
   		if(betweenDay<1){
  			//alert("아직 이벤트 진행기간입니다.");
   			swal({ 
				  title: "warning!",
				  text: "아직 이벤트 진행기간입니다.",
				  type: "warning" 
				 });
  		}else{  			
			var url=root+"/eventBoard/write.do?event_code="+event_code+"&group_number="+group_number+"&sequence_number="+sequence_number+"&sequence_level="+sequence_level+"&pageNumber="+pageNumber+"&num=0";
			location.href=url;			
  		} 

	}
</script>
</head>
<body>
    <div class="totalDiv">   
    
    	<jsp:include page="/TOP.jsp"/>
    	 
        <div class="col-lg-12">
            <div class="panel panel-default">             
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="dataTable_wrapper">

						<a class="btn btn-warning" href="${root}/eventBoard/list.do?pageNumber=${pageNumber}">이벤트list로 가기</a><br/>
						<button type="button" class="btn btn-warning" onclick="randomFun('${root }','${event_code}','${group_number }','${sequence_number }','${sequence_level }','${pageNumber }','${count }','${event_period }')">당첨자 발표 글 쓰기(랜덤당첨)</button>
						<button type="button" class="btn btn-warning" onclick="noRandomFun('${root }','${event_code}','${group_number }','${sequence_number }','${sequence_level }','${pageNumber }','${count }','${event_period }')">당첨자 발표 글 쓰기(수동서기)</button>
						<br/><br/>
					
						<c:if test="${count==0 }">		
							<center>해당 이벤트에 참가한 글이 없습니다.</center>		
						</c:if>
					
						<c:if test="${count!=0 }">								
							<div style="height:400px;">
								<table class="table table-striped table-bordered table-hover" id="dataTables-example">
		                            <thead>
		                                <tr>
		                                   <!--  <th class="myTh"></th> -->
		                                    <th class="myTh" colspan="2">제목</th>
		                                    <th class="myTh">아이디</th>
		                                    <th class="myTh">작성자</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                                <c:forEach var="eventMember" items="${list }">
		                                	<tr class="odd gradeX">
		                                     <td>${eventMember.join_code }</td>
		                                     <td><a style="color:black;" href="${root }/eventBoard/managerRead.do?join_code=${eventMember.join_code }&eventPageNumber=${eventPageNumber}&event_code=${eventMember.event_code}&pageNumber=${pageNumber}&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}">${eventMember.join_title }</a>	</td>
		                                     <td class="center">${eventMember.id }</td>
		                                     <td class="center">${eventMember.join_writer }</td>
		                                 </tr>	                                
		                                </c:forEach>	                               
		                            </tbody>
		                        </table>
							</div>							
						</c:if>					
					
						<!-- 페이지 번호 -->
						<center>
							<c:if test="${count>0 }">
								<c:set var="pageBlock" value="${3 }"/>
								
								<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0?0:1) }"/>
								
								<fmt:parseNumber var="rs" value="${(eventPageNumber-1)/pageBlock }" integerOnly="true"/>
								<c:set var="startPage" value="${rs*pageBlock+1 }"/>
								
								<c:set var="endPage" value="${startPage+pageBlock-1}"/>
								<c:if test="${endPage>pageCount}">
									<c:set var="endPage" value="${pageCount }"/>
								</c:if>
								
								<!--------------------------------------------------------------->								
								<ul class="pagination">
									<c:if test="${startPage>pageBlock }">
										<li>
											<a style="background-color: #F05F40; color:black;" href="${root}/eventBoard/managerList.do?eventPageNumber=${startPage-pageBlock}&pageNumber=${pageNumber}&event_code=${event_code}&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}">이전</a>
										</li>
									</c:if>
									
									<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1" >
										<li>
											<a style="color:black;" href="${root}/eventBoard/managerList.do?eventPageNumber=${i}&pageNumber=${pageNumber}&event_code=${event_code}&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}">${i }</a>
										</li>
									</c:forEach>
									
									<c:if test="${endPage<pageCount }">
										<li>
											<a style="background-color: #F05F40; color:black;" href="${root}/eventBoard/managerList.do?eventPageNumber=${startPage+pageBlock}&pageNumber=${pageNumber}&event_code=${event_code}&group_number=${group_number}&sequence_number=${sequence_number}&sequence_level=${sequence_level}">다음</a>
										</li>
									</c:if>
								</ul>					
							</c:if>
						</center> 						
					</div>                    
                </div>
            </div>
        </div>  
                      
    </div>
	
</body>
</html>