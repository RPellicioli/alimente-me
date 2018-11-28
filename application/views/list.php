<section id="section-3" class="content flex column justify-start v-center">
	<div class="list-food flex column justify-start v-start">
		<h1 class="list-title">Sua lista</h1>
		
		<?php
			foreach($list as $key => $each){ ?>
				<div class="list-row width-full flex justify-between v-center">
					<div class="list-content">
						<h3 class="list-name">
							<?php echo $each->title ?>
						</h3>
						<span class="list-company">
							<?php echo $each->company ?>
						</span>
					</div>
					<div class="list-buttons flex v-center justify-between">
						<a href="<?php echo base_url('/detalhes'.'/'.$each->id_food) ?>" class="list-button details flex v-center">
							<img src="<?php echo base_url('assets/img/invoice.svg'); ?>" alt="Detalhes" class="list-details" />
						</a>
						<a href="<?php echo base_url('/list/delete/'.$each->id) ?>" class="list-button delete flex v-center">
							<img src="<?php echo base_url('assets/img/close.svg'); ?>" alt="Deletar" class="list-delete" />
						</a>
					</div>
				</div>
		<?php
			}
		?>
	</div>
</section>