function writeReply(root, board_num, reply_writer){
	var reply_content=$("#reply").val();
	//alert(reply+root+board_num);
	var url=root+"/reply/reply.do?board_num="+board_num+"&reply_content="+reply_content+"&reply_writer="+reply_writer;
	//alert(url);
	//location.href=url;
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			//alert("되나?");
			var split=data.split(",");	//0번지는 글번호 1번지는 답글내용이 됨.
			
			var reply_num=split[0].trim();
			var reply_content=split[1].trim();
			var reply_writer=split[2].trim();
			var reply_time=split[3].trim();
			//alert(reply_num+reply_content+reply_writer+reply_time);
			
			
			var replyDivs = $("#replyAll > div:first").clone();
			
			$("#replyAll > div:first").css("display","block");
			$("#replyAll > div:first").attr("id", reply_num);
			
			$("#replyAll span:eq(0)").text(reply_num);
			$("#replyAll span:eq(1)").text(reply_content);
			$("#replyAll span:eq(2)").text(reply_writer);
			$("#replyAll span:eq(3)").text(reply_time);
			
			$("#replyAll a:eq(0)").text("수정");
			$("#replyAll a:eq(0)").attr("href","javascript:updateReply("+reply_num+",\'"+root+"\')");
			
			$("#replyAll a:eq(1)").text("삭제");
			$("#replyAll a:eq(1)").attr("href","javascript:deleteReply("+reply_num+",\'"+root+"\')");
			
			$("#reply").val("");
			
			$("#replyAll").prepend(replyDivs);

		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

function deleteReply(reply_num, root){
	//alert(reply_num +","+root);
	
	var url=root+"/reply/replyDelete.do?reply_num="+reply_num;
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			var reply_num=data;
			alert(reply_num);
			
			$("#"+reply_num).remove();
			//alert(divBunho);
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

function updateReply(reply_num, root){
//	alert(reply_num+","+ root);
	var url=root+"/reply/replyUpdate.do?reply_num="+reply_num;
//	alert(url);
	//alert("yaho");
//	$("#replyAll > div:eq(0)").css("display","block");
	$("#"+reply_num+">span").eq(1).text("");
	// $("#"+reply_num+">span").eq(1).css("display", "none";
	// 으로 했을시 문제점. 다 display block으로 read.jsp에서 걸어줘야 수정된 후 다뜸. 그래서 하면 문제없으나
	// block으로 거니까 다 자동 줄내림이 되는 문제점이 발생. 이건 추후에 block으로 바꿀시 다시 생각해 볼것.
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			var split=data.split(",");	//0번지는 글번호 1번지는 답글내용이 됨.
			
			// 수정눌렀을때 위에 댓글은 안보이게 해주고싶은뎅.. 일단 이 2가지방법 다 안됨.
			// $("#reply_num span:eq(1)").hide();
			//$("#reply_num span:eq(1)").css("display", "none");
			//$("#reply_num").css("display", "none");
			var reply_num=split[0].trim();
			var reply_content=split[1].trim();
			var reply_writer=split[2].trim();
			var reply_time=split[3].trim();
			
			//alert(reply_num+","+reply_content+","+reply_writer+","+reply_time);
			var div=$("<div></div>");
			$(div).attr("id","upBunho"+reply_num);
			
			var input=$("<input/>");
			$(input).attr("type","text");
			$(input).attr("value",reply_content);
			
			var inputBtn=$("<input/>");
			$(inputBtn).attr("type", "button");
			$(inputBtn).attr("value", "수정");
			$(inputBtn).click(function(){
				update(root, reply_num, $(input).val());
			});
			
			var inputReset=$("<input/>");
			$(inputReset).attr("type", "button");
			$(inputReset).attr("value", "수정취소");
			$(inputReset).click(function(){
				$("#"+reply_num+">span").eq(1).text(reply_content);
				$("#upBunho"+reply_num).remove();
			});
			
			$(div).append($(input));
			$(div).append($(inputBtn));
			$(div).append($(inputReset));
			
			var bunhoDiv=$("#"+reply_num);
			//alert(bunhoDiv);
			if(bunhoDiv != null){
				$(bunhoDiv).append($(div));
			}
		}
	});
}

function update(root, reply_num, reply_content){
	var url=root+"/reply/update.do?reply_num="+reply_num+"&reply_content="+reply_content;
	// alert(url);
	
	$.ajax({
		url:url,
		type:"get",
		dataType:"text",
		success:function(data){
			var result=data.split(",");
			var reply_num=result[0].trim();
			var reply_content=result[1].trim();
			//alert(reply_num+","+reply_content);
			
			var bunhoDiv=$("#"+reply_num);
			// alert(reply_num+","+reply_content+","+bunhoDiv);
			var updateDiv=$("#upBunho"+reply_num);
			
			if(bunhoDiv != null){
				//alert("135번줄:"+reply_num);
				
				var span=$("#"+reply_num+">span").eq(1);
				//alert("span:"+span);
				$(span).text(reply_content);
				$(updateDiv).remove();
				
			}
		},
		error:function(xhr,status,error){
			alert(xhr+"\n"+status+"\n"+error);
		}
	});
}

function recommend(root, board_num, board_recom, pageNumber, recommend_nickName){
	 //alert(root+","+board_num+","+board_recom+","+recomand_nickName);
	var url=root+"/memberboard/recommend.do?board_num="+board_num+"&board_recom="+board_recom+"&recommend_nickName="+recommend_nickName+"&pageNumber="+pageNumber;
	 //location.href=url;
	//var x=Number(board_recom);
	 // 1증가시키기 전 증가시키고자 하는 사용자가 이미 추천을 눌렀는지 확인. 
	 // 아니라면 추천테이블에 해당 게시물에 추천을 했다는 표시를 함.
	 // 후에 추천을 1 증가시킴
	 // 그 다음 보드테이블에 recomand도 1증가?
	$.ajax({
		url:url,
		type:"get",
		datatype:"text",
		
		success:function(data){
			var result=data;
			if(data!=""){
				$("#board_recom:eq(0)").text(data);
			}
			
			if(data=="") alert("추천을 이미 하셨습니다.");
			
			$("#recom_button").attr("disabled", "disabled");
			//alert(result);
		}
		
	});
	 /*var recom=x+1;
	 alert(recom);*/
	 // location.href=root+"/memberboard/read.do?board_num="+board_num+"&board_recom="+recom+"&pageNumber="+pageNumber;
}

function writeFun(root, nickName){
	//alert(root+","+nickName);
	if(nickName==null||nickName==""){
		alert("로그인후 이용가능합니다.");
	}else if(nickName!=null){
		$("#writeA").attr("href", root+"/memberboard/write.do")
	}
}

function checkForm(boardForm){
	
}

function deleteCheck(deleteForm){

}