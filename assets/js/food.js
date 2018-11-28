var $total_foods = 0;
var $list_selecteds = [];
var $cards_actives = [];

function init_foods(){
	$total_foods = $('#total_foods').val();

	for(var i = 0; i < $total_foods; i++){
		$cards_actives.push(i);
	}

	randomFood();
}

function selectFood(id, pos){
	$.post( "http://localhost/alimente-me/list/insert/"+id, { id_food: id, id_user: 1 });

	$cards_actives.splice(pos, 1);
	randomFood();
}

function randomFood(){
	$('.card-food').hide();
	var activeCard = $cards_actives[Math.floor(Math.random()*$cards_actives.length)];
	$('#card-' + activeCard).show();
}