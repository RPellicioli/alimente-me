<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->helper('url');
	}

	public function index()
	{
		$this->load->model('food_m');

		$foods = $this->food_m->get();

		//die(var_dump($foods[0]));
		
		$this->load->view('main', array(
			'foods' => $foods,
			'total' => count($foods),
			'content' => 'content'
		));
	}

	public function list(){
		$this->load->model('list_m');
		$list = $this->list_m->get(1);

		$this->load->view('main', array('content' => 'list', 'list' => $list));
	}

	public function details($id){
		$this->load->model('food_m');
		$food = $this->food_m->get($id);

		if(count($food) == 0)
			die(var_dump('Nenhum prato encontrado.'));

		$this->load->view('main', array('content' => 'details', 'food' => $food[0]));
	}
}
