<?php get_header(); ?>

<div class="content">

		<?php if (have_posts()) : while (have_posts()) : the_post(); ?>
			<div class="contentBlock">
				<div class="postDate">
					<?php the_time('M'); ?>
					<div><?php the_time('j'); ?></div>
				</div>
				<h1><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h1>
				<div class="postCats"><?php the_category(', '); ?></div>
				<div class="line"></div>
					
				<?php the_content(); ?>
				

			</div>


		<?php endwhile; endif; ?>
		
	<div class="footer">
		Designed by <a href="http://www.romow.com" title="Romow Web Directory">Romow Web Directory</a> and Sponsored by <a href="http://www.avivadirectory.com" title="Aviva Web Directory">Aviva Web Directory</a>. Powered by <a href="http://www.wordpress.org">Wordpress</a>.
	</div>				
</div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>