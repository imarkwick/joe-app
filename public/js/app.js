$(document).ready(function() {
	$('#track-one').click(function() {
		$(this).toggleClass('onetoggle');
	});
	$('#track-two').click(function() {
		$(this).toggleClass('twotoggle');
	});
	$('#track-three').click(function() {
		$(this).toggleClass('threetoggle');
	});
});

var spinner = function(){
 $('.sk-spinner-wandering-cubes').show();
 $('.artist').css("opacity", ".6");
}

$("audio").on("play", function(){
  var _this = $(this);
  $("audio").each(function(i,el){
    if(!$(el).is(_this))
    $(el).get(0).pause();
  });
});


