<section id="section-1" class="content vh-full flex justify-center v-center">
	<div class="box-login card">
		<div class="header-login flex justify-center v-center">
			LOGIN
		</div>
		<form id="form-login" class="flex column justify-start v-start">
			<label>
				E-mail
			</label>
			<input type="email" id="email" name="email" class="input" autocomplete="off" />

			<label>
				Senha
			</label>
			<input type="password" id="password" name="password" class="input" />

			<div class="box-buttons flex column v-center justify-center">
				<button type="submit" id="login" class="button-default">Entrar</button>

				<a href="#" id="register">
					Cadastrar-se
				</a>
			</div>
		</form>
	</div>
</section>

<section id="section-2" class="content flex column justify-start v-center">
	<input type="hidden" id="total_foods" value="<?php echo count($foods); ?>" /> 
	<?php foreach($foods as $key => $food){ ?>		
		<div class="card card-food" id="card-<?php echo $key; ?>">
			<div class="card-img">
				<img src="<?php echo $food["image"]; ?>" class="img-food" />
				<img src="<?php echo $food["logo"]; ?>" class="logo-company <?php echo $food["class-logo"]; ?>"/>
			</div>
			
			<div class="card-title">
				<?php echo $food["name"]; ?>
			</div>

			<div class="box-card-buttons flex justify-center v-center">
				<button class="card-button">
					<img src="assets/img/dislike.svg" class="dislike" />
				</button>
				<button class="card-button" onclick="selectFood(<?php echo $key; ?>, '<?php echo $food["name"]; ?>', '<?php echo $food["company"]; ?>')">
					<img src="assets/img/like.svg" class="like" />
				</button>
			</div>
		</div>
	<?php } ?>
</section>

<section id="section-3" class="content flex column justify-start v-center">
	<div class="list-food flex column justify-start v-start">
		<h1 class="list-title">Sua lista</h1>
		<div class="list-row width-full flex justify-between v-center">
			<div class="list-content">
				<h3 class="list-name">
					Agnoline
				</h3>
				<span class="list-company">
					Di Paollo
				</span>
			</div>
			<div class="list-buttons flex v-center justify-between">
				<button class="list-button details flex v-center">
					<img src="assets/img/invoice.svg" alt="Detalhes" class="list-details" />
				</button>
				<button class="list-button delete flex v-center">
					<img src="assets/img/close.svg" alt="Deletar" class="list-delete" />
				</button>
			</div>
		</div>

		<div class="list-row width-full flex justify-between v-center">
			<div class="list-content">
				<h3 class="list-name">
					Massa ao Pesto
				</h3>
				<span class="list-company">
					Cantina Toldo
				</span>
			</div>
			<div class="list-buttons flex v-center justify-between">
				<button class="list-button details flex v-center">
					<img src="assets/img/invoice.svg" alt="Detalhes" class="list-details" />
				</button>
				<button class="list-button delete flex v-center">
					<img src="assets/img/close.svg" alt="Deletar" class="list-delete" />
				</button>
			</div>
		</div>

		<div class="list-row width-full flex justify-between v-center">
			<div class="list-content">
				<h3 class="list-name">
					Bife à Cavalo
				</h3>
				<span class="list-company">
					Restaurante Tranquilo
				</span>
			</div>
			<div class="list-buttons flex v-center justify-between">
				<button class="list-button details flex v-center">
					<img src="assets/img/invoice.svg" alt="Detalhes" class="list-details" />
				</button>
				<button class="list-button delete flex v-center">
					<img src="assets/img/close.svg" alt="Deletar" class="list-delete" />
				</button>
			</div>
		</div>
	</div>
</section>

<section id="section-4" class="content flex column justify-start v-center">
	<div class="content-details">
		<h1 class="list-title margin-title">Bife à Cavalo</h1>
		<span class="list-company">
			Restaurante Tranquilo
		</span>
		<div class="card-img details-img">
			<img src="<?php echo $foods[3]["image"]; ?>" class="img-food" />
			<img src="<?php echo $foods[3]["logo"]; ?>" class="logo-company <?php echo $foods[0]["class-logo"]; ?>"/>
		</div>
		<div class="text-details">
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac pharetra augue. Sed vel tristique tellus, ac mattis ex. Donec ut sem quis massa suscipit elementum at vel odio.
		</div>
		<div class="details-buttons flex v-center justify-end">
			<button class="list-button reserve flex v-center">
				Reservar
			</button>
		</div>
	</div>
</section>