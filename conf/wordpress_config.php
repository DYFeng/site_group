<?php
$db_user='root';
$db_password='here_is_password';
// define('WP_HOME', '');
// define('WP_SITEURL', '');

$fullpath=explode('/',ABSPATH);

$domian=$fullpath[count($fullpath)-3];
$sub_domian=$fullpath[count($fullpath)-2];
$wholedomain=$sub_domian.'.'.$domian;


define('DB_NAME', $wholedomain);
define('DB_USER', $db_user);
define('DB_PASSWORD', $db_password);
define('WP_HOME', 'http://'.$wholedomain);
define('WP_SITEURL', 'http://'.$wholedomain);

?>