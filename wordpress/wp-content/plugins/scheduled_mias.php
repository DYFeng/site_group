<?php
/*
Plugin Name: Scheduled M.I.A.s
Plugin URI: http://blog.5ubliminal.com/topics/wordpress/plugins/
Description: Bring the left-for-dead <code>Missed Schedule</code> posts back to life.
Version: 5.U.B
Author: 5ubliminal
Author URI: http://blog.5ubliminal.com/
Support URI: http://blog.5ubliminal.com/support/
*/
// -----------------------------------------------------------------------------
define('PLUGIN_SCHEDULEDMIAS_DELAY', 15); // Minutes .. change as you wish
define('PLUGIN_SCHEDULEDMIAS_OPTION', '_5ub_scheduled_mias'); // Option name
// -----------------------------------------------------------------------------
function _5ubliminal_Replacements_Deactivate(){
	// Drop last update time on deactivate
	delete_option(PLUGIN_SCHEDULEDMIAS_OPTION);
}
register_deactivation_hook(__FILE__, '_5ubliminal_Replacements_Deactivate');
// -----------------------------------------------------------------------------
function _5ubliminal_ScheduledMIAs_Init(){
	// I disable internal cron jobs for post publishing completely
	// ... Comment the line below to let Wordpress try do its job before we kick in
	remove_action('publish_future_post', 'check_and_publish_future_post');
	// Let's see if enough time passed from last publish
	$last = get_option(PLUGIN_SCHEDULEDMIAS_OPTION, false);
	if(($last !== false) && ($last > (time() - (PLUGIN_SCHEDULEDMIAS_DELAY * 60))))
		return; // Too little time passed, bail here
	// Update to the current time
	update_option(PLUGIN_SCHEDULEDMIAS_OPTION, time());
	// Global $wpdb object
	global $wpdb;
	// Find MIA post_IDs, try both LOCAL datetime and GMT datetime
	$scheduledIDs = $wpdb->get_col(
		"SELECT `ID` FROM `{$wpdb->posts}` ".
		"WHERE ( ".
		"	((`post_date` > 0 )&& (`post_date` <= CURRENT_TIMESTAMP())) OR ".
		"	((`post_date_gmt` > 0) && (`post_date_gmt` <= UTC_TIMESTAMP())) ".
		") AND `post_status` = 'future'"
	);
	if(!count($scheduledIDs)) return; // None found ... bail
	foreach($scheduledIDs as $scheduledID){
		if(!$scheduledID) continue; // Just in case
		// Publish each post_ID the Wordpress friendly way
		wp_publish_post($scheduledID);
	}
}
add_action('init', '_5ubliminal_ScheduledMIAs_Init', 0); // 0 Priority filter
// -----------------------------------------------------------------------------
?>