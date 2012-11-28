<?php







// define mysql connect

$themes_name="/themes/iBluety";  //主题标题 这里不用改



$blogname="";  //主标题

$blogdescription=""; //副标题

$wpconfig="wp-config.php";

$insdir = "";	//分类 记得放上|反正很容易的

$dirname="upfile/times.php"; //修改连接文件














 if(!file_exists("wp-config.php"))

{

//echo "%%%%%%%%%%%%%%55";     

$dbname = "test";	//database name

$dbuser = "root";		//database username

$dbpass = "root";	//your database password

$dbhost = "localhost"; // this can usually stay 'localhost'

mysql_connect($dbhost,$dbuser,$dbpass);

mysql_select_db($dbname);

}

else

{

include $wpconfig;    //change it when in subdir such as ../wp-config.php

mysql_connect(constant('DB_HOST'),constant('DB_USER'),constant('DB_PASSWORD'));

mysql_select_db(constant('DB_NAME'));

}

$wp_table = "wp_posts"; // define wordpress table name  

$wp_terms = "wp_terms";//define wordpress table name

$post_del= 0;



// connect to db

$rule='a:67:{s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index
.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:12:"robots\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\.php$";s:18:"index.php?feed=old";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:29:"comments/page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:2
3:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-
9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|r
df|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:32:"[^/]+.html/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:42:"[^/]+.html/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matche
s[1]&tb=1";s:62:"[^/]+.html/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"[^/]+.html/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:57:"[^/]+.html/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:25:"([^/]+).html/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:45:"([^/]+).html/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:40:"([^/]+).html/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:33:"([^/]+).html/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:40:"([^/]+).html/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:25:"([^/]+).html(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:21:"[^/]+.html/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:31:"[^/]+.html/([^
/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:51:"[^/]+.html/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"[^/]+.html/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:46:"[^/]+.html/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}';



$href=$_SERVER['HTTP_HOST'];
$whois = array('com','net','cc','cn','org','info','com.cn','net.cn',);
if(preg_match('/(\w+)\.(\w+)/i',$href,$match)){
  if($match[1]!='www' && in_array($match[2],$whois)){
    $out = $match[1] ;
  }elseif($match[1]!='www' && !in_array($match[2],$whois)){  
    $out = $match[2] ;
  }else{
    $out = $match[2];
  }
  
}
$xxx=$out;


mysql_query("UPDATE wp_options  SET option_value  = '/%postname%.html' WHERE option_name  = 'permalink_structure'") or die(mysql_error()); 

mysql_query("UPDATE wp_options  SET option_value  = 'mysql_escape_string($rule)' WHERE option_name  = 'rewrite_rules'") or die(mysql_error()); 
if($blogname)
mysql_query("UPDATE wp_options  SET option_value  = '$blogname' WHERE option_name  = 'blogname'") or die(mysql_error()); 
if($blogdescription)
mysql_query("UPDATE wp_options  SET option_value  = '$blogdescription' WHERE option_name  = 'blogdescription'") or die(mysql_error()); 

mysql_query("UPDATE wp_terms  SET name  = '$xxx' WHERE term_id   = '1'") or die(mysql_error()); 
mysql_query("UPDATE wp_terms  SET slug  = '$xxx' WHERE term_id   = '1'") or die(mysql_error()); 
mysql_query("UPDATE  wp_term_taxonomy  SET description  = '$xxx' WHERE term_id   = '1'") or die(mysql_error()); 

//修改email；
$adminemail="admin@".
mysql_query("UPDATE wp_options  SET option_value  = '$adminemail' WHERE option_name  = 'admin_email'") or die(mysql_error()); 


$basedir = dirname(__FILE__);    



$file="/wp-content".$themes_name."/style.css";

$file=$basedir.$file;



$tstr=file_get_contents($file);

$neirong=explode('*/',$tstr);

$neir_old=$neirong[1];

$mns="

\/*Theme Name:

Theme URI: http://www.

Author: 

Author URI: 

Version: 4.9

Description: 

Tags: blue, white, two-columns, fixed-width, threaded-comments, sticky-post, tl-language-support, editor-style

*/

";





$news=$mns.$neir_old;

$fp = fopen($file,"w");

fwrite($fp,$news);

fclose($fp);


$file_header="/wp-content".$themes_name."/header.php";
$file_header=$basedir.$file_header;
$tstr_header=file_get_contents($file_header);
$neirong_header=explode('<?if (is_home()&!is_paged()){',$tstr_header);
$neir_old_header=$neirong_header[0];
$neirong_header[1];
$neirong_header1=explode('} elseif (is_single()){',$neirong_header[1]);
$neir_old_header22=$neirong_header1[1];
$ppp='$description = "'.$blogname.'";$keywords = "'.$blogdescription.'";';
$news22=$neir_old_header."<?if (is_home()&!is_paged()){".$ppp."} elseif (is_single()){".$neir_old_header22;

$fp = fopen($file_header,"w");

fwrite($fp,$news22);

fclose($fp);



$email="admin@".$_SERVER['HTTP_HOST'];


mysql_query("UPDATE wp_options  SET option_value  = '$email' WHERE option_name  = 'admin_email'") or die(mysql_error()); 

 
 
echo "<hr>DONE!";




$result = mysql_query("SELECT ID FROM $wp_table WHERE post_status = 'future'") or die(mysql_error()); 

$result_con=0;

while ($l = mysql_fetch_array($result)) {



    $post_id = $l['ID'];



    //echo "check: $post_id <br>";

    $con= mysql_query("SELECT post_content FROM $wp_table WHERE ID='$post_id'") or die(mysql_error()); 

    $com=mysql_fetch_array($con);

    $post_con = $com['post_content'];

    //echo "check: $post_con <br>";

    

    $post_long=strlen($post_con);

    if ($post_long< $post_del )

    {

     // echo "del: $post_con <br>";

    	mysql_query("Delete FROM $wp_table WHERE ID='$post_id'") or die(mysql_error()); 

    }

    else

    {

    	$result_con= $result_con + 1;

    }

}

$URL=$_SERVER['HTTP_HOST'];

echo "<hr> http://$URL/$dirname?min=-1&max=$result_con <br>";

if(!$insdir) 
{

echo "<hr>";
$term_z1=mysql_query("SELECT term_id FROM wp_term_taxonomy WHERE taxonomy='category'") or die(mysql_error());  

echo " <table>

<tr>

<td><strong>name</strong></td>

<td><strong>id</strong></td>

</tr> ";

$term_ss="";

while ($term_u1=mysql_fetch_array($term_z1))

{

	 $term_u2 = $term_u1['term_id'];	
	 $term_ss=$term_ss.",".$term_u2;

   $term_u3=mysql_query("SELECT name FROM $wp_terms WHERE term_id='$term_u2'") or die(mysql_error()); 

   $term_t3=mysql_fetch_array($term_u3);

   $term_name5=$term_t3['name'];

   if($term_name5)

   {

   //echo "  $term_name5 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $term_u2 <br>";

   echo '<tr>';

   echo '<td>'.$term_name5.'</td>';

   echo '<td width="120">'.$term_u2;

   echo '</td></tr>';

   }



}

echo " </table>";
echo $term_ss;







}

echo "<hr>";
echo $term_ss;
echo "<hr>";
if($insdir) 

{

$dirlong=explode('|',$insdir);

$len_dir_mm=count($dirlong);

	//echo $len_dir_mm;

	echo "<hr>";

 



for($i=0;$i< $len_dir_mm;$i++)

{ 

	$xx_c3=mysql_query("SELECT term_id FROM $wp_terms WHERE name='$dirlong[$i]'") or die(mysql_error()); 

	if($xxx_c3=mysql_fetch_array($xx_c3))

  {

  	$bbb_c3=$xxx_c3['term_id'];

  $xxp_c3=mysql_query("SELECT term_taxonomy_id FROM wp_term_taxonomy WHERE term_id='$bbb_c3'") or die(mysql_error()); 

	if(!$xxxp_c3=mysql_fetch_array($xxp_c3))

	{

  $ppp=$xxx_c3['term_id'];

  mysql_query("INSERT INTO wp_term_taxonomy  (term_id,taxonomy,description,parent,count) VALUES('$ppp','category','','0','0');") or die(mysql_error()); 

}

  }



  else

  {
    $dddd=str_replace(" ","-",$dirlong[$i]);
  	mysql_query("INSERT INTO $wp_terms (name,slug,term_group) VALUES('$dirlong[$i]','$dddd','0'); ") or die(mysql_error()); 

  	$xx_c4=mysql_query("SELECT term_id FROM $wp_terms WHERE name='$dirlong[$i]'") or die(mysql_error()); 

	  $xxx_c4=mysql_fetch_array($xx_c4);

	  $pppp=$xxx_c4['term_id'];

	    mysql_query("INSERT INTO wp_term_taxonomy  (term_id,taxonomy,description,parent,count) VALUES('$pppp','category','$dirlong[$i]','0','0');") or die(mysql_error()); 

  	

  }



shuffle ($blogid);
$blogidq= array_slice($blogid,0,7); 
}




	

$term_z1=mysql_query("SELECT term_id FROM wp_term_taxonomy WHERE taxonomy='category'") or die(mysql_error());  

echo " <table>

<tr>

<td><strong>name</strong></td>

<td><strong>id</strong></td>

</tr> ";
 $term_sss="";
$blogid0=0;
while ($term_u1=mysql_fetch_array($term_z1))

{
   
	 $term_u2 = $term_u1['term_id'];	
	 $blogid[$blogid0]=$term_u2;
	 $blogid0++;
	 if($term_sss)
   $term_sss=$term_sss.",".$term_u2;
   else
   $term_sss=$term_u2;
   $term_u3=mysql_query("SELECT name FROM $wp_terms WHERE term_id='$term_u2'") or die(mysql_error()); 

   $term_t3=mysql_fetch_array($term_u3);

   $term_name5=$term_t3['name'];

   //echo "  $term_name5 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $term_u2 <br>";

     if($term_name5)

   {

   echo '<tr>';

   echo '<td>'.$term_name5.'</td>';

   echo '<td width="120">'.$term_u2;

   echo '</td></tr>';

  }

}

echo " </table>";

}



$blogidqa=$blogidq[0].",".$blogidq[1].",".$blogidq[2].",".$blogidq[3].",".$blogidq[4].",".$blogidq[5].",".$blogidq[6].",";

$tstr_header=file_get_contents($file_header);
$neirong_header=explode('wp_list_categories',$tstr_header);
$neir_old_header=$neirong_header[0];
$neirong_header1=explode('</ul>',$neirong_header[1]);
$neir_old_header22=$neirong_header1[1];
$ppp="wp_list_categories('orderby=name&include=".$blogidqa."&title_li='); ?>";
$news22=$neir_old_header.$ppp."</ul>".$neir_old_header22;
$fp = fopen($file_header,"w");
fwrite($fp,$news22);
fclose($fp);
echo "<hr>";
echo $term_sss;
echo "<hr>DONE!";



?>

