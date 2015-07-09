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
	<script type="text/javascript" src="${root }/smarteditor/js/HuskyEZCreator.js"></script>  
	<script type="text/javascript">   	
		function joinFun(root, event_code, pageNumber,id,event_point,event_progress){
			//alert(id);
			//alert(root+","+ event_code+","+pageNumber+","+id+","+event_point+","+form);
			//alert($("input[name='join_filePath']").val());
			
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			
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
		
		
<!-- 		<div class="line">
			<label class="title">파일 첨부</label>
			<span class="content">
				<input type="file" name="file" id="imgInp"/>
			</span>
		</div> -->
		
		<div class="line" style="height:390px;">
			<div id="toress">
				<textarea name="join_content" id="ir1" rows="22" style="width:645px;"></textarea><br/>
			</div>
		</div>
		
		<div class="line" style="width:598px; border-width:2px; text-align:center;">		
			<input type="button" value="응모하기" onclick="joinFun('${root}','${event_code }','${pageNumber }','${id }','${event_point }')"/>			
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록보기" onclick="location.href='${root }/eventBoard/list.do?pageNumber=${pageNumber }'"/> 
		</div>
	</form>
	
</body>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "ir1", //textarea ID
    sSkinURI: "${root}/SmartEditor2Skin",
    htParams : {
      bUseToolbar : true,	// 툴바 사용 여부 (true:사용/ false:사용하지 않음[default:true] )
      bUseVerticalResizer : true,	// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음[default:true])
      bUseModeChanger : true	// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음[default:true])
    },
    //Editor 로딩이 완료된 후 처리될 내용 ex) 수정시 입력한글 내용 삽입가능
    fOnAppLoad : function(){
       //예제 코드
       //oEditors.getById["bbsContent"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
    },
    fCreator: "createSEditor2"
});
</script>
</html>