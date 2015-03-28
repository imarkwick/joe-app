$(document).ready(function() {

	var spinner = function() {
		$('.sk-spinner-wandering-cubes').show();
		$('.artist').css("opacity", ".5");
	};

	$("audio").on("play", function() {
	  var _this = $(this);
	  $("audio").each(function(i,el) {
	    if(!$(el).is(_this))
	    $(el).get(0).pause();
	  });
	});
});

var tracks = document.getElementsByTagName('audio');
var trackArray = Array.prototype.slice.call(tracks);

var startNext = function(position) {
	//check in here if this is last track
	//if it is, loop back to start
	trackArray[position + 1].play();
}

function playTune(position) { 
	var track = trackArray[position];
	trackArray[position].play();
	
	var play = track.className;
	var pause = 'Paused' + play;

	var element = document.getElementById(play);
	var otherElement = document.getElementById(pause);

	element.style.display = 'none';
	otherElement.style.display = 'inline-block';

	console.log(findPosition());
};

function pauseTune(position) {
	var track = trackArray[position]
	track.pause();

	var play = track.className;
	var pause = 'Paused' + play;

	var element = document.getElementById(play);
	var otherElement = document.getElementById(pause);
	
	
	otherElement.style.display = 'none';
	element.style.display = 'inline-block';
}










