/**
 * 
 */
function modifyReply(review_code,requestRoot,review_id,nickName){
	$(".reply").css("display","none");
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
				swal({ 
					  title: "GOOD!",
					  text: "수정되었습니다.",
					  type: "success" 
					  },
			  function(){
					location.reload();
				});
			}
		}
	});
}

function updateCencelServer(review_code){
	$("#"+review_code+"_content").css("display","none");
	$(".reply").css("display","block");
}