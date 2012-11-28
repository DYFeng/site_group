<!--head start!!!-->
<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Reviews and Discount:<?php foreach((get_the_category()) as $cat){echo $cat->category_description;}?><?php if($paged>1) { echo (' – Page '); echo ($paged);}?></title>
<meta name="keywords" content="<? echo $cat->cat_name;?>,<? echo $cat->category_description;?>" />
<meta name="description" content="<? echo $cat->category_description;?><?php if($paged>1) { echo (' – Page '); echo ($paged);}?>" />
<?php $url = 'http://'.$_SERVER["HTTP_HOST"].$_SERVER['REQUEST_URI'];   
if ((strpos("$url","/page/")==false))   
{ ?><?php } else { ?><meta name="robots" content="noindex,follow" /><?php } ?> 
<link rel="profile" href="http://gmpg.org/xfn/11" />
<link href="/theme/main.css" rel="stylesheet" type="text/css" />
<link href="/theme/three-slide.css" rel="stylesheet" type="text/css" />
<link href="/theme/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/theme/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="/theme/js/first.js"></script>
<script type="text/javascript" src="/theme/js/three-slide.js"></script>
<link rel="icon" href="/theme/images/favicon.png" type="image/x-icon">
<body>
<div class="95824ot" id="outter">
  <div class="95824in" id="inner">
    <div class="95824hd" id="header">
        <div id="slogan"><h1><a href="/<?php echo $cat->category_nicename;?>" title="<?php echo $cat->category_description; ?>"><?php echo $cat->category_description; ?></a></h1>
        <h2><?php echo $cat->category_description; ?> - <?php bloginfo('description'); ?> </h2>
</div>
</div>

<div class="95824bar" id="sidebar">

<ul class="95824menu" id="menu">
<li><a href="<?php bloginfo('url'); ?>" title="<?php bloginfo( 'name' ); ?>" rel="home"><img src="/theme/images/home.gif"><span>Home</span></a></li>
<?php wp_list_categories('orderby=name&include=8,9,4,5,6,7,10,11,12&title_li='); ?>
</ul>

<br class="clear" /></div>

<div class="95824tent" id="content">
<div class="95824left" id="leftbox">
<div class="inbox">
<div>

<div><div style="margin:-3px 0px 0px 0px; text-align:center">



</div></div></div>
<div class="clear"></div>

<!--header end-->

<div class="clear"></div>
	<h3 class="ctle"><a href="/<?php echo $cat->category_nicename;?>" title="<?php echo $cat->category_description;?>"><?php echo $cat->cat_name;?></a></h3>
<div class="clear"></div>
<div style="border-bottom:3px solid #ddd; padding:0px 10px 5px">
<div style="float:right">
<form method="get" action="<?php bloginfo('home'); ?>" >search <input type="text" id="search" class="tbox" value="Enter Keywords..." size="20" onfocus="if(this.value=='Enter Keywords...')this.value='';" onblur="if(this.value=='')this.value='Enter Keywords...';" name="s" /> <input type="submit" id="find" value="" /></form>
</div>
<div style="float:left; margin:5px 0px 0px 5px;">
<?php echo $cat->category_description;?>
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
