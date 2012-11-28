<div class="sidebar">
	<ul>
	<?php if ( function_exists('dynamic_sidebar') && dynamic_sidebar('sidebar 1') ) : else : ?>
		<?php wp_list_categories('orderby=name&show_count=0&title_li=<h2>Categories</h2>'); ?>
		<li>
			<h2>Archives</h2>
			<ul>
				<?php wp_get_archives('type=monthly&limit=12'); ?>
			</ul>
		</li>
		<li>
			<h2>Blogroll</h2>
			<ul>
				<?php get_links(-1, '<li>', '</li>', 'between', FALSE, 'name', FALSE, FALSE, -1, FALSE); ?>
			</ul>
		</li>
	<?php endif; ?>
	</ul>
	<div class="sidebarBottom"></div>
</div>