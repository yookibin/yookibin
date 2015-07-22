<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<style>


figure.figurefx{
   margin: 10px;
   padding: 0;
   display: inline-block;
   position: relative;
   overflow: hidden; /* hide overflowing elements by default */
}

figure.figurefx::before, figure.figurefx::after{ /* create :before and :after pseudo elements that are initially positioned outside canvas */
   content: '';
   width: 100%;
   height: 100%;
   display: block;
   background: black;
   position: absolute;
   opacity: 0.3;
   top: 0;
   left 0;
   -moz-transform: translate3d(0, -100%, 0); /* position elements past bottom of layout */
   -webkit-transform: translate3d(0, -100%, 0);
   transform: translate3d(0, -100%, 0);
   -moz-transition: all 0.5s;
   -webkit-transition: all 0.5s;
   transition: all 0.5s;
}

figure.figurefx img{
   display: block;
}

figure.figurefx figcaption{
   position: absolute;
   display: block;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
   text-align: center;
   background: white;
   padding: 5px;
   z-index: 100;
   width: 100%;
   max-height: 100%;
   overflow: hidden;
   top: 50%;
   left: 0;
   -moz-transform: translate3d(-100%, -50%, 0); /* position caption outside layout horizontally and centered vertically */
   -webkit-transform: translate3d(-100%, -50%, 0);
   transform: translate3d(-100%, -50%, 0);
   opacity: 0;
   -moz-transition: all 0.5s;
   -webkit-transition: all 0.5s;
   transition: all 0.5s;
}

figure.figurefx figcaption a{
   text-decoration: none;
}

/*** Push Up effect ****/

figure.pushup img{
   -moz-transform: translate3d(0, 0, 0);
   -webkit-transform: translate3d(0, 0, 0);
   transform: translate3d(0, 0, 0);
   -moz-transition: all 0.5s;
   -webkit-transition: all 0.5s;
   transition: all 0.5s;
}

figure.pushup figcaption{
   top: 100%;
   opacity: 1;
   -moz-transform: translate3d(0, 0, 0);
   -webkit-transform: translate3d(0, 0, 0);
   transform: translate3d(0, 0, 0);
}

figure.pushup:hover img{
   -moz-transform: translate3d(0, -20px, 0); /* move image up vertically a bit for parallax effect */
   -webkit-transform: translate3d(0, -20px, 0);
   transform: translate3d(0, -20px, 0);
}

figure.pushup:hover figcaption{
   -moz-transform: translate3d(0, -100%, 0); /* move caption up vertically to fully reveal caption */
   -webkit-transform: translate3d(0, -100%, 0);
   transform: translate3d(0, -100%, 0);
   -moz-transition: all 0.5s;
   -webkit-transition: all 0.5s;
   transition: all 0.5s;
}



</style>

<meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
      <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
      <title>BookBlock: A Content Flip Plugin - Demo 1</title>
      <meta name="description" content="Bookblock: A Content Flip Plugin - Demo 1" />
      <meta name="keywords" content="javascript, jquery, plugin, css3, flip, page, 3d, booklet, book, perspective" />
      <meta name="author" content="Codrops" />
      <link rel="shortcut icon" href="../favicon.ico"> 
      <link rel="stylesheet" type="text/css" href="${root}/css/bookBlock/default.css" />
      <link rel="stylesheet" type="text/css" href="${root}/css/bookBlock/bookblock.css" />
      
      <!-- custom demo style -->
      <link rel="stylesheet" type="text/css" href="${root}/css/bookBlock/demo1.css" />
      <script src="${root}/css/bookBlock/modernizr.custom.js"></script>


</head>
<body>
   
   <!--  <h3>${area}</h3> -->
   <jsp:include page="/youAndITop.jsp"/><br/>   
   <div style="width:1200px; height:auto; margin-left:auto; margin-right:auto;">
      
   <c:if test="${area=='송파구'}">   
   <div class="container">
      
         <header>
            <h1>BookBlock <span>A Content Flip Plugin</span></h1>   
            <nav class="codrops-demos">
               <a class="current-demo" href="index.html">Demo 1</a>
               <a href="index2.html">Demo 2</a>
               <a href="index3.html">Demo 3</a>
               <a href="index4.html">Demo 4</a>
               <a href="index5.html">Demo 5</a>
            </nav>
         </header>
         <div class="main clearfix">
            <div class="bb-custom-wrapper">
               <h3>Illustrations by <a href="http://dribbble.com/kevinhowdeshell">You And I </a></h3>
               <div id="bb-bookblock" class="bb-bookblock">
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=송파구&thema=park"><img src="${root}/resources/img/park/finalPark11.png" alt="image01"/></a>
                     <br/><br/>
                     <h3>Thema 공원 테마</h3>
                  </div>
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=송파구&thema=art"><img src="${root}/resources/img/park/finalArt11.jpg" alt="image02"/></a>
                     <br/><br/>
                     <h3>Thema 미술관 테마</h3>
                  </div>
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=송파구&thema=concert"><img src="${root}/resources/img/park/finalConcert11.jpg" alt="image03"/></a>
                     <br/><br/>
                     <h3>Thema 콘서트 테마</h3>
                  </div>
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=송파구&thema=theaters"><img src="${root}/resources/img/park/finalTheaters11.jpg" alt="image04"  /></a>
                     <br/><br/>
                     <h3>Thema 영화관 테마</h3>
                  </div>
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=송파구&thema=shopping"><img src="${root}/resources/img/park/finalSopping.jpg" alt="image05"/></a>
                     <br/><br/>
                     <h3>Thema 쇼핑 테마</h3>
                  </div>
                  
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=송파구&thema=play"><img src="${root}/resources/img/park/finalSopping.jpg" alt="image05"/></a>
                     <br/><br/>
                     <h3>Thema 놀이 테마</h3>
                  </div>
               </div>
               
               <nav>
                  <a id="bb-nav-first" href="#" class="bb-custom-icon bb-custom-icon-first">First page</a>
                  <a id="bb-nav-prev" href="#" class="bb-custom-icon bb-custom-icon-arrow-left">Previous</a>
                  <a id="bb-nav-next" href="#" class="bb-custom-icon bb-custom-icon-arrow-right">Next</a>
                  <a id="bb-nav-last" href="#" class="bb-custom-icon bb-custom-icon-last">Last page</a>
               </nav>
            </div>
         </div>
      </div><!-- /container -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
      <script src="${root}/css/bookBlock/jquerypp.custom.js"></script>
      <script src="${root}/css/bookBlock/jquery.bookblock.js"></script>
      <script>
         var Page = (function() {
            
            var config = {
                  $bookBlock : $( '#bb-bookblock' ),
                  $navNext : $( '#bb-nav-next' ),
                  $navPrev : $( '#bb-nav-prev' ),
                  $navFirst : $( '#bb-nav-first' ),
                  $navLast : $( '#bb-nav-last' )
               },
               init = function() {
                  config.$bookBlock.bookblock( {
                     speed : 800,
                     shadowSides : 0.8,
                     shadowFlip : 0.7
                  } );
                  initEvents();
               },
               initEvents = function() {
                  
                  var $slides = config.$bookBlock.children();

                  // add navigation events
                  config.$navNext.on( 'click touchstart', function() {
                     config.$bookBlock.bookblock( 'next' );
                     return false;
                  } );

                  config.$navPrev.on( 'click touchstart', function() {
                     config.$bookBlock.bookblock( 'prev' );
                     return false;
                  } );

                  config.$navFirst.on( 'click touchstart', function() {
                     config.$bookBlock.bookblock( 'first' );
                     return false;
                  } );

                  config.$navLast.on( 'click touchstart', function() {
                     config.$bookBlock.bookblock( 'last' );
                     return false;
                  } );
                  
                  // add swipe events
                  $slides.on( {
                     'swipeleft' : function( event ) {
                        config.$bookBlock.bookblock( 'next' );
                        return false;
                     },
                     'swiperight' : function( event ) {
                        config.$bookBlock.bookblock( 'prev' );
                        return false;
                     }
                  } );

                  // add keyboard events
                  $( document ).keydown( function(e) {
                     var keyCode = e.keyCode || e.which,
                        arrow = {
                           left : 37,
                           up : 38,
                           right : 39,
                           down : 40
                        };

                     switch (keyCode) {
                        case arrow.left:
                           config.$bookBlock.bookblock( 'prev' );
                           break;
                        case arrow.right:
                           config.$bookBlock.bookblock( 'next' );
                           break;
                     }
                  } );
               };

               return { init : init };

         })();
      </script>
      <script>
            Page.init();
      </script>
      </c:if>   
      
      
      
   <c:if test="${area=='강남구'}">   
      <div class="container">
      
         <header>
            <h1>BookBlock <span>A Content Flip Plugin</span></h1>   
            <nav class="codrops-demos">
               <a class="current-demo" href="index.html">Demo 1</a>
               <a href="index2.html">Demo 2</a>
               <a href="index3.html">Demo 3</a>
               <a href="index4.html">Demo 4</a>
               <a href="index5.html">Demo 5</a>
            </nav>
         </header>
         <div class="main clearfix">
            <div class="bb-custom-wrapper">
               <h3>Illustrations by <a href="http://dribbble.com/kevinhowdeshell">You And I </a></h3>
               <div id="bb-bookblock" class="bb-bookblock">
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=강남구&thema=park"><img src="${root}/resources/img/park/finalPark11.png" alt="image01"/></a>
                     <br/><br/>
                     <h3>Thema 공원 테마</h3>
                  </div>
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=강남구&thema=art"><img src="${root}/resources/img/park/finalArt11.jpg" alt="image02"/></a>
                     <br/><br/>
                     <h3>Thema 미술관 테마</h3>
                  </div>
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=강남구&thema=concert"><img src="${root}/resources/img/park/finalConcert11.jpg" alt="image03"/></a>
                     <br/><br/>
                     <h3>Thema 콘서트 테마</h3>
                  </div>
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=강남구&thema=theaters"><img src="${root}/resources/img/park/finalTheaters11.jpg" alt="image04"  /></a>
                     <br/><br/>
                     <h3>Thema 영화관 테마</h3>
                  </div>
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=강남구&thema=shopping"><img src="${root}/resources/img/park/finalSopping.jpg" alt="image05"/></a>
                     <br/><br/>
                     <h3>Thema 쇼핑 테마</h3>
                  </div>
                  
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=강남구&thema=play"><img src="${root}/resources/img/park/finalSopping.jpg" alt="image05"/></a>
                     <br/><br/>
                     <h3>Thema 놀이 테마</h3>
                  </div>
               </div>
               
               <nav>
                  <a id="bb-nav-first" href="#" class="bb-custom-icon bb-custom-icon-first">First page</a>
                  <a id="bb-nav-prev" href="#" class="bb-custom-icon bb-custom-icon-arrow-left">Previous</a>
                  <a id="bb-nav-next" href="#" class="bb-custom-icon bb-custom-icon-arrow-right">Next</a>
                  <a id="bb-nav-last" href="#" class="bb-custom-icon bb-custom-icon-last">Last page</a>
               </nav>
            </div>
         </div>
      </div><!-- /container -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
      <script src="${root}/css/bookBlock/jquerypp.custom.js"></script>
      <script src="${root}/css/bookBlock/jquery.bookblock.js"></script>
      <script>
         var Page = (function() {
            
            var config = {
                  $bookBlock : $( '#bb-bookblock' ),
                  $navNext : $( '#bb-nav-next' ),
                  $navPrev : $( '#bb-nav-prev' ),
                  $navFirst : $( '#bb-nav-first' ),
                  $navLast : $( '#bb-nav-last' )
               },
               init = function() {
                  config.$bookBlock.bookblock( {
                     speed : 800,
                     shadowSides : 0.8,
                     shadowFlip : 0.7
                  } );
                  initEvents();
               },
               initEvents = function() {
                  
                  var $slides = config.$bookBlock.children();

                  // add navigation events
                  config.$navNext.on( 'click touchstart', function() {
                     config.$bookBlock.bookblock( 'next' );
                     return false;
                  } );

                  config.$navPrev.on( 'click touchstart', function() {
                     config.$bookBlock.bookblock( 'prev' );
                     return false;
                  } );

                  config.$navFirst.on( 'click touchstart', function() {
                     config.$bookBlock.bookblock( 'first' );
                     return false;
                  } );

                  config.$navLast.on( 'click touchstart', function() {
                     config.$bookBlock.bookblock( 'last' );
                     return false;
                  } );
                  
                  // add swipe events
                  $slides.on( {
                     'swipeleft' : function( event ) {
                        config.$bookBlock.bookblock( 'next' );
                        return false;
                     },
                     'swiperight' : function( event ) {
                        config.$bookBlock.bookblock( 'prev' );
                        return false;
                     }
                  } );

                  // add keyboard events
                  $( document ).keydown( function(e) {
                     var keyCode = e.keyCode || e.which,
                        arrow = {
                           left : 37,
                           up : 38,
                           right : 39,
                           down : 40
                        };

                     switch (keyCode) {
                        case arrow.left:
                           config.$bookBlock.bookblock( 'prev' );
                           break;
                        case arrow.right:
                           config.$bookBlock.bookblock( 'next' );
                           break;
                     }
                  } );
               };

               return { init : init };

         })();
      </script>
      <script>
            Page.init();
      </script>
      </c:if>   
      
   <c:if test="${area=='종로구'}">   
      <div class="container">
      
         <header>
            <h1>BookBlock <span>A Content Flip Plugin</span></h1>   
            <nav class="codrops-demos">
               <a class="current-demo" href="index.html">Demo 1</a>
               <a href="index2.html">Demo 2</a>
               <a href="index3.html">Demo 3</a>
               <a href="index4.html">Demo 4</a>
               <a href="index5.html">Demo 5</a>
            </nav>
         </header>
         <div class="main clearfix">
            <div class="bb-custom-wrapper">
               <h3>Illustrations by <a href="http://dribbble.com/kevinhowdeshell">You And I </a></h3>
               <div id="bb-bookblock" class="bb-bookblock">
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=종로구&thema=park"><img src="${root}/resources/img/park/finalPark11.png" alt="image01"/></a>
                     <br/><br/>
                     <h3>Thema 공원 테마</h3>
                  </div>
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=종로구&thema=art"><img src="${root}/resources/img/park/finalArt11.jpg" alt="image02"/></a>
                     <br/><br/>
                     <h3>Thema 미술관 테마</h3>
                  </div>
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=종로구&thema=concert"><img src="${root}/resources/img/park/finalConcert11.jpg" alt="image03"/></a>
                     <br/><br/>
                     <h3>Thema 콘서트 테마</h3>
                  </div>
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=종로구&thema=theaters"><img src="${root}/resources/img/park/finalTheaters11.jpg" alt="image04"  /></a>
                     <br/><br/>
                     <h3>Thema 영화관 테마</h3>
                  </div>
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=종로구&thema=shopping"><img src="${root}/resources/img/park/finalSopping.jpg" alt="image05"/></a>
                     <br/><br/>
                     <h3>Thema 쇼핑 테마</h3>
                  </div>
                  
                  <div class="bb-item">
                     <a href="${root}/placesearch/parkthema.do?area=종로구&thema=play"><img src="${root}/resources/img/park/finalSopping.jpg" alt="image05"/></a>
                     <br/><br/>
                     <h3>Thema 놀이 테마</h3>
                  </div>
               </div>
               
               <nav>
                  <a id="bb-nav-first" href="#" class="bb-custom-icon bb-custom-icon-first">First page</a>
                  <a id="bb-nav-prev" href="#" class="bb-custom-icon bb-custom-icon-arrow-left">Previous</a>
                  <a id="bb-nav-next" href="#" class="bb-custom-icon bb-custom-icon-arrow-right">Next</a>
                  <a id="bb-nav-last" href="#" class="bb-custom-icon bb-custom-icon-last">Last page</a>
               </nav>
            </div>
         </div>
      </div><!-- /container -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
      <script src="${root}/css/bookBlock/jquerypp.custom.js"></script>
      <script src="${root}/css/bookBlock/jquery.bookblock.js"></script>
      <script>
         var Page = (function() {
            
            var config = {
                  $bookBlock : $( '#bb-bookblock' ),
                  $navNext : $( '#bb-nav-next' ),
                  $navPrev : $( '#bb-nav-prev' ),
                  $navFirst : $( '#bb-nav-first' ),
                  $navLast : $( '#bb-nav-last' )
               },
               init = function() {
                  config.$bookBlock.bookblock( {
                     speed : 800,
                     shadowSides : 0.8,
                     shadowFlip : 0.7
                  } );
                  initEvents();
               },
               initEvents = function() {
                  
                  var $slides = config.$bookBlock.children();

                  // add navigation events
                  config.$navNext.on( 'click touchstart', function() {
                     config.$bookBlock.bookblock( 'next' );
                     return false;
                  } );

                  config.$navPrev.on( 'click touchstart', function() {
                     config.$bookBlock.bookblock( 'prev' );
                     return false;
                  } );

                  config.$navFirst.on( 'click touchstart', function() {
                     config.$bookBlock.bookblock( 'first' );
                     return false;
                  } );

                  config.$navLast.on( 'click touchstart', function() {
                     config.$bookBlock.bookblock( 'last' );
                     return false;
                  } );
                  
                  // add swipe events
                  $slides.on( {
                     'swipeleft' : function( event ) {
                        config.$bookBlock.bookblock( 'next' );
                        return false;
                     },
                     'swiperight' : function( event ) {
                        config.$bookBlock.bookblock( 'prev' );
                        return false;
                     }
                  } );

                  // add keyboard events
                  $( document ).keydown( function(e) {
                     var keyCode = e.keyCode || e.which,
                        arrow = {
                           left : 37,
                           up : 38,
                           right : 39,
                           down : 40
                        };

                     switch (keyCode) {
                        case arrow.left:
                           config.$bookBlock.bookblock( 'prev' );
                           break;
                        case arrow.right:
                           config.$bookBlock.bookblock( 'next' );
                           break;
                     }
                  } );
               };

               return { init : init };

         })();
      </script>
      <script>
            Page.init();
      </script>
   
   </c:if>   
      
   <c:if test="${area=='송파구'}">
      
      <br/><br/>
         <div style="text-align:center; ">   
         <figure class="figurefx pushup">
            <img src="${root}/resources/img/park.png" alt="An awesome picture" style="width:300px;height:180px;">   
            <figcaption><h3>공원 테마 </h3><a href="${root}/placesearch/parkthema.do?area=송파구&thema=park">A link</a></figcaption>
         </figure>
   
      
   
      <figure class="figurefx pushup" >
         <img src="${root}/resources/img/art.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>미술관 테마 </h3><a href="${root}/placesearch/parkthema.do?area=송파구&thema=art">A link</a></figcaption>
      </figure>      
      
         <figure class="figurefx pushup">
            <img src="${root}/resources/img/concert.png" alt="An awesome picture" style="width:300px;height:180px;">   
            <figcaption><h3>공연 </h3><a href="${root}/placesearch/parkthema.do?area=송파구&thema=concert">A link</a></figcaption>
         </figure>   
            
                  
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/movie.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>극장 테마 </h3><a href="${root}/placesearch/parkthema.do?area=송파구&thema=theaters">A link</a></figcaption>
      </figure>
            
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/shopping.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>쇼핑테마</h3><a href="${root}/placesearch/parkthema.do?area=송파구&thema=shopping">A link</a></figcaption>
      </figure>   
      
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/shopping.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>놀이테마</h3><a href="${root}/placesearch/parkthema.do?area=송파구&thema=play">A link</a></figcaption>
      </figure>
      <br/><br/>
      <br/><br/>   
      </div>   
   </c:if>
   
   <c:if test="${area=='강남구'}">
      <div style="text-align:center; ">
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/park.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>공원테마</h3><a href="${root}/placesearch/parkthema.do?area=강남구&thema=park">A link</a></figcaption>
      </figure>
      
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/art.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>미술관테마</h3><a href="${root}/placesearch/parkthema.do?area=강남구&thema=art">A link</a></figcaption>
      </figure>         
      
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/concert.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>공연테마</h3><a href="${root}/placesearch/parkthema.do?area=강남구&thema=concert">A link</a></figcaption>
      </figure>
      
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/movie.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>극장테마</h3><a href="${root}/placesearch/parkthema.do?area=강남구&thema=theaters">A link</a></figcaption>
      </figure>
      
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/shopping.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>쇼핑테마</h3><a href="${root}/placesearch/parkthema.do?area=강남구&thema=shopping">A link</a></figcaption>
      </figure>
      
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/shopping.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>놀이테마</h3><a href="${root}/placesearch/parkthema.do?area=강남구&thema=play">A link</a></figcaption>
      </figure>
      </div>
      <br/><br/>
      
      
   </c:if>
   
   <c:if test="${area=='종로구'}">
      
      <div style="text-align:center; ">
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/park.png"" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>공원테마</h3><a href="${root}/placesearch/parkthema.do?area=종로구&thema=park">A link</a></figcaption>
      </figure>
      
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/park.png"" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>미술관테마</h3><a href="${root}/placesearch/parkthema.do?area=종로구&thema=art">A link</a></figcaption>
      </figure>   
      
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/concert.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>공연테마</h3><a href="${root}/placesearch/parkthema.do?area=종로구&thema=concert">A link</a></figcaption>
      </figure>
      
      <br/><br/>
      
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/movie.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>극장테마</h3><a href="${root}/placesearch/parkthema.do?area=종로구&thema=theaters">A link</a></figcaption>
      </figure>
   
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/shopping.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>쇼핑테마</h3><a href="${root}/placesearch/parkthema.do?area=종로구&thema=shopping">A link</a></figcaption>
      </figure>
      
      <figure class="figurefx pushup">
         <img src="${root}/resources/img/shopping.png" alt="An awesome picture" style="width:300px;height:180px;">   
         <figcaption><h3>놀이테마</h3><a href="${root}/placesearch/parkthema.do?area=종로구&thema=play">A link</a></figcaption>
      </figure>
   </div>
      
   </c:if>
   </div>
   
   
</body>
</html>