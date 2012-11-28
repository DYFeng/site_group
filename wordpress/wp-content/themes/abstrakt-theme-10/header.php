<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" <?php language_attributes(); ?>>

<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="<?php bloginfo('html_type'); ?>; charset=<?php bloginfo('charset'); ?>" />

<title><?php bloginfo('name'); ?> <?php if ( is_single() ) { ?> &raquo; Blog Archive <?php } ?> <?php wp_title(); ?></title>

<meta name="generator" content="WordPress <?php bloginfo('version'); ?>" /> <!-- leave this for stats -->

<link rel="stylesheet" href="<?php bloginfo('stylesheet_url'); ?>" type="text/css" media="screen" />

</head>
<body>

	<div class="container">
		<div class="search">
			<form id="searchform" method="get" action="<?php bloginfo('home'); ?>">
				<div>
					<input type="text" name="s" id="s" class="s" size="15" />
					<input type="submit" class="ss" value="" />
				</div>
			</form>
		</div>
		<div class="head">
		</div>
		<div class="menu">
			<div class="menuLeft"></div>
			<div class="menuRight"></div>
			
			<ul>
				<li><a href="<?php echo get_option('home'); ?>/">Home</a></li>
				<?php wp_list_pages('title_li='); ?> 
			</ul>

		</div>
		<div class="center">