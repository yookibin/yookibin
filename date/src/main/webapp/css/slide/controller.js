(function (){
	var current=0;
	var max=0;
	var container;
	var interval;
	var xml;
	function init(){
		container=$(".event-A ul");
		
		max= container.children().length;
		events();
		Interval=setInterval(next,3000);
	}
	function events(){
		$("button.prev-A").on("click",prev);
		$("button.next-A").on("click",next);
		
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
		var moveX = current * 670;
		TweenMax.to(container,0.8, {marginLeft:-moveX, ease:Expo.easeOut});
	
		clearInterval(interval);
		
	}
	function keydown(e){
		
	}
	
	$(document).ready(init);
})();

function place_A(root,place_code){
	location.href=root+"/placeBoard/reviewBoard.do?place_code="+place_code;
}