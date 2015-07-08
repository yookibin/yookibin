/**
 * 
 */
function writeToServer(requestRoot, place_code, nickName) {
/*	alert(requestRoot);
	alert($("#starReply").val());
	alert(place_code);
	alert($("#writeReply").val());*/
	
	$.ajax({
		url : requestRoot + "/reviewBoard/insertReview.do",
		type : "post",
		data : {
			star : $("#starReply").val(),
			place_code : place_code,
			nickName : nickName,
			writeReply : $("#writeReply").val()
		},
		success : function(data) {
			console.log(data[0].review_content);
			var str = "";
			
			
			for(var i=0;i<data.length;i++){
				str += "<div class='replyDiv' id='"+data[i].review_code+"'>"+
						"<div class='cssCode'>"+data[i].review_code+"</div>"+ 
						"<div class='cssId'>"+data[i].review_id+"</div>"+
						"<div class='cssStar'>"+data[i].review_star/10+"점"+"</div>"+ 
						"<div class='cssContent'>"+data[i].review_content+"</div>"+ 
						"<div class='cssDate'>"+data[i].review_date+"</div>"+ 
						"<div class='cssUpDel'>"+"</div>"+"</div>";
			}
			

			$("#foot").empty();
			$("#foot").prepend(str);
			
		}
	});
}