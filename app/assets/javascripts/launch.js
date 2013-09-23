$(document).ready(function(){
	$("#team").on("click", function(){
		$(".launch-team").toggle();
		$(".launch-contact").hide();
	});


	$("#launch-contact-btn").on("click", function(){
		$(".launch-contact").toggle();
		$(".launch-team").hide();

	});

});