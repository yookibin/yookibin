<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 글쓰기</title>
	<script type="text/javascript" src="${root}/css/eventBoard/script.js"></script>
	<link rel="stylesheet" type="text/css" href="${root}/css/eventBoard/style.css"/>
	<script type="text/javascript" src="${root }/css/jquery.js"></script>
    <script>
	   $(document).ready(function(){
		   
		   //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	       $("#imgInp").change(function(){
	           //alert(this.value); //선택한 이미지 경로 표시
	           var filePath=this.value;
	           filePath= $("input[name='join_filePath']").val()+","+this.value;
	           $("input[name='join_filePath']").val(filePath);
	           readURL(this);
	       });
		   
	       function readURL(input) {
	           if(input.files && input.files[0]) {
	        	   var div=document.getElementById("toress");
	        	   var img=document.createElement("img");
	        	  
	               var reader=new FileReader(); 	//파일을 읽기 위한 FileReader객체 생성
	               reader.onload=function(e){   //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	            	  	img.setAttribute("src", e.target.result);
		                img.setAttribute("width", "100");
		                img.setAttribute("height", "100");
		                
		               	//alert("HI");                  	
	               }       
	               
	               reader.readAsDataURL(input.files[0]);     //File내용을 읽어 dataURL형식의 문자열로 저장
	               div.appendChild(img);	               
	           }
	       }     
	    
	    });

  </script>
  
  <script type="text/javascript">   	
		function joinFun(root, event_code, pageNumber,id,event_point,event_progress){
			//alert(id);
			//alert(root+","+ event_code+","+pageNumber+","+id+","+event_point+","+form);
			//alert($("input[name='join_filePath']").val());
		
			
			if(id!=null&&id!=""){
				window.open(root+"/eventBoard/join.do?event_code="+event_code+"&pageNumber="+pageNumber+"&id="+id+"&event_point="+event_point,"join","width=500,height=500");
				
			}else{
				alert("로그인하세요.");
				location.href=root+"/member/login.do";
			}
			
		} 
  </script>
	
</head>
<body>

	<form class="form_style" id="enterForm" method="post" enctype="multipart/form-data">	
		<input type="hidden" name="event_code" value="${event_code }"/>
		<!-- <input type="hidden" name="join_filePath"/> -->
		<input type="hidden" name="pageNumber" value="${pageNumber }"/>
		<input type="hidden" name="join_writer" value="${nickName }"/>
		<input type="hidden" name="event_point" value="${event_point }"/>
		<input type="hidden" name="id" value="${id }"/>
			
		<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root }/eventBoard/list.do?pageNumber=${pageNumber }">글목록</a>
		</div>		
		
		<div class="line">
			<label class="title">제목</label>
				<span class="content"><input type="text" size="50" name="join_title"/></span>
		</div>
		
		
		<div class="line">
			<label class="title">파일 첨부</label>
			<span class="content">
				<input type="file" name="file" id="imgInp"/>
			</span>
		</div>
		
		<div class="line" style="height:230px;">
			<label class="title" style="height:230px;">내용</label>
			<div id="toress">
				<textarea rows="1" cols="58" name="join_content"></textarea><br/>
			</div>
		</div>
		
		<div class="line" style="width:598px; border-width:2px; text-align:center;">		
			<input type="button" value="응모하기" onclick="joinFun('${root}','${event_code }','${pageNumber }','${id }','${event_point }')"/>			
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root }/eventBoard/list.do?pageNumber=${pageNumber }'"/> 
		</div>
	</form>
	
</body>
</html>