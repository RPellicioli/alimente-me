<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->helper('url');
	}

	public function index()
	{
		$foods = array(
			array(
				"name" => "Agnoline", 
				"image" => "assets/img/food-0.jpg",
				"logo" => "assets/img/logo-0.png",
				"company" => 'Di Paollo',
				"class-logo" => 'right'
			),
			array(
				"name" => "Massa ao Pesto", 
				"image" => "assets/img/food-1.jpg",
				"logo" => "assets/img/logo-1.jpg",
				"company" => 'Cantina Toldo',
				"class-logo" => 'left'
			),
			array(
				"name" => "À Parmegiana", 
				"image" => "assets/img/food-2.jpg",
				"logo" => "assets/img/logo-2.jpg",
				"company" => 'Restaurante Andrea',
				"class-logo" => 'left'
			),
			array(
				"name" => "Bife à Cavalo", 
				"image" => "assets/img/food-3.jpg",
				"logo" => "assets/img/logo-3.png",
				"company" => 'Restaurante Tranquilo',
				"class-logo" => 'right'
			),
		);
		
		$this->load->view('main', array('foods' => $foods));
	}
}
