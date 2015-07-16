<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<c:set var="root" value="${pageContext.request.contextPath }"></c:set>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="${root}/css/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

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
<style type="text/css">
#memberManagerMain{
	width: 1100px;
	height: 1200px;
	margin-left: auto;
	margin-right: auto;
}
</style>
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
		$("."+id+"reupdate").css("display","none");
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
		$("."+id+"reupdate").css("display","block");
	}
</script>

</head>
<body>
	<div id="memberManagerMain">
	    <div class="row">
	       <div class="col-lg-12">
	            <h1 class="page-header">회원관리</h1>
	        </div>
	        <!-- /.col-lg-12 -->
	    </div>
	    <!-- /.row -->
	    <div class="row">
	        <div class="col-lg-12">
	           <div class="panel panel-default">
	                <!-- /.panel-heading -->
	                <div class="panel-body">
	                    <!-- <div class="dataTable_wrapper"> -->
	                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
	                           <thead>
	                                <tr>
	                                    <th>아이디</th>
	                                    <th>비밀번호</th>
	                                    <th>전화번호</th>
	                                    <th>우편번호</th>
	                                    <th>집주소</th>
	                                    <th>닉네임</th>
	                                    <th>생년월일</th>
	                                    <th>회원등급</th>
	                                    <th>관리</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <c:forEach var="member" items="${list}" varStatus="status">
	                                 <tr>
										<td>${member.id}</td>
	                                    <td>${member.pw}</td>
	                                    <td>${member.phone}</td>
	                                    <td class="center">${member.zipcode}</td>
	                                    <td class="center">${member.addr}</td>
	                                    <td>${member.nickName }</td>
	                                    <td>${member.birthday}</td>
	                                    <td style="text-align: center;">
	                                    <label class="${member.id}reupdate">&nbsp;&nbsp;${member.member_level}&nbsp;&nbsp;</label>
	                                    <input type="text" value="${member.member_level}" class="${member.id}update" id="${member.id}name" style="display:none; float:left; width: 30px;">
	                                    <input type="button" value="O" onclick="memberUpdateOk('${root}','${member.id}')" class="${member.id}update" style="display:none; float:left; width:20px">
										<input type="button" value="X" onclick="memberUpdateNo('${member.id}')" class="${member.id}update" style="display:none; float:left; width: 20px;">
	                                     </td>
	                                     <td>
										<a href="javascript:memberUpdate('${member.id}')" class="memberUpdate">등급수정</a>
	                                     	<a href="javascript:memberDelete('${root}','${member.id}')" class="memberDelete">삭제</a>
	                                     </td>
	                                 </tr>
									</c:forEach>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	                <!-- /.panel-body -->
	            </div>
	            <!-- /.panel -->
	        </div>
	        <!-- /.col-lg-12 -->
</div>
    <!-- jQuery -->
    <script src="${root }/css/bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${root }/css/bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${root }/css/bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="${root }/css/bootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="${root }/css/bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${root }/css/bootstrab/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>
</body>
</html>