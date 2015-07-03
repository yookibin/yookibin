/**
 * 
 */

function placeListForm(form){
	//alert("OK");
	var check=false;
	var place="";
	
	for(var i=0;i<form.place_location.length;i++){
		if(form.place_location[i].checked==true){
			place+=form.place_location[i].value+",";
			check=true;
		}
	}
	//	alert(place);
		
		if(check==false){
			alert("하나라도 체크해주세요");
			form.place_location[0].focus();
			return false;
			
		}
		
		form.location.value=place;
			alert(form.location.value);
}

function mouseOver(place_star,index,place_code){
//	alert(place_star);
//	alert(index);
	$(function (){
		$("#"+index).css("opacity","0.4");
		$("#"+place_code).append("&nbsp;"+"&nbsp;"+"&nbsp;"+"&nbsp;"+"&nbsp;"+"★★★★★"+"&nbsp;"+place_star);	
	});
}

function mouseOut(index, place_code){
	$(function (){
		$("#"+index).css("opacity","1.0");
		$("#"+place_code).empty();
	});
}