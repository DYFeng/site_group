<?php get_header(); ?>

<div class="content">

		<?php if (have_posts()) : ?>

		 <?php $post = $posts[0]; // Hack. Set $post so that the_date() works. ?>
<?php /* If this is a category archive */ if (is_category()) { ?>
		<h2 class="pagetitle">Archive for the &#8216;<?php echo single_cat_title(); ?>&#8217; Category</h2>

 	  <?php /* If this is a daily archive */ } elseif (is_day()) { ?>
		<h2 class="pagetitle">Archive for <?php the_time('F jS, Y'); ?></h2>

	 <?php /* If this is a monthly archive */ } elseif (is_month()) { ?>
		<h2 class="pagetitle">Archive for <?php the_time('F, Y'); ?></h2>

		<?php /* If this is a yearly archive */ } elseif (is_year()) { ?>
		<h2 class="pagetitle">Archive for <?php the_time('Y'); ?></h2>

	  <?php /* If this is an author archive */ } elseif (is_author()) { ?>
		<h2 class="pagetitle">Author Archive</h2>

		<?php /* If this is a paged archive */ } elseif (isset($_GET['paged']) && !empty($_GET['paged'])) { ?>
		<h2 class="pagetitle">Blog Archives</h2>

		<?php } ?>

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
				<?php the_content('Read the rest of this entry &raquo;'); ?>
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
			<p>Sorry, but you are looking for something that isn't here.</p>
		</div>

	<?php endif; ?>

	<div class="footer">
		Designed by <a href="http://www.romow.com" title="Romow Web Directory">Romow Web Directory</a> and Sponsored by <a href="http://www.avivadirectory.com" title="Aviva Web Directory">Aviva Web Directory</a>. Powered by <a href="http://www.wordpress.org">Wordpress</a>.
	</div>				
</div>

<?php get_sidebar(); ?>

<?php get_footer(); ?>
