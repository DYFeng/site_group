<?php get_header(); ?>

<?php if(have_posts()) : ?>
  <?php while(have_posts()) : the_post(); ?>
  
<h3 class="ctle">
    <?php
      $value1=get_the_category_list(', ' );
      $value2=preg_replace('/View all posts in /','',$value1);
      echo preg_replace('/rel=\"(.*?)\"/','',$value2);
    ?>
</h3>

<h2 align="center"><?php the_title(); ?></h2>
  
    <?php the_content(); ?>

  <?php endwhile; ?>
<?php endif; ?>

<?php 
if(is_single()) { 
?>
	
<hr class="ln" />
<h3 class="ctle">Related Items (Customers Who Bought This Item Also Viewed and Bought)</h3>
<div style="padding-left:5px">
<table cellpadding="5" cellspacing="0" border="0" width="100%" class="tbproduct">

<tr>
<ul id="tags_related">
<?php
$post_tags = wp_get_post_tags($post->ID);
if ($post_tags) {
    $tag_list = '';
    foreach ($post_tags as $tag)
    {
        $tag_list .= $tag->term_id.',';
    }
    $tag_list = substr($tag_list, 0, strlen($tag_list)-1);

    $related_posts = $wpdb->get_results("
        SELECT post_title, ID
        FROM {$wpdb->prefix}posts, {$wpdb->prefix}term_relationships, {$wpdb->prefix}term_taxonomy
        WHERE {$wpdb->prefix}term_taxonomy.term_taxonomy_id = {$wpdb->prefix}term_relationships.term_taxonomy_id
        AND ID = object_id
        AND taxonomy = 'post_tag'
        AND post_status = 'publish'
        AND post_type = 'post'       
        AND ID != '" . $post->ID . "'
        ORDER BY RAND()
        LIMIT 6");
//AND term_id IN (" . $tag_list . ")
    if ( $related_posts ) {
        foreach ($related_posts as $related_post) {
          echo get_post($related_post->ID)->post_excerpt;
         } } else { ?>
    <li>nice! :)</li>
<?php } } ?>
</ul>
</tr>

</table>
</div>

<?php 
	}
?>

<?php get_sidebar(); ?>
<?php get_footer(); ?>