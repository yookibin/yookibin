(function (){
	var current=0;
	var max=0;
	var container;
	var interval;
	var xml;
	function init(){
		container=$(".event-B ul");
		
		max= container.children().length;
		events();
		Interval=setInterval(next,4000);
	}
	function events(){
		$("button.prev-B").on("click",prev);
		$("button.next-B").on("click",next);
		
		$(window).on("keydown",keydown);
	}
	function prev(e){
		current--;
		if(current < 0) current = max-1;
		animate();
	}
	function next(e){
		current++;
		if(current > max-1) current = 0;
		animate();
	}
	function animate(){
		var moveX = current * 392;
		TweenMax.to(container,0.8, {marginLeft:-moveX, ease:Expo.easeOut});
	
		clearInterval(interval);
		
	}
	function keydown(e){
		
	}
	
	$(document).ready(init);
})();

function events_A(root,event_code,pageNumber){
	location.href=root+"/eventBoard/read.do?event_code="+event_code+"&pageNumber="+pageNumber;
}