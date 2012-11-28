<?php get_header(); ?>

<div class="content">

	<?php if (have_posts()) : ?>

		<h2 class="pagetitle">Search Results</h2>


		<?php while (have_posts()) : the_post(); ?>

			<div class="contentBlock">
				<div class="postDate">
					<?php the_time('M'); ?>
					<div><?php the_time('j'); ?></div>
				</div>
				<h1><a href="<?php the_permalink(); ?>"><?php the_title(); ?></a></h1>
				<div class="postCats"><?php the_category(', '); ?></div>
				<div class="postComments"><?php comments_popup_link('No Comments', '1 Comment', '% Comments'); ?></div>
				<div class="line"></div>
				<?php the_excerpt(); ?>
			</div>

		<?php endwhile; ?>

		<div class="navigation">
			<div class="alignleft"><?php next_posts_link('&laquo; Previous Entries') ?></div>
			<div class="alignright"><?php previous_posts_link('Next Entries &raquo;') ?></div>
		</div>

	<?php else : ?>

		<div class="contentBlock">
			<h1>Not Found</h1>
			<div class="line"></div>
			<p>No posts met your search criteria. Please do another search.</p>
		</div>


	<?php endif; ?>

	<div class="footer">
		Designed by <a href="http://www.romow.com" title="Romow Web Directory">Romow Web Directory</a> and Sponsored by <a href="http://www.avivadirectory.com" title="Aviva Web Directory">Aviva Web Directory</a>. Powered by <a href="http://www.wordpress.org">Wordpress</a>.
	</div>				
</div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>