function writeReply(root, board_num){
	var reply=$("#reply").val();
	//alert(reply+root+board_num);
	var url=root+"/memberboard/read.do?board_num="+board_num+"&reply="+reply;
	alert(url);
}

function checkForm(boardForm){

}

function deleteCheck(deleteForm){

}