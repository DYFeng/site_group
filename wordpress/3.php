<?php




$fid="fusccci220-20";//原来的tag
$tid="";//新tag



$postnum="5";//平均每天发布几篇文章

$themes_name="/themes/iBluety";  //主题标题 

$footercode='<?php echo get_settings("home"); ?> is a participant in the Amazon Services LLC Associates Program, an affiliate advertising program designed to provide a means for sites to earn advertising fees by advertising and linking to amazon.com, endless.com, smallparts.com or myhabit.com. Apart from its participation in the Associates Program, the author of the page is not affiliated with Amazon in any other way. Amazon, the Amazon logo, Endless, and the Endless logo are trademarks of Amazon.com, Inc. or its affiliates. The author of this page does not collect any information about its visitors.
'; //引号里面放统计代码;

$wpconfig="wp-config.php";

$insdir = "";	//分类 记得放上|反正很容易的

 if(!file_exists("wp-config.php"))

{
  

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

$gmt_offset = '-8'; // -8 for California, -5 New York, +8 Hong Kong, etc.
$min_days_old ='-1';

$result = mysql_query("SELECT ID FROM $wp_table WHERE post_status = 'future'") or die(mysql_error()); 
$count=count($result);
$max_days_old=0-floor($count/$postnum);


while ($l = mysql_fetch_array($result)) {
    $post_id = $l['ID'];
    echo "Updating: $post_id <br>";
 
    $day = rand($min_days_old, $max_days_old);
    $hour = rand(0,23);
	  $minute = rand(0,60);
 
    $new_date = date( 'Y-m-d H:i:s', strtotime("-$day day -$hour hour -$minute minute") );  
    $gmt_new_date = date( 'Y-m-d H:i:s', strtotime("-$day day -$hour hour -$gmt_offset hour -$minute minute") );
 
    mysql_query("UPDATE $wp_table SET post_date='$new_date', post_date_gmt='$gmt_new_date',
    post_modified='$new_date', post_modified_gmt='$gmt_new_date' WHERE ID='$post_id'")
    or die(mysql_error()); 
 
}
if(!$insdir) {

echo "<hr>";



echo "&&&&&&&&&&&&&&&&&&&&&";

$term_z1=mysql_query("SELECT term_id FROM wp_term_taxonomy WHERE taxonomy='category'") or die(mysql_error());  

/*while ($term_u1=mysql_fetch_array($term_z1))

{
	echo $term_u1['term_id'];
}
*/

echo "&&&&&&&&&&&&&&&&&&&&&";
echo " <table>

<tr>

<td><strong>name</strong></td>

<td><strong>id</strong></td>

</tr> ";

$term_ss="";

while ($term_u1=mysql_fetch_array($term_z1))

{
//echo "###########";

//}
//while(0){

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
  	if(strstr($dirlong[$i],"&"))
  	{
  		$dddd=str_replace("&","-",trim($dirlong[$i]));
  	}
  	else
  	
    {$dddd=str_replace(" ","-",$dirlong[$i]);}
  	mysql_query("INSERT INTO $wp_terms (name,slug,term_group) VALUES('$dirlong[$i]','$dddd','0'); ") or die(mysql_error()); 

  	$xx_c4=mysql_query("SELECT term_id FROM $wp_terms WHERE name='$dirlong[$i]'") or die(mysql_error()); 

	  $xxx_c4=mysql_fetch_array($xx_c4);

	  $pppp=$xxx_c4['term_id'];

	    mysql_query("INSERT INTO wp_term_taxonomy  (term_id,taxonomy,description,parent,count) VALUES('$pppp','category','$dirlong[$i]','0','0');") or die(mysql_error()); 

  	

  }

}


}
if(1){

	

$term_z1=mysql_query("SELECT term_id FROM wp_term_taxonomy WHERE taxonomy='category'") or die(mysql_error()); 

echo "@@@@@@@@@@@@@@@@@@@@@@";
print_r($term_z1);
echo "@@@@@@@@@@@@@@@@@@@@@@"; 

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
	 //$blogid[$blogid0]=$term_u2;
//echo "@@@@@@@@@@@@@@@@@@@@@@";
//print_r($term_sss);
//echo "@@@@@@@@@@@@@@@@@@@@@@";


	 if($term_sss)
   $term_sss=$term_sss.",".$term_u2;
   else
   $term_sss=$term_u2;
   $term_u3=mysql_query("SELECT name FROM $wp_terms WHERE term_id='$term_u2'") or die(mysql_error()); 

   $term_t3=mysql_fetch_array($term_u3);

   $term_name5=$term_t3['name'];
	 $blogid[$blogid0]=$term_name5;
	 $blogid0++;

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

shuffle ($blogid);
$blogidq= array_slice($blogid,0,2); 


echo "<hr>";
echo $term_sss;
echo "<hr>DONE!";
$basedir = dirname(__FILE__);    
$file_header="/wp-content".$themes_name."/footer.php";
$file_header=$basedir.$file_header;
$tstr_header=file_get_contents($file_header);
$neirong_header=explode('<div id="share"></div>',$tstr_header);
$neir_old_header=$neirong_header[0];
$neir_old_header66=$neirong_header[1];


$news22=$neir_old_header.'<div id="share"></div>'.$footercode.$neir_old_header66;

echo "$$$$$$$$$$$$$$";
echo $news22;
echo "$$$$$$$$$$$$$$";


$fp = fopen($file_header,"w");

fwrite($fp,$news22);

fclose($fp);

//footer

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

$basedir = dirname(__FILE__);    
$file_footer=$basedir."/wp-content".$themes_name."/footer.php";
$footer='
<div class="clear"></div>

</div>

<div id="footer">
<div class="in">

<div>© 2012 '.$href.', All Rights Reserved | <a href="/sitemap.xml">Sitemap.xml</a> | <a href="/sitemap/">Sitemap</a> | <a href="http://en.wikipedia.org/wiki/'.str_replace(' ', '', $blogidq[0]).'">'.$blogidq[0].'</a> | <a href=" <?php echo get_bloginfo( "url", "display" );?>" title="<?php echo get_bloginfo( "name", "display" );?>" > <?php echo get_bloginfo( "name", "display" );?> </a>| <a href="http://en.wikipedia.org/wiki/'.str_replace(' ', '', $blogidq[1]).'">'.$blogidq[1].'</a> </div>
<div><?php echo get_bloginfo( "description", "display" );?>'.$footercode.'

</div> 

</div></div></div></div>


<div id="share"></div>


</div>
</body>
</html>
';

$fpp = fopen($file_footer,"w");
fwrite($fpp,$footer);
fclose($fpp);



if($fid and $tid)

//cat
 {    $fid = "?tag=".$fid;
    	$tid = "?tag=".$tid;
		$i=$wpdb->query("update $wpdb->posts set  post_content=replace(post_content,'".$fid."','".$tid."'), post_excerpt=replace(post_excerpt,'".$fid."','".$tid."')");	
		
		if ($i>0)
			echo "OK=".$i;
		else	
			echo "FALSE";
}



echo "<hr>DONE!";





?>

