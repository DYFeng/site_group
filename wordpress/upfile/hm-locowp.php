<?php
/*   
     $post_author    = 1;    	  //���ߵ�id��Ĭ��Ϊadmin
     $post_status    = "publish"; //"future"��ԤԼ����,"publish"����������,"pending"�������
     $time_interval  = 60;        //����ʱ��������λΪ�� ���������������ֵ���ʽ������12345 * rand(0,17)
     $post_next      = "next"; //now:����ʱ��=��ǰʱ��+���ʱ��ֵ 
                               //next: ����ʱ��=���һƪʱ��+���ʱ��ֵ
     $post_ping      = false;  //�������Ƿ�ִ��ping
     $translate_slug = false;  //�Ƿ����ı��ⷭ��ΪӢ����slug
     $secretWord     = 'abcd1234s';  //�ӿ����룬�������Ҫ���룬����Ϊ$secretWord=false ;
   
*/

//-------------------���ò�����ʼ��������Ҫ�޸�-------------------------
$post_author_default    = 1;    	 
$post_status    = "future"; 
$time_interval  = 1 * rand(1,360);        
$post_next      = "now"; 
$post_ping      = false;  	
$translate_slug = false;
$secretWord     = 'shanks';

//-------------------���ò������������������޸�-------------------------
if(isset($_GET['action'])){ 
    $hm_action=$_GET['action'];
}
else{
    die ("��������ֹ�����������<a href='http://www.hamo.cn'>http://www.hamo.cn</a>");
}

$post=$_POST;
include "../wp-config.php"; 
if ( get_magic_quotes_gpc() ) {
    $post = array_map( 'stripslashes_deep', $_POST );  //by  wind
}

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
//if (get_magic_quotes_gpc()) return stripslashes_deep($str);
return $str;
}
function hm_strip_slashes_new($string, $force = 0) {
	!defined('MAGIC_QUOTES_GPC') && define('MAGIC_QUOTES_GPC', get_magic_quotes_gpc());
	if(!MAGIC_QUOTES_GPC || $force) {
		if(is_array($string)) {
			foreach($string as $key => $val) {
				$string[$key] = daddslashes($val, $force);
			}
		} else {
			$string = addslashes($string);
		}
	}
	return $string;
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
   
	$post_name=hm_strip_slashes($post_name);
	$post_excerpt=hm_strip_slashes($post_excerpt);
	//if($translate_slug) $post_name=hm_tranlate($post_name);
	//$post_name=sanitize_title( $post_name);
	//if( strlen($post_name) < 2 ) $post_name="";
    
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
    if($post_status=='next') $post_status='publish';
  }
    
    $post_category=hm_add_category($post_category);
    
    $post_data = compact('post_author', 'post_date', 'post_date_gmt', 'post_content', 'post_title', 'post_category', 'post_status', 'post_excerpt', 'post_name','tags_input');
	$post_data = add_magic_quotes($post_data);	
    $postID = wp_insert_post($post_data);   
    
    if(!empty($post_meta_list)){
         $post_meta_array= array_unique(explode("|||",$post_meta_list));
         foreach($post_meta_array as $ppm)
         {
            $pp2=explode("$$",$ppm);
            if(!empty($pp2[0])&&!empty($pp2[1])) add_post_meta($postID,$pp2[0],$pp2[1],true);
         }
    }

	if($post_ping)  generic_ping();
	
	return   $postID;
}

if($hm_action== "list")
{
	hm_print_catogary_list();
}
elseif($hm_action== "update")
{
	hm_publish_pending_post();
}
elseif($hm_action == "save" /*&&isset($_GET['secret'])&&$_GET['secret'] == $secretWord*/)
{
    
    //$post=$_POST;
    
	extract($post);
	
	if(!isset($post_date) ||strlen($post_date)<8) $post_date=false;
        if(!isset($post_author)) $post_author=$post_author_default;
        if(!isset($post_meta_list)) $post_meta_list="";

	
    $ixd = hm_do_save_post(array('post_title'=>$post_title,
	  'post_content'=>$post_content,
	  'post_name'=>$post_name,
	  'post_excerpt'=>$excerpt,
	  'post_category'=>$post_category,
	  'tags_input'=>$post_tag,
	  'post_date'=>$post_date,
	  'post_author'=>$post_author,
	  'post_meta_list'=>$post_meta_list));
	
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
    echo 'Failed['.$hm_action.']';
}
?>