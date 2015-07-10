/**
 * 
 */

function placeListForm(form){
	//alert("OK");
	//	alert(place);
	
}

function mouseOver(place_star,index,place_code){
//	alert(place_star);
//	alert(index);
	$(function (){
		$("#"+index).css("opacity","0.4");
		$("#"+place_code).append(place_star+"점");
		$("#starDiv").show();
	});
}

function mouseOut(index, place_code){
	$(function (){
		$("#"+index).css("opacity","1.0");
		$("#"+place_code).empty();
	});
}