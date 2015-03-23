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
	$('.artist').css("opacity", ".5");
}

$("audio").on("play", function(){
  var _this = $(this);
  $("audio").each(function(i,el){
    if(!$(el).is(_this))
    $(el).get(0).pause();
  });
});

var audio = (document).getElementsByTagName('audio');
// onend

var run = function() {
	// for (i = 0; len = audio.length; i < len; i++) {
	// 	track = audio[i];
	// 	console.log(i);
	// }
}

$('audio').bind('ended', function() {
	for (i = 1; i < audio.length; i++) {
		track = audio[i];
		track.play();
		console.log(i);
	}
});

