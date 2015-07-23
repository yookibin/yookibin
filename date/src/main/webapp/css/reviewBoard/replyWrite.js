/**
 * 
 */
function writeToServer(requestRoot, place_code, nickName,id) {
	if($("#starReply").val()=="선택하세요" || $("#writeReply").val()=="" || $("#writeReply").val()==null){
		
		/*swall({
			title:"GOOD!",
			text: "별점 혹은 평점을 선택 해주세요",
			type: "success"
		});*/
		
		swal({ 
			  title: "warning!",
			  text: "별점 혹은 평점을 선택 해주세요.",
			  type: "warning" 
			  });
	}
	
	$.ajax({
		url : requestRoot + "/reviewBoard/insertReview.do",
		type : "post",
		data : {
			star : $("#starReply").val(),
			place_code : place_code,
			nickName : nickName,
			id: id,
			writeReply : $("#writeReply").val()
		},
		success : function(data) {
			if(data==1){
				swal({ 
					  title: "Good!",
					  text: "입력이 완료되었습니다.",
					  type: "success" 
				},
			  function(){
				 location.reload();
				});	
			}
		}
	});
}