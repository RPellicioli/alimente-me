<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller {
	function __construct(){
		parent::__construct();
		$this->load->helper('url');
	}

	public function index()
	{
		if($this->logged())
			$this->content();
	}

	public function logged(){
		if(!isset($_SESSION['user'])){
			$this->login();

			return false;
		}

		return true;
	}

	public function content(){
		$this->load->model('food_m');
		$foods = $this->food_m->get();

		//die(var_dump($foods[0]));
		
		$this->load->view('main', array(
			'foods' => $foods,
			'total' => count($foods),
			'content' => 'content'
		));
	}

	public function login_send(){
		$data = $this->input->post();

		$this->load->model('user_m');
		$result = array('status' => FALSE);

		$user = $this->user_m->get(
			array(
				'where' => array(
					'email' => $data['email'],
					'password' => $data['password'] 
				)
			)
		);
		
		if($user){
			$_SESSION['user'] = $user;
			$this->content();
		}
		else{
			$this->login();
		}
	}

	public function login(){
		$_SESSION['user'] = array();
		$this->load->view('main', array('content' => 'login', 'hide_menu' => TRUE));
	}

	public function list(){
		$this->load->model('list_m');
		$list = $this->list_m->get(1);

		$this->load->view('main', array('content' => 'list', 'list' => $list));
	}

	public function list_delete($id=0){
		$this->load->model('list_m');
		$delete = $this->list_m->delete($id);
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

	public function list_add($id_food){
		$this->load->model('list_m');
		$food = $this->list_m->insert(array('id_user' => 1, 'id_food' => $id_food));
	}
}
