<section id="section-2" class="content flex column justify-start v-center">
	<input type="hidden" id="total_foods" value="<?php echo $total; ?>" /> 
	<?php foreach($foods as $key => $food){ ?>		
		<div class="card card-food" id="card-<?php echo $key; ?>">
			<div class="card-img">
				<img src="<?php echo $food->path. '/' .$food->file; ?>" class="img-food" />
				<img src="<?php echo $food->path. '/' .$food->file_company; ?>" class="logo-company left"/>
			</div>
			
			<div class="card-title">
				<?php echo $food->title; ?>
			</div>

			<div class="box-card-buttons flex justify-center v-center">
				<button class="card-button">
					<img src="assets/img/dislike.svg" class="dislike" />
				</button>
				<button class="card-button" onclick="selectFood(<?php echo $key; ?>, '<?php echo $food->title; ?>', '<?php echo $food->company_title; ?>')">
					<img src="assets/img/like.svg" class="like" />
				</button>
			</div>
		</div>
	<?php } ?>
</section>