<section id="section-4" class="content flex column justify-start v-center">
	<div class="content-details">
		<h1 class="list-title margin-title"><?php echo $food->title ?></h1>
		<span class="list-company">
			<?php echo $food->company_title ?>
		</span>
		<div class="card-img details-img">
			<img src="<?php echo base_url($food->path. '/' .$food->file); ?>" class="img-food" />
			<img src="<?php echo base_url($food->path. '/' .$food->file_company); ?>" class="logo-company left"/>
		</div>
		<div class="text-details">
			<?php echo $food->text ?>
		</div>
		<div class="details-buttons flex v-center justify-between">
			<div class="rating flex v-center">
				<?php echo number_format($food->rating, 1, ',', ' '); ?>
				<img src="<?php echo base_url('assets/img/star.svg'); ?>" class="star" />
			</div>
			<button class="list-button reserve flex v-center btn-reserve">
				Reservar
			</button>
		</div>
	</div>
</section>