<?php get_header(); ?>

<div class="content">

  <?php if (have_posts()) : while (have_posts()) : the_post(); ?>

<?php $attachment_link = get_the_attachment_link($post->ID, true, array(450, 800)); // This also populates the iconsize for the next line ?>
<?php $_post = &get_post($post->ID); $classname = ($_post->iconsize[0] <= 128 ? 'small' : '') . 'attachment'; // This lets us style narrow icons specially ?>

		<div class="contentBlock">
		
			<h1><a href="<?php echo get_permalink($post->post_parent); ?>" rev="attachment"><?php echo get_the_title($post->post_parent); ?></a> &raquo; <a href="<?php echo get_permalink() ?>" rel="bookmark" title="Permanent Link: <?php the_title(); ?>"><?php the_title(); ?></a></h1>
				
			<div class="line"></div>
			
				<div class="contentCenter">
					<p><?php echo $attachment_link; ?></p>
					<p><strong><?php echo basename($post->guid); ?></strong></p>
					<?php the_content(); ?>
				</div>
			
		</div>


	<?php comments_template(); ?>

	<?php endwhile; else: ?>

		<div class="contentBlock">
			<h1>Not Found</h1>
			<div class="line"></div>
			<p>Sorry, but you are looking for something that isn't here.</p>
		</div>

<?php endif; ?>

	<div class="footer">
		Designed by <a href="http://www.romow.com" title="Romow Web Directory">Romow Web Directory</a> and Sponsored by <a href="http://www.avivadirectory.com" title="Aviva Web Directory">Aviva Web Directory</a>. Powered by <a href="http://www.wordpress.org">Wordpress</a>.
	</div>				
</div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>
