<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="root" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시판 글쓰기</title>
	<script type="text/javascript" src="${root}/css/board/script.js"></script>
	<link rel="stylesheet" type="text/css" href="${root}/css/board/style.css"/>
	
	<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script>
	   $(document).ready(function(){
	       function readURL(input) {
	           if (input.files && input.files[0]) {
	        	   var div=document.getElementById("toress");
	        	   var img=document.createElement("img");
	        	  
	               var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	               reader.onload = function (e) { 
	               //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	                img.setAttribute("src", e.target.result);
	                img.setAttribute("width", "100");
	                img.setAttribute("height", "100");
	               	//alert(img.src); //이미지소스
	               	
	                   //$('#blah').attr('src', e.target.result);
	                   //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
	                   //(아래 코드에서 읽어들인 dataURL형식)
	               }                    
	               reader.readAsDataURL(input.files[0]);
	             //File내용을 읽어 dataURL형식의 문자열로 저장
	               div.appendChild(img);
	               
	               
	           }
	       }//readURL()--
	
	       //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	       $("#imgInp").change(function(){
	           //alert(this.value); //선택한 이미지 경로 표시
	           readURL(this);
	       });
	    });

  </script>
	
</head>
<body>
	${nickName}
	<form class="form_style"  action="${root }/memberboard/write.do"  method="post" onsubmit="return checkForm(this)" enctype="multipart/form-data">	
		<%-- <input type="hidden" name="boardNumber" value="${boardNumber}"/> --%>
		<input type="hidden" name="pageNumber" value="${pageNumber}"/>
		<input type="hidden" name="board_writer" value="${nickName}"/>
			
		<div style="width:598px; height:15px; border-width:2px; text-align:right; padding:15px 0px 0px 0px; border-bottom-width:0px;">
				<a href="${root}/board/list.do">글목록</a>
		</div>
			
		
		
		<div class="line">
			<label class="title">제목</label>
				<span class="content"><input type="text" size="50" name="board_title"/></span>
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
				<textarea rows="1" cols="58" name="board_content"></textarea><br/>
				<!-- <img id="blah" src="#" alt="your image" width="50" height="50" /> -->
			</div>
		</div>
		
		<div class="line" style="width:598px; border-width:2px; text-align:center;">
			<input type="submit" value="확인"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root}/memberboard/list.do'"/> 
		</div>
	</form>
</body>
</html>