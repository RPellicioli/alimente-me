var $total_foods = 0;
var $list_selecteds = [];
var $cards_actives = [];

$(document).ready(function(){
	$('#section-4').addClass('active');
	$total_foods = $('#total_foods').val();

	for(var i = 0; i < $total_foods; i++){
		$cards_actives.push(i);
	}

	randomFood();

	$('#icon-menu').click(function(){
		$('#content-menu').addClass('show-menu');
	});
	
	$('.close-menu').click(function(){
		$('#content-menu').removeClass('show-menu');
	});
	
	$('#mask-video').click(function(){
		$(this).fadeOut();
	});
	
	$('#form-login').on('submit', function(){
		var email = $('#email').val();
		var pass = $('#password').val();
	
		if(email == "pellicioli_r@hotmail.com" && pass == "asdfg"){
			pagination(2);
		}
		else{
			alert('Login inválido!');
		}
	
		$('#email').val("");
		$('#password').val("");
	});
	
	$('#logout').click(function(){
		pagination(1);
	});
});

function pagination(page){
	$('.content').hide();
	$('#section-' + page).show();
	$('#section-' + page).focus();

	if(page == 2){
		randomFood();
	}
}

function selectFood(pos, name, company){
	var food = {
		"name": name,
		"company": company
	};

	$cards_actives.splice(pos, 1);

	$list_selecteds.push(food);
	randomFood();
}

function randomFood(){
	$('.card-food').hide();
	var activeCard = $cards_actives[Math.floor(Math.random()*$cards_actives.length)];
	$('#card-' + activeCard).show();
}