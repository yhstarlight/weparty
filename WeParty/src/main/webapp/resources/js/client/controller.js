$(function(){
    var current = 0;
    var max = 0;
    var container;
    var interval;
    var xml;
    
    function init(){
        container = $(".slide ul");
        max = container.children().length;
        
        events();
        
        interval = setInterval(next, 3000);
        
    }
    function events(){
        $("button.prev").on("click",prev);
        $("button.next").on("click",next);
    }
    
    function prev(e){
        current--;
        if( current < 0 ) current = max-1;
        animate();
    }
    function next(e){
        current++;
        if(current >max-1 ) current = 0;
        animate();
    }
    function animate(){
        var moveX = current * 350;
        TweenMax.to(container, 0.8, {marginLeft:"-" + moveX + "px", ease:Expo.easeOut } );
    
        clearInterval(interval);
        interval = setInterval(next, 3000);
        

    }
     $( document ).ready(init);
     
});