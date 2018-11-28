<section id="food" class="content flex column justify-start v-center">
	<input type="hidden" id="total_foods" value="<?php echo $total; ?>" /> 
	<?php foreach($foods as $key => $food){ ?>		
		<div class="card card-food" id="card-<?php echo $key; ?>">
			<div class="card-img">
				<img src="<?php echo base_url($food->path. '/' .$food->file); ?>" class="img-food" />
				<img src="<?php echo base_url($food->path. '/' .$food->file_company); ?>" class="logo-company left"/>
			</div>
			
			<div class="card-title">
				<?php echo $food->title; ?>
			</div>

			<div class="box-card-buttons flex justify-center v-center">
				<button class="card-button">
					<img src="<?php echo base_url('assets/img/dislike.svg'); ?>" class="dislike" />
				</button>
				<button class="card-button" onclick="selectFood(<?php echo $food->id; ?>, <?php echo $key; ?>)">
					<img src="<?php echo base_url('assets/img/like.svg'); ?>" class="like" />
				</button>
			</div>
		</div>
	<?php } ?>
	<div class="empty flex v-center <?php echo $total == 0 ? 'show' : ''; ?>">
		Nenhum prato encontrado.
	</div>
</section>

<script src="<?php echo base_url('assets/js/food.js'); ?>"></script>