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
		$this->load->view('main', array('content', 'list'));
	}
}
