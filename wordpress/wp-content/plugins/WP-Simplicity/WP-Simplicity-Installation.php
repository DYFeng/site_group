<?php 
/*
Plugin Name: WP Simplicity
Plugin URI: http://www.olusegunbalogun.com/wordpress-plugin-wpsimplicity/
Description: This plugin lets you set up over 40 other plugins, create pages, posts, sidebars and finally set the pretty permalinks with one click of a button. In short, this sets up a blank Wordpress site into a content blog. <a href="http://olusegunbalogun.com/wordpress-plugin-wpsimplicity/support/make-a-donation/">Make A Donation</a>
Author: Olusegun Balogun
Author URI: http://www.olusegunbalogun.com/
Version: 1.01
*/

//Get page and post content and title
include('content.php');

add_action('admin_menu','wp_plugin_installation_menu');
if(!function_exists('wp_plugin_installation_menu')) {
	function wp_plugin_installation_menu() {
		add_menu_page("WP Simplicity","WP Simplicity",8,basename(__FILE__),"plugin_installation_manage");
	}
}

function plugin_installation_manage() {
	global $wpdb,$postdata,$pagedata,$pluginslug;
	$ch = isset($_REQUEST['action']) ? $_REQUEST['action'] : '';
	switch($ch) {
		case 'upload_plugin':
			require_once( ABSPATH . 'wp-admin/includes/plugin-install.php' );
			save_update_widget_options($_REQUEST['replacevar_for_blog'],'replacing_variable_for_blog',1);

			//Install Plugins and activate
			if(isset($_REQUEST['plugin'])) {
				foreach($_REQUEST['plugin'] as $slug_name) {
					$plugin_info = $current = $dirarray = '';
					if(!is_dir(WP_PLUGIN_DIR.'/'.$slug_name)) {
						$plugin_info = plugins_api('plugin_information',array('slug'=>$slug_name));
						$zip = $plugin_info->download_link;
                              //echo "<!--  $zip  -af- --><br>";
						$dirarray = unzip_plugin_file(WP_PLUGIN_DIR,$zip);
						$plugin_file = get_plugin_file_name($dirarray,WP_PLUGIN_DIR);
						$current = get_option('active_plugins');
						$current[] = $plugin_file;
						sort($current);
						update_option('active_plugins',$current);
					} else { echo "Plugin $slug_name already exist.<br>";} 
				}
			}

			$domainname = preg_replace("/^(.*\.)?([^.]*\..*)$/", "$2", $_SERVER['HTTP_HOST']);
			
			//Create pages
			if(isset($_REQUEST['page_c'])) {
				foreach($_REQUEST['page_c'] as $k=>$v){
					$page_title = $pagedata[$k]['title'];
					$page_content = 
str_replace(strtolower('{v}'),$_REQUEST['replacevar_for_blog'],$pagedata[$k]['content']);
					$page_content = str_replace(strtolower('{d}'),$domainname,$page_content);
					$page_template = 'default';

					$sql = "SELECT * FROM ".$wpdb->prefix."posts WHERE 
post_title='".$page_title."' AND post_type='page'";
					$page_id = $wpdb->get_var($sql);
					create_custom_pages_af($page_content,$page_template,$page_title,$page_id);
				}
			}

			//Create Posts
			if(isset($_REQUEST['post'])) {
				$posts = $_REQUEST['post'];
				foreach( $posts as $key=>$value){
					$post_title = 
str_replace(strtolower('{v}'),$_REQUEST['replacevar_for_blog'],$postdata[$key]['title']);
					$post_content = 
str_replace(strtolower('{v}'),$_REQUEST['replacevar_for_blog'],$postdata[$key]['content']);
					$post_excerpt = '';
					$post_categories = '';
					$post_metakeys = '';
					$post_metavalues = '';	
				
					$sql = "SELECT ID FROM ".$wpdb->prefix."posts WHERE 
post_title='".$post_title."' AND post_type='post'";
					$post_id = $wpdb->get_var($sql);

create_custom_posts_af($post_title,$post_content,$post_excerpt,$post_categories,$post_metakeys,$metavalues,$post_id);
				}
			}
			
			//Setup default sidebars
               $op = get_option('sidebar_status');
			if(isset($_REQUEST['sidebarss']) && !$op) {
              			wp_custom_sidebar_settings($sidebar = 'sidebar-1');
                         update_option('sidebar_status',1);
			}
			
			//Setup pretty permalink
			custom_permalink_setup($permalink_structure = '/%postname%/');
			
			//Get setup form
			get_plugin_form();
			break;
		default:
			//Get setup form
			get_plugin_form();
	}
}

function get_plugin_form() {
	global $wpdb,$postdata,$pagedata,$pluginslug;
	$replaceblogoption = get_option('replacing_variable_for_blog');
	?>
	<div class="wrap">
		<h2>WP Simplicity</h2>
		<div>
			
			<form action="" method="POST">
				<table>
					<tr>
						<td>Blog Name </td>
						<td>
							<input type="text" value="<?php echo $replaceblogoption;?>" name="replacevar_for_blog" class="lngtxt"><br><br>
						</td>
					</tr>
				<?php
					foreach($pluginslug as $key=>$value) { ?>
						<TR><TD>
							<input type="checkbox" name="plugin[]" value="<?php echo $key;?>"><?php echo $value.'</TD>';
						if(is_dir(WP_PLUGIN_DIR.'/'.$key)) {
							echo " <td>[ Plugin Installed ]</td>";
						}
						?></TR>
					<?php
					}
				?>
				</table>
				<br>
				<h2>Add Page</h2>
				&nbsp;&nbsp;&nbsp;
				<input type="checkbox" id="pg-1" name="page_c[1]" value="page 1">About<br>
				&nbsp;&nbsp;&nbsp;
				<input type="checkbox" id="pg-2" name="page_c[2]" value="page 2">Contact<br>
				&nbsp;&nbsp;&nbsp;
				<input type="checkbox" id="pg-3" name="page_c[3]" value="page 3">Privacy<br>
			
				<h2>Add Post</h2>
				&nbsp;&nbsp;&nbsp;
				<input type="checkbox" id="ps-1" name="post[1]" value="post 1">Article 1<br>
				&nbsp;&nbsp;&nbsp;
				<input type="checkbox" id="ps-2" name="post[2]" value="post 2">Article 2<br>
				&nbsp;&nbsp;&nbsp;
				<input type="checkbox" id="ps-3" name="post[3]" value="post 3">Article 3<br>
                                &nbsp;&nbsp;&nbsp;
				<input type="checkbox" id="ps-4" name="post[4]" value="post 4">Article 4<br>
                                &nbsp;&nbsp;&nbsp;
				<input type="checkbox" id="ps-5" name="post[5]" value="post 5">Article 5<br>
                                &nbsp;&nbsp;&nbsp;
                                <input type="checkbox" id="ps-6" name="post[6]" value="post 6">Article 6<br>
                                &nbsp;&nbsp;&nbsp;
				<input type="checkbox" id="ps-7" name="post[7]" value="post 7">Article 7<br>
                                &nbsp;&nbsp;&nbsp;
				<input type="checkbox" id="ps-8" name="post[8]" value="post 8">Article 8<br>
                                &nbsp;&nbsp;&nbsp;
				<input type="checkbox" id="ps-9" name="post[9]" value="post 9">Article 9<br>
                                &nbsp;&nbsp;&nbsp;
				<input type="checkbox" id="ps-10" name="post[10]" value="post 10">Article 10<br>
				

				<h2>Add Sidebar Widgets</h2>
				&nbsp;&nbsp;&nbsp;
                                 <?php
                                  $op = get_option('sidebar_status');
                                 ?>
				<input type="checkbox" id="sb-1" name="sidebarss" value="sidebar 1" <?php if($op) echo 'checked=\"checked\"';?>>Reset Sidebar<br>

				
				<input type="hidden" value="upload_plugin" name="action">
				<br><input type="submit" name="ss" value="Update WP Simplicity Settings" class="button-primary">
			</form>
		</div>
		<br />
                WP Simplicity plugin is a one-click solution to convert a blank Wordpress website into a content site with most rated plugins and settings done for you. <Br />
		This plugin can ONLY be used by everybody. If you have any concern about this plugin, please <a href="http://olusegunbalogun.com/contact">Inform Us</a>.
		Copyright &copy; 2010 WP Simplicity Plugin. <a href="http://olusegunbalogun.com/wordpress-plugin-wpsimplicity/">WP Simplicity</a>. <br><strong>Donate!</strong><br/><p>This plugin has cost me countless hours of work, if you use it, please donate a token of your appreciation!</p><br/><form action="https://www.paypal.com/cgi-bin/webscr" method="post">
<input type="hidden" name="cmd" value="_s-xclick">
<input type="hidden" name="hosted_button_id" value="HT3ZR7X3XEJPN">
<input type="image" src="http://olusegunbalogun.com/wordpress-plugin-wpsimplicity/wp-content/uploads/2010/08/make-a-donation.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
<img alt="" border="0" src="https://www.paypal.com/en_GB/i/scr/pixel.gif" width="1" height="1">
</form>

	</div>
	<style type="text/css">
		.lngtxt{
			width:400px;
			height: 28px;
		}
	</style>
	<?php
}

function unzip_plugin_file($pluginpath,$zip) {
	$parra = split('/',$zip);
	$zipfilename = $parra[count($parra)-1];
	$zippath = $pluginpath.'/'.$zipfilename;
     //echo "<!-- Zipfilepath :: $zippath -af- -->";
	$arr = @file_get_contents($zip);
	$h = fopen($zippath,'w');
	fwrite($h,$arr);
	fclose($h);
	//$filearray = just_unzip_plugin::unzip_plugin($zippath,$pluginpath);
	$filearray = unzip_plugin_af($zipfilename,$pluginpath);
	unlink($zippath);
	return $filearray;
}

class just_unzip_plugin {
	function unzip_plugin($file,$temppath)  {
		//require_once('pclzip.lib.php');
		//$archive = new PclZip($file);
		//if ( 0 == ($files = $archive->extract(PCLZIP_OPT_PATH, $temppath.'/')) ) {
		//	die("Error : ".$archive->errorInfo(true));
		//}
		//return $archive->listContent();
	}
}

function create_custom_posts_af($potitle,$content,$excerpt,$categoryids,$metakeys,$metavalues,$post_id) {
	global $wpdb;
	$user_post = array(
		'post_status' => 'draft',
		'post_type' => 'post',
		'post_author' => 1,
		'ping_status' => get_option('default_ping_status'),
		'post_parent' => 0,
		'menu_order' => 0,
		'to_ping' =>  '',
		'pinged' => '',
		'post_password' => '',
		'guid' => '',
		'post_content_filtered' => '',
		'post_excerpt' => ''
	);
	$user_post['post_title'] = $potitle;
	$user_post['post_content'] = $content;
	$user_post['post_excerpt'] = $excerpt;
	$user_post['post_category'] = split(',',$categoryids);
	$metakeys = split(',',$metakeys);
	$metavalues = split(',',$metavalues);
	if(!$post_id) {
		$postid = wp_insert_post($user_post);
		for($i=0;$i<count($metakeys);$i++) {
			add_post_meta($postid,$metakeys[$i],$metavalues[$i]);
		}
		echo "Post \"$potitle\" is inserted succesfully!<br>";
	} else {
		$user_post['ID'] = $post_id;
		$postid = wp_update_post($user_post);
		for($i=0;$i<count($metakeys);$i++) {
			update_post_meta($postid_for_update[0],$metakeys[$i],$metavalues[$i]);
		}
		echo "Post \"$potitle\" is updated succesfully!<br>";
	}
}

function create_custom_pages_af($cont,$page_template="default",$title,$page_id='') {
	$con = stripcslashes($cont);
	$page['post_type']    	= 'page';
	$page['post_content'] 	= $con;
	$page['post_parent']  	= 0;
	$page['post_author']  	= 1;
	$page['post_status']  	= 'publish';
	$page['post_title']   	= $title;
	if(!$page_id) {
		$pageid = wp_insert_post($page);
		echo "Page \"$title\" is inserted succesfully!<br>";
	} else {
		$page['ID']   	= $page_id;
		$pageid = wp_update_post($page);
		echo "Page \"$title\" is updated succesfully!<br>";
	}
	if($pageid) {	
		update_post_meta($pageid, '_wp_page_template',$page_template);
	}
	
}

function wp_custom_sidebar_settings($sidebar = 'sidebar-1') {
$pnk = $_REQUEST['replacevar_for_blog'];
$sidebartitle = "Check Out This Great Bonus";
$sidebarbody = "<a href=\"http://yoursite.com/go/official-website\">
<img class=\"alignnone size-full wp-image-10\" title=\"product image\" src=\"http://yoursite.com/wpcontent/
uploads/2010/04/product-image.jpg\" alt=\"$pnk image\" /></a>
Edit this area with the catchy description that suit the 
product you want to promote.
<a href=\"http://yoursite.com/go/official-website\">Click here to download</a>";

	$widget_data['sidebars_widgets'] = array('wp_inactive_widgets'=>array(),$sidebar=>array('text-2','recent-posts-2','pages-2','tag_cloud-2','categories-2'),'array_version' => 2);		
	$widget_data['widget_text'] = array(
								'2'=>array(
										'title' => $sidebartitle,
										'text' => $sidebarbody,
										'filter' =>''
									), 
								'_multiwidget' => '1'
							);

	$widget_data['widget_recent-posts'] = array(
									'2'=>array(
											'title' => 'Recent Posts',
											'number' => '5'
										), 
										'_multiwidget' => '1'
									);

	$widget_data['widget_pages'] = array(
								'2'=>array(
										'title' => 'Pages',
										'sortby' => 'post_title',
										'exclude' =>''
									), 
								'_multiwidget' => '1'
							);

	$widget_data['widget_tag_cloud'] = array(
									'2'=>array(
											'title' => 'Tags'
										), 
									'_multiwidget' => '1'
								);

	$widget_data['widget_categories'] = array(
									'2'=>array(
											'title' => 'Categories',
											'count' => '0',
											'hierarchical' => '1',
											'dropdown' => '0'
										), 
									'_multiwidget' => '1'
								);

	foreach($widget_data as $key=>$value) {
		save_update_widget_options($value,$key);	
	}
}

function save_update_widget_options($option_value,$option_name,$op='') {
	$option = $final_option = '';
	$option = get_option($option_name);
	if($op)
		$final_option = $option_value;
	else 
		$final_option = (array)$option_value + (array)$option;
	if(isset($option) || $option == '') {
		update_option($option_name,$final_option); 
	} else {
		add_option($option_name,$final_option);
	}
}

function custom_permalink_setup($permalink_structure = '/%postname%/') {
	global $wp_rewrite;
	$permalink_structure = preg_replace('#/+#', '/', '/' . $permalink_structure);
	$wp_rewrite->set_permalink_structure($permalink_structure);
	$wp_rewrite->flush_rules();
}

function get_plugin_file_name($arr,$temppath) {
	foreach($arr as $v) {
		$path = $temppath.'/'.$v;
		if((file_exists($path)) && (strrpos($path,'.php'))) {
			$h = fopen($path,'r');
			$con = @fread($h,filesize($path));
			if(strpos($con,'Plugin Name:')) {
				return $v;
			}
		}
	}
}

function unzip_plugin_af($zipfilename='',$extractpath='') {
	$zip = zip_open($extractpath.'/'.$zipfilename);
	if ($zip) {
		while ($zip_entry = zip_read($zip)) {
			$fname = zip_entry_name($zip_entry);
			$fpath = $extractpath.'/'.$fname;
			 if ($fname != '.' && $fname != '..' && !(strpos($fname, '.'))) {
				@mkdir($fpath,0777);
			} else {
				$fp = fopen($fpath, "w");
				if (zip_entry_open($zip, $zip_entry, "r")) {
					$buf = zip_entry_read($zip_entry, zip_entry_filesize($zip_entry));
					fwrite($fp,$buf);
					zip_entry_close($zip_entry);
					fclose($fp);
				}
				$filearray[] = $fname;	
			}
		}
		zip_close($zip);
		return $filearray;
	}
}	
?>
