var root=null;

function writeToServer(receiveRoot, boardNumber){
	alert(root+" , "+boardNumber);
	root=receiveRoot;		
	var writeReply=$("#writeReply").val();	//댓글 내용
	var sendData="boardNumber="+boardNumber+"&lineReply="+writeReply;
	var url=root+"/12_reply/replyWrite.yes?"+sendData;
//	sendRequest("POST", url, writeFromServer, params);	
	
	alert(boardNumber);
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			var result=data.split(",");	//0번지는 글번호 1번지는 답글내용이 됨.
			var bunho=result[0].trim();			//공백 제거
			var reply=result[1].trim();	
			alert(bunho+", "+reply);
			
			var newReply = $("#listAllDiv > div:eq(0)").clone();
			
			$("#listAllDiv > div:eq(0)").css("display","block");
			$("#listAllDiv > div:eq(0)").attr("id",bunho);
			
			$("#listAllDiv span:eq(0)").text(bunho);
			$("#listAllDiv span:eq(1)").text(reply);
			
			$("#listAllDiv a:eq(0)").text("수정");
			$("#listAllDiv a:eq(0)").attr("href","javascript:upSelectToServer("+bunho+",\'"+root+"\')");
			
			$("#listAllDiv a:eq(1)").text("삭제");
			$("#listAllDiv a:eq(1)").attr("href","javascript:deleteToServer("+bunho+",\'"+root+"\')")
			
			$("#writeReply").val("");
			
			$("#listAllDiv").prepend(newReply);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

