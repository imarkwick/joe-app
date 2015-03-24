$(document).ready(function() {
	// $('#track-one').click(function() {
	// 	$(this).toggleClass('onetoggle');
	// });
	// $('#track-two').click(function() {
	// 	$(this).toggleClass('twotoggle');
	// });
	// $('#track-three').click(function() {
	// 	$(this).toggleClass('threetoggle');
	// });

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
});

var tracks = (document).getElementsByTagName('audio');

var trackArray = Array.prototype.slice.call(tracks)

var startNext = function(position) {
	//check in here if this is last track
	//if it is, loop back to start
	trackArray[position + 1].play();
}