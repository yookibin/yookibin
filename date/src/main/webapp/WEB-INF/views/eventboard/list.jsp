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
<title>게시판 목록보기</title>
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
    
</head>
<body>	



	<!-- /.row -->
    <div class="totalDiv">
    <c:if test="${count!=0 }">
        <div class="col-lg-12">
            <div class="panel panel-default">
             
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="dataTable_wrapper">
                    	
                    	<c:if test="${memberLevel=='AA' }">
							<a href="${root }/eventBoard/write.do">글쓰기(운영자만)</a><br/><br/>
						</c:if>						
						
						<c:if test="${count==0 }">
							<center>게시판에 저장된 글이 없습니다.</center>
						</c:if>
						
						<div style="height:400px;">
	                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
	                            <thead>
	                                <tr>
	                                   <!--  <th class="myTh"></th> -->
	                                    <th class="myTh" colspan="2">제목</th>
	                                    <th class="myTh">기간</th>
	                                    <th class="myTh">작성자</th>
	                                    <th class="myTh">조회수</th>
	                                    <th class="myTh">진행상황</th>
	                                    <th class="myTh">차감포인트</th>
	                                    <th class="myTh">경품</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <c:forEach var="eventBoard" items="${list }">
	                                	<tr class="odd gradeX">
	                                     <td>${eventBoard.event_code }</td>
	                                     <td><a style="color:black;" href="${root }/eventBoard/read.do?event_code=${eventBoard.event_code}&pageNumber=${currentPage}">${eventBoard.event_title }</a>	</td>
	                                     <td>${eventBoard.event_period }</td>
	                                     <td class="center">${eventBoard.writer }</td>
	                                     <td class="center">${eventBoard.read_count }</td>
	                                     <td>${eventBoard.event_progress }</td>
	                                     <td>${eventBoard.event_point }</td>
	                                     <td>${eventBoard.event_giveaway }</td>
	                                 </tr>
	                                
	                                </c:forEach>
	                               
	                            </tbody>
	                        </table>
                        </div>
                        <!-- 페이지 번호 -->
						<center>
							<c:if test="${count>0 }">
								<c:set var="pageBlock" value="${2 }"/>
								
								<c:set var="pageCount" value="${count/boardSize+(count%boardSize==0?0:1) }"/>
								
								<fmt:parseNumber var="rs" value="${(currentPage-1)/pageBlock }" integerOnly="true"/>
								<c:set var="startPage" value="${rs*pageBlock+1 }"/>
								
								<c:set var="endPage" value="${startPage+pageBlock-1}"/>
								<c:if test="${endPage>pageCount}">
									<c:set var="endPage" value="${pageCount }"/>
								</c:if>
								
								<!-- ----------------------------------------------------------- -->
								<ul class="pagination">
									<c:if test="${startPage>pageBlock }">
										<li>
											<a style="background-color: #F05F40; color:black;" href="${root}/eventBoard/list.do?pageNumber=${startPage-pageBlock}">이전</a>
										</li>
									</c:if>
									
									<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1" >
										<li>
											<a style="color:black;" href="${root}/eventBoard/list.do?pageNumber=${i}">${i }</a>
										</li>
									</c:forEach>
									
									<c:if test="${endPage<pageCount }">
										<li>
											<a style="background-color: #F05F40; color:black;" href="${root}/eventBoard/list.do?pageNumber=${startPage+pageBlock}">다음</a>
										</li>
									</c:if>
								</ul>
							</c:if>
						</center> 
						                        
                    </div>
                    
                </div>
                <!-- /.panel-body -->
            </div>
            <!-- /.panel -->
        </div>
        <!-- /.col-lg-12 -->
        </c:if>
    </div>



 	<!-- jQuery -->
    <script src="${root }/css/bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${root }/css/bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${root }/css/bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="${root }/css/bootstrap/bower_components/datatables/media/js/jquery.dataTables.js"></script>
    <script src="${root }/css/bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${root }/css/bootstrap/dist/js/sb-admin-2.js"></script>       
 	
</body>
</html>