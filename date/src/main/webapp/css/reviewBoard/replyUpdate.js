/**
 * 
 */
function modifyReply(review_code,requestRoot,review_id,nickName){
	$("#"+review_code+"_content").css("display","block");
}

function updateToServer(requestRoot,review_code){
	$.ajax({
		url : requestRoot + "/reviewBoard/updateReview.do",
		type : "post",
		data : {
			review_content : $("#"+review_code+"_content > textarea").val(),
			review_code : review_code
		},
		
		success : function(data) {
			if(data==1){
				alert("수정완료");
				location.reload();
			}
			
			
		}
	});
}