<?php
defined('BASEPATH') OR exit('No direct script access allowed');
?><!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="theme-color" content="#5C0090">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="cleartype" content="on">

    <title>Alimente-me</title>

	<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/style.css') ?>">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/flex.css') ?>">
	<link rel="shortcut icon" type="image/x-icon" href="<?php echo base_url('assets/img/favicon.ico') ?>">
    <link href="https://fonts.googleapis.com/css?family=Barlow:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Indie+Flower" rel="stylesheet">
</head>
<body>
	<main id="main">
		<div id="mask"></div>
		<div id="content-menu" class="flex column justify-start v-center">
			<ul>
				<li>
					<a>
						MENU
					</a>
				</li>
				<li>
					<a href="<?php echo base_url() ?>">
						Inicio
					</a>
				</li>
				<li>
					<a href="<?php echo base_url('/lista') ?>">
						Sua Lista
					</a>
				</li>
				<li>
					<a id="logout">
						Sair
					</a>
				</li>
			</ul>

			<button class="close close-menu">
				<img src="<?php echo base_url('assets/img/close.svg') ?>" />
			</button>
		</div>

		<header id="header">
			<?php $this->load->view('menu'); ?>
		</header>

		<?php $this->load->view($content); ?>

		<!-- MODAL -->
		<div class="modal">
			<h4 class="title-modal">Faça sua reserva</h4>
			<form class="flex justify-start v-center column">
				<input type="text" name="date" id="date" class="input" placeholder="Data" />
				<input type="text" name="hour" id="hour" class="input" placeholder="Hora: 21:00" />

				<div class="flex justify-center v-center">
					<button type="button" class="list-button close-modal reserve cancel flex v-center">
						Cancelar
					</button>

					<button type="submit" class="list-button reserve flex v-center">
						Enviar
					</button>
				</div>
			</form>
		</div>
		<div class="mask"></div>

		<footer id="footer">
			Copyright 2018
		</footer>
	</main>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="<?php echo base_url('assets/js/script.js') ?>"></script>
</body>
</html>