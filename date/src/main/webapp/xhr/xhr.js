/**
 * 
 */

var xhr=null;

function createXHR(){
	if(window.XMLHttpRequest){
		return new XMLHttpRequest();
	}else if(window.ActiveObject){
		return new ActiveObject("Microsoft.XMLHTTP");
	}
}

function sendRequest(method, url, callback, params){
	xhr=createXHR();
	//alert(xhr);
	
	var httpMethod=method;
	
	if(httpMethod !="GET" && httpMethod !="POST") httpMethod="GET";
	
	var httpUrl=url;
	
	var httpParams=(params==null || params=="") ? null:params;
	
	if(httpMethod=="GET" && httpParams != null) httpUrl+="?"+httpParams;
	
	//alert(httpUrl); //문제생길때 찍어보려고 만듬.
	
	xhr.open(httpMethod, httpUrl, true);
	
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	
	xhr.send(httpMethod=="POST" ? httpParams : null);
	
	xhr.onreadystatechange=callback;
	
}










