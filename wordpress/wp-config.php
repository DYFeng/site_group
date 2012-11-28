<?php
define('DB_NAME', 'database_name_here');
define('DB_USER', 'username_here');
define('DB_PASSWORD', 'password_here');
define('DB_HOST', 'host_here');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', ''); 
 
define('WP_HOME', 'home_here');
define('WP_SITEURL', 'siteurl_here');

define('AUTH_KEY',         '~%Cs!Q7qK,*,=&E$Wi<)WXW8}t/[z6[y[.;O`NGoAf4/fv RZr|Q-T9~e&Re4G.[');
define('SECURE_AUTH_KEY',  'Mh| PxqbyO9L{]vqDRLJud7Di$i|j9csE?&wr944SLX;^I5#XRU[C=6s;_Npb zv');
define('LOGGED_IN_KEY',    'C/9rQ&0/=d*x4,yFn{+1F-])[AwD9:|~(|HV3[7W*|kV8pfawtdeLzwDBUl:4VH%');
define('NONCE_KEY',        'q&a^>b-9<h_`khftW{;L~)If_:X+)x>_Djn)^Vqaa%{2 >;]c:l]qP1rq2M80ol2');
define('AUTH_SALT',        '-D;&i{-HEpJ*Mw56o6W|3h/G<UIu 7+_$C}kgt(]mlN8^8`:tuzw i; )7JLV@FE');
define('SECURE_AUTH_SALT', 'VVIKq!L+vm7HU}g,>U85 HX-un[2/U;v6KQhX903xbwt204xr>bN7zuu4u5b5/SM');
define('LOGGED_IN_SALT',   'MW0w,BNpjlSAz?A1b:bwA!BqyWWp[Bnb4qa$c6LeNxo{3&{=)PbDO&Z~O *HgaN3');
define('NONCE_SALT',       '`GD`),:$3e5D0K+iuh/QqMM>j4Hy&w6hb>Lhy=/Bh;1313 =~ViRc7 MXVUZi@f>');

$table_prefix  = 'wp_';

define('WPLANG', '');
define('WP_DEBUG', false);
define('WP_POST_REVISIONS', false); 
define('AUTOSAVE_INTERVAL', 3600);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
