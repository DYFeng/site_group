<?php get_header(); ?>

	
<div class="clear"></div>
<div style="border-bottom:3px solid #ddd; padding:0px 10px 5px">
<div style="float:right">
<form method="get" action="<?php bloginfo('home'); ?>" >search <input type="text" id="search" class="tbox" value="Enter Keywords..." size="20" onfocus="if(this.value=='Enter Keywords...')this.value='';" onblur="if(this.value=='')this.value='Enter Keywords...';" name="s" /> <input type="submit" id="find" value="" /></form>
</div>
<div style="float:left; margin:5px 0px 0px 5px;">
<h3 class="ctle"><?php printf( __( 'Search Results for: %s', 'iBluety' ), '<span>' . get_search_query() . '</span>' ); ?></h3>
</div>
<div class="clear"></div>
</div>
<script type="text/javascript">
function search2(){var search=$('#search').val();if(search=='Enter Keywords...')search='';if(search.indexOf('/')>=0)alert("not allowed '/'");else window.location.href='/empire-rugs/'+(search?'search-'+search:'');}
</script>
<hr class="ln" />

<table cellpadding="5" cellspacing="0" border="0" width="100%" class="tbproduct">

<?php //prinf
get_template_part( 'loop', 'category' );?>

</table>

<?php if (function_exists('wp_pagebar')) wp_pagebar(); ?>

<div class="clear"></div>

<?php get_sidebar(); ?>
<?php get_footer(); ?>
