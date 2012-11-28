<?php

//-------------------配置参数开始，根据需要修改-------------------------
$post_author    = 1;    	 
$post_status    = "future"; 
$time_interval  = 600;        
$post_next      = "next"; 
$post_ping      = false;  	
$translate_slug = false;
$secretWord     = false;

//-------------------配置参数结束，以下请勿修改-------------------------
if(isset($_GET['action'])){ 
    $hm_action=$_GET['action'];
}
else{
    die ("操作被禁止，详情请访问");
}

include "../wp-config.php"; 

if($post_ping) require_once("../wp-includes/comment.php");

if( !class_exists("Snoopy") )	require_once ("../wp-includes/class-snoopy.php");
function hm_debug_info($msg)
{
    global $logDebugInfo;
    if($logDebugInfo) echo $msg."<br/>\n";
}

function hm_tranlate($text){
	$snoopy = new Snoopy;
	$url = "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=".urlencode($text)."&langpair=zh-CN%7Cen";
	$submit_vars["text"] = $text;
	$submit_vars["ie"] = "UTF8"; 
	$submit_vars["hl"] = "zh-CN"; 
	$submit_vars["langpair"] = "zh|en"; 
	$snoopy->submit($url,$submit_vars);
	$htmlret = $snoopy->results;
	$htmlret = explode('translatedText',$htmlret);
	$htmlret = explode('}',$htmlret[1]);
	$htmlret = $htmlret[0];
	$htmlret = str_replace('"','',$htmlret);
	$htmlret = str_replace(':','',$htmlret);
	return $htmlret;
}

function hm_print_catogary_list()
{
    $cats = get_categories("hierarchical=0&hide_empty=0");
	foreach ((array) $cats as $cat) {
        echo '<<<'.$cat->cat_ID.'--'.$cat->cat_name.'>>>';	
	}
}

function hm_get_post_time($post_next="normal")
{
    global $time_interval;
    global $wpdb;

    $time_difference = absint(get_option('gmt_offset')) * 3600;
    $tm_now = time()+$time_difference;
    
    if ($post_next=='now'){
        $tm=time()+$time_difference; 
    }
    else //if ($post_next=='next')
    {
        $tm = time()+$time_difference;
      	$posts = $wpdb->get_results( "SELECT post_date FROM $wpdb->posts ORDER BY post_date DESC limit 0,1" );
        foreach ( $posts as $post )
        {
            $tm=strtotime($post->post_date);
        }
    }
    return $tm+$time_interval;
}

function hm_publish_pending_post()
{
    global $wpdb;
    $tm_now = time()+absint(get_option('gmt_offset')) * 3600;
    $now_date=date("Y-m-d H:i:s",$tm_now);
    $wpdb->get_results( "UPDATE $wpdb->posts set `post_status`='publish' WHERE `post_status`='pending' and `post_date`<'$now_date'" );
}

function hm_add_category($post_category)
{
    if(!function_exists('wp_insert_category')) @include "../wp-admin/includes/taxonomy.php";
    global $wpdb;
    $post_category_new=array();
    $post_category_list= array_unique(explode(",",$post_category));
	foreach($post_category_list as $category)
	{
        $cat_ID =intval($category);
        if($cat_ID==0)
        {
            $category = $wpdb->escape($category);
			$cat_ID = wp_insert_category(array('cat_name' => $category));
        }
        array_push($post_category_new,$cat_ID);
    }
    return $post_category_new;
}

function hm_strip_slashes($str){
	if (get_magic_quotes_gpc()) return stripslashes($str);
	return $str;
}

function hm_cunzaima($str)
{    
    global $wpdb;

	$tm = 0;
	$sk = "SELECT ID FROM $wpdb->posts WHERE post_title=\"".$str."\""." LIMIT 0 , 5";
	
  	$posts = $wpdb->get_results($sk);
  	
    foreach ( $posts as $post )
    {		
        $tm=$tm + $post->ID;
        if  ($tm > 0) 
        	break;
    }
    
    
    return $tm;
}

function hm_do_save_post($post_detail)
{
    global $post_author,$post_ping,$post_status,$translate_slug,$autoAddCategory,$post_next;
	extract($post_detail);

    $post_title=trim(hm_strip_slashes($post_title));
	$post_name=$post_title;
	if($translate_slug) $post_name=hm_tranlate($post_name);
	$post_name=sanitize_title( $post_name);
	if( strlen($post_name) < 2 ) $post_name="";
    
    if (hm_cunzaima($post_title) != 0)
    	return 0;
    
    $post_content=hm_strip_slashes($post_content);
                
    $tags_input=str_replace("|||",",",$tags_input);
	
	if(isset($post_date) &&$post_date)
	{
		$post_date_gmt=$post_date;
		$post_status='publish';
	}
	else
	{
		$tm=hm_get_post_time($post_next); 
		$time_difference = absint(get_option('gmt_offset')) * 3600;
		$post_date=date("Y-m-d H:i:s",$tm);
		$post_date_gmt = gmdate('Y-m-d H:i:s', $tm-$time_difference);
		if($post_status=='next') 
			$post_status='publish';
	}
    
    $post_category=hm_add_category($post_category);
    
    $post_data = compact('post_author', 'post_date', 'post_date_gmt', 'post_content', 'post_title', 'post_category', 'post_status', 'post_excerpt', 'post_name','tags_input');
	$post_data = add_magic_quotes($post_data);
    $postID = wp_insert_post($post_data);

	if($post_ping)  
		generic_ping();
		
	return   $postID;  
}

if($hm_action== "save")
{
   
    $post_title = $_POST['post_title'];
    $post_content = $_POST['post_content'];
    $post_category = $_POST['post_category'];
    $tag = $_POST['tag'];
    $post_date = $_POST['post_date'];

  	$ixd = hm_do_save_post(array('post_title'=>$post_title, 'post_content'=>$post_content,
       	                 'post_category'=>$post_category,'tags_input'=>$tag, 'post_date'=>$post_date));

	//$flashData = date("Y-m-d H:i:s", time())." >>> \r\n".$ixd."\r\n";
	//file_put_contents ('ip.txt',$flashData,FILE_APPEND); 
                         	                         
	if ($ixd==0)
	{
    	echo 'Failed';
    }
    else
    {
    	echo 'Success';
    }	
    	
}
else
{
    echo 'Failed';
}
?>