$(document).ready(function(){
	$('#icon-menu').click(function(){
		$('#content-menu').addClass('show-menu');
	});
	
	$('.close-menu').click(function(){
		$('#content-menu').removeClass('show-menu');
	});
	
	$('#mask-video').click(function(){
		$(this).fadeOut();
	});

	$('.btn-reserve').click(function(){
		$('.modal').addClass('active-modal');
		$('.mask').addClass('active-mask');
	});

	$('.close-modal').click(function(){
		$('.modal').removeClass('active-modal');
		$('.mask').removeClass('active-mask');
	});

	if($('#food').length > 0){
		init_foods();
	}
});