<?php get_header(); ?>

<div class="clear"></div>


<div class="clear"></div>
<div style="border-bottom:3px solid #ddd; padding:0px 10px 5px">
	<h3 class="ctle">Recommended Items</h3>
<div style="float:right">
<form method="get" action="<?php bloginfo('home'); ?>" >search <input type="text" id="search" class="tbox" value="Enter Keywords..." size="20" onfocus="if(this.value=='Enter Keywords...')this.value='';" onblur="if(this.value=='')this.value='Enter Keywords...';" name="s" /> <input type="submit" id="find" value="" /></form>
</div>

<div class="clear"></div>
</div>
<div style="padding-left:5px">

<table cellpadding="5" cellspacing="0" border="0" width="100%" class="tbproduct">
<?php 
get_template_part( 'loop', 'index' );?>

</table>

</div> 
<?php if (function_exists('wp_pagebar')) wp_pagebar(); ?>
<div class="clear"></div>




<?php get_sidebar(); ?>
<?php get_footer(); ?>
