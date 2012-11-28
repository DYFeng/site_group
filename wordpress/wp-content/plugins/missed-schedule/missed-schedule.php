<?php
/*
Plugin Name: Missed Scheduled
Plugin URI: http://arielbustillos.com/missed-schedule
Description: Brings <code>Missed Schedule</code> posts back to life.
Version: 1.0
Author: obus3000
Author URI: http://arielbustillos.com/
Support URI: http://arielbustillos.com/missed-schedule/
*/

define('MISSEDSCHEDULED_DELAY', 15); // NUmber is in minutes, change it according to your needs

function missed_schedule_init(){
	global $wpdb;
	
	// The next hook disables internal cron jobs native in Wordpress. You can comment the line if breaks other plugins
	remove_action('publish_future_post', 'check_and_publish_future_post');

	$last = get_option('missed_schedule', false);
	if(($last !== false) && ($last > (time() - (MISSEDSCHEDULED_DELAY * 60))))
		return; 
	// Update current time
	update_option('missed_schedule', time());
	
	$missedIDs = $wpdb->get_col(
		"SELECT `ID` FROM `{$wpdb->posts}` ".
		"WHERE ( ".
		"	((`post_date` > 0 )&& (`post_date` <= CURRENT_TIMESTAMP())) OR ".
		"	((`post_date_gmt` > 0) && (`post_date_gmt` <= UTC_TIMESTAMP())) ".
		") AND `post_status` = 'future'"
	);
	if(!count($missedIDs)) return; 
	foreach($missedIDs as $missedID){
		if(!$missedID) continue;
		wp_publish_post($missedID); //Let's publish missed schedule posts
	}
}
add_action('init', 'missed_schedule_init', 0);

function uninstall_missed_schedule(){
	delete_option('missed_schedule');
}
register_deactivation_hook(__FILE__, 'uninstall_missed_schedule');
?>