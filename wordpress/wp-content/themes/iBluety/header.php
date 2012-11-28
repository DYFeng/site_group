<!DOCTYPE HTML>
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php if (is_single() || is_page() || is_archive()) { echo('Reviews & Discount:'); wp_title(''); } else { bloginfo('name'); }?><?php if($paged>1) { echo (' – Page '); echo ($paged);}?></title>
<link rel="profile" href="http://gmpg.org/xfn/11" />
<?if (is_home()&!is_paged()){
$description = "American Girl dolls coupons code? Free shipping? Yes! Free shipping for American Girl dolls, clothes and gifts for girls. We have more American Girl dolls coupons codes.";
$keywords = "American Girl Free Shipping, American Girl Doll Coupons Code, American Girl Dolls For Sale";
} elseif (is_single()){
$description = $post->post_title ;
$keywords = "";
$tags = wp_get_post_tags($post->ID);
foreach ($tags as $tag ) {
$keywords = $keywords . $tag->name . ", ";
}} 
?>
<meta name="keywords" content="<?=$keywords?>" />
<meta name="description" content="<?=$description?>" />
<?php $url = 'http://'.$_SERVER["HTTP_HOST"].$_SERVER['REQUEST_URI'];   
if ((strpos("$url","/page/")==false))   
{ ?><?php } else { ?><meta name="robots" content="noindex,follow" /><?php } ?> 
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
        <div id="slogan"><h1><a href="<?php echo home_url( '/' ); ?>" title="<?php if (is_single() || is_page() ) { wp_title(''); } else if (is_category()) { echo category_description();} else { bloginfo('name'); } ?>" rel="home"><?php if ( is_page() ) { wp_title(''); } else if (is_category()) { echo category_description();} else { bloginfo('name'); } ?></a></h1>
        <h2><?php wp_title('')?> - <?php bloginfo('description');	?></h2>
</div>
</div>

<div class="95824bar" id="sidebar">

<ul class="95824menu" id="menu">
<li><a href="<?php echo home_url( '/' ); ?>" title="<?php bloginfo( 'name' ); ?>" rel="home"><img src="/theme/images/home.gif">
<span>Home</span>
</a></li>
<?php wp_list_categories('orderby=name&include=3,7,8,9,16,19,21,23,25,29,32,35,37,39&title_li='); ?>
</ul>

<br class="clear" /></div>

<div class="95824tent" id="content">
<div class="95824left" id="leftbox">
<div class="inbox">
<div>

<div><div style="margin:-3px 0px 0px 0px; text-align:center">



</div></div></div>
<div class="clear"></div>