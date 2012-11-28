-- phpMyAdmin SQL Dump
-- version 3.3.7
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2012 年 09 月 04 日 10:54
-- 服务器版本: 5.1.50
-- PHP 版本: 5.2.14

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `w4shanks`
--

-- --------------------------------------------------------

--
-- 表的结构 `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `wp_commentmeta`
--


-- --------------------------------------------------------

--
-- 表的结构 `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_approved` (`comment_approved`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wp_comments`
--


-- --------------------------------------------------------

--
-- 表的结构 `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `wp_links`
--

INSERT INTO `wp_links` (`link_id`, `link_url`, `link_name`, `link_image`, `link_target`, `link_description`, `link_visible`, `link_owner`, `link_rating`, `link_updated`, `link_rel`, `link_notes`, `link_rss`) VALUES
(1, 'http://codex.wordpress.org/', 'Documentation', '', '', '', 'Y', 2, 0, '0000-00-00 00:00:00', '', '', ''),
(2, 'http://wordpress.org/news/', 'WordPress Blog', '', '', '', 'Y', 2, 0, '0000-00-00 00:00:00', '', '', 'http://wordpress.org/news/feed/'),
(3, 'http://wordpress.org/extend/ideas/', 'Suggest Ideas', '', '', '', 'Y', 2, 0, '0000-00-00 00:00:00', '', '', ''),
(4, 'http://wordpress.org/support/', 'Support Forum', '', '', '', 'Y', 2, 0, '0000-00-00 00:00:00', '', '', ''),
(5, 'http://wordpress.org/extend/plugins/', 'Plugins', '', '', '', 'Y', 2, 0, '0000-00-00 00:00:00', '', '', ''),
(6, 'http://wordpress.org/extend/themes/', 'Themes', '', '', '', 'Y', 2, 0, '0000-00-00 00:00:00', '', '', ''),
(7, 'http://planet.wordpress.org/', 'WordPress Planet', '', '', '', 'Y', 2, 0, '0000-00-00 00:00:00', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1165 ;

--
-- 转存表中的数据 `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `blog_id`, `option_name`, `option_value`, `autoload`) VALUES
(1155, 0, '_site_transient_timeout_theme_roots', '1346763218', 'yes'),
(1156, 0, '_site_transient_theme_roots', 'a:2:{s:17:"abstrakt-theme-10";s:7:"/themes";s:8:"shanksop";s:7:"/themes";}', 'yes'),
(3, 0, 'siteurl', 'http://anneklein.menswomenswatches.com', 'yes'),
(4, 0, 'blogname', 'Main Title', 'yes'),
(5, 0, 'blogdescription', 'Sub Title', 'yes'),
(6, 0, 'users_can_register', '0', 'yes'),
(7, 0, 'admin_email', 'admin@americangirlfreeshipping.com', 'yes'),
(8, 0, 'start_of_week', '1', 'yes'),
(9, 0, 'use_balanceTags', '', 'yes'),
(10, 0, 'use_smilies', '1', 'yes'),
(11, 0, 'require_name_email', '1', 'yes'),
(12, 0, 'comments_notify', '1', 'yes'),
(13, 0, 'posts_per_rss', '8', 'yes'),
(14, 0, 'rss_use_excerpt', '0', 'yes'),
(15, 0, 'mailserver_url', 'mail.example.com', 'yes'),
(16, 0, 'mailserver_login', 'login@example.com', 'yes'),
(17, 0, 'mailserver_pass', 'password', 'yes'),
(18, 0, 'mailserver_port', '110', 'yes'),
(19, 0, 'default_category', '1', 'yes'),
(20, 0, 'default_comment_status', 'open', 'yes'),
(21, 0, 'default_ping_status', 'open', 'yes'),
(22, 0, 'default_pingback_flag', '1', 'yes'),
(23, 0, 'default_post_edit_rows', '30', 'yes'),
(24, 0, 'posts_per_page', '8', 'yes'),
(25, 0, 'date_format', 'F j, Y', 'yes'),
(26, 0, 'time_format', 'g:i a', 'yes'),
(27, 0, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(28, 0, 'links_recently_updated_prepend', '<em>', 'yes'),
(29, 0, 'links_recently_updated_append', '</em>', 'yes'),
(30, 0, 'links_recently_updated_time', '120', 'yes'),
(31, 0, 'comment_moderation', '0', 'yes'),
(32, 0, 'moderation_notify', '1', 'yes'),
(33, 0, 'permalink_structure', '/%postname%/', 'yes'),
(34, 0, 'gzipcompression', '0', 'yes'),
(35, 0, 'hack_file', '0', 'yes'),
(36, 0, 'blog_charset', 'UTF-8', 'yes'),
(37, 0, 'moderation_keys', '', 'no'),
(38, 0, 'active_plugins', 'a:8:{i:0;s:36:"google-sitemap-generator/sitemap.php";i:1;s:20:"pagebar/pagebar2.php";i:2;s:65:"permalink-trailing-slash-fixer/permalink-trailing-slash-fixer.php";i:3;s:39:"sitemap-generator/sitemap-generator.php";i:4;s:40:"wp-no-category-base/no-category-base.php";i:5;s:27:"wp-optimize/wp-optimize.php";i:6;s:27:"wp-pagenavi/wp-pagenavi.php";i:7;s:29:"wp-postviews/wp-postviews.php";}', 'yes'),
(39, 0, 'home', 'http://anneklein.menswomenswatches.com', 'yes'),
(40, 0, 'category_base', '', 'yes'),
(41, 0, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(42, 0, 'advanced_edit', '0', 'yes'),
(43, 0, 'comment_max_links', '2', 'yes'),
(44, 0, 'gmt_offset', '0', 'yes'),
(45, 0, 'default_email_category', '1', 'yes'),
(46, 0, 'recently_edited', 'a:5:{i:0;s:61:"D:\\PHPnow\\vhosts\\piyi.com/wp-content/themes/shanks/footer.php";i:2;s:60:"D:\\PHPnow\\vhosts\\piyi.com/wp-content/themes/shanks/style.css";i:3;s:62:"D:\\PHPnow\\vhosts\\piyi.com/wp-content/themes/shanks/sidebar.php";i:4;s:61:"D:\\PHPnow\\vhosts\\piyi.com/wp-content/themes/shanks/header.php";i:5;s:83:"D:\\aPHPnow\\vhosts\\americangirlfreeshipping.com/wp-content/themes/iBluety/footer.php";}', 'no'),
(47, 0, 'template', 'shanksop', 'yes'),
(48, 0, 'stylesheet', 'shanksop', 'yes'),
(49, 0, 'comment_whitelist', '1', 'yes'),
(50, 0, 'blacklist_keys', '', 'no'),
(51, 0, 'comment_registration', '0', 'yes'),
(52, 0, 'rss_language', 'en', 'yes'),
(53, 0, 'html_type', 'text/html', 'yes'),
(54, 0, 'use_trackback', '0', 'yes'),
(55, 0, 'default_role', 'subscriber', 'yes'),
(56, 0, 'db_version', '19470', 'yes'),
(57, 0, 'uploads_use_yearmonth_folders', '1', 'yes'),
(58, 0, 'upload_path', '', 'yes'),
(59, 0, 'blog_public', '1', 'yes'),
(60, 0, 'default_link_category', '2', 'yes'),
(61, 0, 'show_on_front', 'posts', 'yes'),
(62, 0, 'tag_base', '', 'yes'),
(63, 0, 'show_avatars', '1', 'yes'),
(64, 0, 'avatar_rating', 'G', 'yes'),
(65, 0, 'upload_url_path', '', 'yes'),
(66, 0, 'thumbnail_size_w', '150', 'yes'),
(67, 0, 'thumbnail_size_h', '150', 'yes'),
(68, 0, 'thumbnail_crop', '1', 'yes'),
(69, 0, 'medium_size_w', '300', 'yes'),
(70, 0, 'medium_size_h', '300', 'yes'),
(71, 0, 'avatar_default', 'mystery', 'yes'),
(72, 0, 'enable_app', '', 'yes'),
(73, 0, 'enable_xmlrpc', '', 'yes'),
(74, 0, 'large_size_w', '1024', 'yes'),
(75, 0, 'large_size_h', '1024', 'yes'),
(76, 0, 'image_default_link_type', 'file', 'yes'),
(77, 0, 'image_default_size', '', 'yes'),
(78, 0, 'image_default_align', '', 'yes'),
(79, 0, 'close_comments_for_old_posts', '0', 'yes'),
(80, 0, 'close_comments_days_old', '14', 'yes'),
(81, 0, 'thread_comments', '1', 'yes'),
(82, 0, 'thread_comments_depth', '5', 'yes'),
(83, 0, 'page_comments', '0', 'yes'),
(84, 0, 'comments_per_page', '50', 'yes'),
(85, 0, 'default_comments_page', 'newest', 'yes'),
(86, 0, 'comment_order', 'asc', 'yes'),
(87, 0, 'sticky_posts', 'a:0:{}', 'yes'),
(88, 0, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(89, 0, 'widget_text', 'a:0:{}', 'yes'),
(90, 0, 'widget_rss', 'a:0:{}', 'yes'),
(91, 0, 'timezone_string', '', 'yes'),
(92, 0, 'embed_autourls', '1', 'yes'),
(93, 0, 'embed_size_w', '', 'yes'),
(94, 0, 'embed_size_h', '600', 'yes'),
(95, 0, 'page_for_posts', '0', 'yes'),
(96, 0, 'page_on_front', '0', 'yes'),
(97, 0, 'default_post_format', '', 'yes'),
(98, 0, 'initial_db_version', '19470', 'yes'),
(99, 0, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:62:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(100, 0, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(101, 0, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(102, 0, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(103, 0, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(104, 0, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(105, 0, 'sidebars_widgets', 'a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:4:{i:0;s:14:"recent-posts-2";i:1;s:17:"recent-comments-2";i:2;s:10:"archives-2";i:3;s:12:"categories-2";}s:9:"sidebar-2";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(106, 0, 'cron', 'a:3:{i:1346778214;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1346778242;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(377, 0, 'sm_status', 'O:28:"GoogleSitemapGeneratorStatus":29:{s:10:"_startTime";d:1344413649.3806068897247314453125;s:8:"_endTime";d:1344413650.8519179821014404296875;s:11:"_hasChanged";b:1;s:12:"_memoryUsage";i:15990784;s:9:"_lastPost";i:6;s:9:"_lastTime";d:1344413649.40203189849853515625;s:8:"_usedXml";b:1;s:11:"_xmlSuccess";b:1;s:8:"_xmlPath";s:37:"D:/PHPnow/vhosts/piyi.com/sitemap.xml";s:7:"_xmlUrl";s:31:"http://www.piyi.com/sitemap.xml";s:8:"_usedZip";b:1;s:11:"_zipSuccess";b:1;s:8:"_zipPath";s:40:"D:/PHPnow/vhosts/piyi.com/sitemap.xml.gz";s:7:"_zipUrl";s:34:"http://www.piyi.com/sitemap.xml.gz";s:11:"_usedGoogle";b:1;s:10:"_googleUrl";s:97:"http://www.google.com/webmasters/sitemaps/ping?sitemap=http%3A%2F%2Fwww.piyi.com%2Fsitemap.xml.gz";s:15:"_gooogleSuccess";b:1;s:16:"_googleStartTime";d:1344413649.411940097808837890625;s:14:"_googleEndTime";d:1344413649.7002680301666259765625;s:8:"_usedAsk";b:1;s:7:"_askUrl";s:82:"http://submissions.ask.com/ping?sitemap=http%3A%2F%2Fwww.piyi.com%2Fsitemap.xml.gz";s:11:"_askSuccess";b:0;s:13:"_askStartTime";d:1344413649.70121002197265625;s:11:"_askEndTime";d:1344413649.950333118438720703125;s:8:"_usedMsn";b:1;s:7:"_msnUrl";s:90:"http://www.bing.com/webmaster/ping.aspx?siteMap=http%3A%2F%2Fwww.piyi.com%2Fsitemap.xml.gz";s:11:"_msnSuccess";b:0;s:13:"_msnStartTime";d:1344413649.95186710357666015625;s:11:"_msnEndTime";d:1344413650.85099697113037109375;}', 'no'),
(111, 0, '_site_transient_timeout_browser_3b124f10db86230e3d6ec2b3adbd4b61', '1324659838', 'yes'),
(592, 0, '_transient_plugins_delete_result_2', '1', 'yes'),
(110, 0, '_site_transient_update_themes', 'O:8:"stdClass":3:{s:12:"last_checked";i:1346756019;s:7:"checked";a:2:{s:17:"abstrakt-theme-10";s:3:"1.0";s:8:"shanksop";s:3:"2.0";}s:8:"response";a:0:{}}', 'yes'),
(112, 0, '_site_transient_browser_3b124f10db86230e3d6ec2b3adbd4b61', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"14.0.835.202";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"13";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(113, 0, 'dashboard_widget_options', 'a:4:{s:25:"dashboard_recent_comments";a:1:{s:5:"items";i:5;}s:24:"dashboard_incoming_links";a:5:{s:4:"home";s:19:"http://www.piyi.com";s:4:"link";s:95:"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://www.piyi.com/";s:3:"url";s:149:"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://akanneklein.menswomenswatches.com/";s:5:"items";i:10;s:9:"show_date";b:0;}s:17:"dashboard_primary";a:7:{s:4:"link";s:26:"http://wordpress.org/news/";s:3:"url";s:31:"http://wordpress.org/news/feed/";s:5:"title";s:14:"WordPress Blog";s:5:"items";i:2;s:12:"show_summary";i:1;s:11:"show_author";i:0;s:9:"show_date";i:1;}s:19:"dashboard_secondary";a:7:{s:4:"link";s:28:"http://planet.wordpress.org/";s:3:"url";s:33:"http://planet.wordpress.org/feed/";s:5:"title";s:20:"Other WordPress News";s:5:"items";i:5;s:12:"show_summary";i:0;s:11:"show_author";i:0;s:9:"show_date";i:0;}}', 'yes'),
(1161, 0, 'current_theme', 'Review-Theme', 'yes'),
(125, 0, 'can_compress_scripts', '1', 'yes'),
(1145, 0, 'theme_mods_shanksop', 'a:1:{i:0;b:0;}', 'yes'),
(1164, 0, 'rewrite_rules', 'a:99:{s:83:"(american-girl-dolls-coupons-codes-discounts)/(?:feed/)?(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:66:"(american-girl-dolls-coupons-codes-discounts)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:48:"(american-girl-dolls-coupons-codes-discounts)/?$";s:35:"index.php?category_name=$matches[1]";s:14:"category/(.*)$";s:39:"index.php?category_redirect=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:34:"slider/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:44:"slider/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:64:"slider/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"slider/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:59:"slider/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:27:"slider/([^/]+)/trackback/?$";s:33:"index.php?slider=$matches[1]&tb=1";s:47:"slider/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?slider=$matches[1]&feed=$matches[2]";s:42:"slider/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?slider=$matches[1]&feed=$matches[2]";s:35:"slider/([^/]+)/page/?([0-9]{1,})/?$";s:46:"index.php?slider=$matches[1]&paged=$matches[2]";s:42:"slider/([^/]+)/comment-page-([0-9]{1,})/?$";s:46:"index.php?slider=$matches[1]&cpage=$matches[2]";s:29:"slider/([^/]+)/all(/(.*))?/?$";s:44:"index.php?slider=$matches[1]&all=$matches[3]";s:35:"slider/[^/]+/([^/]+)/all(/(.*))?/?$";s:48:"index.php?attachment=$matches[1]&all=$matches[2]";s:46:"slider/[^/]+/attachment/([^/]+)/all(/(.*))?/?$";s:48:"index.php?attachment=$matches[1]&all=$matches[2]";s:27:"slider/([^/]+)(/[0-9]+)?/?$";s:45:"index.php?slider=$matches[1]&page=$matches[2]";s:23:"slider/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:33:"slider/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:53:"slider/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"slider/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:48:"slider/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:14:"all(/(.*))?/?$";s:26:"index.php?&all=$matches[2]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:29:"comments/page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:23:"comments/all(/(.*))?/?$";s:26:"index.php?&all=$matches[2]";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:26:"search/(.+)/all(/(.*))?/?$";s:39:"index.php?s=$matches[1]&all=$matches[3]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:29:"author/([^/]+)/all(/(.*))?/?$";s:49:"index.php?author_name=$matches[1]&all=$matches[3]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:51:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/all(/(.*))?/?$";s:79:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&all=$matches[5]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:38:"([0-9]{4})/([0-9]{1,2})/all(/(.*))?/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&all=$matches[4]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:25:"([0-9]{4})/all(/(.*))?/?$";s:42:"index.php?year=$matches[1]&all=$matches[3]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:22:"(.?.+?)/all(/(.*))?/?$";s:46:"index.php?pagename=$matches[1]&all=$matches[3]";s:28:".?.+?/([^/]+)/all(/(.*))?/?$";s:48:"index.php?attachment=$matches[1]&all=$matches[2]";s:39:".?.+?/attachment/([^/]+)/all(/(.*))?/?$";s:48:"index.php?attachment=$matches[1]&all=$matches[2]";s:20:"(.?.+?)(/[0-9]+)?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:22:"([^/]+)/all(/(.*))?/?$";s:42:"index.php?name=$matches[1]&all=$matches[3]";s:28:"[^/]+/([^/]+)/all(/(.*))?/?$";s:48:"index.php?attachment=$matches[1]&all=$matches[2]";s:39:"[^/]+/attachment/([^/]+)/all(/(.*))?/?$";s:48:"index.php?attachment=$matches[1]&all=$matches[2]";s:20:"([^/]+)(/[0-9]+)?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";}', 'yes'),
(1121, 0, '_transient_timeout_dash_20494a3d90a6669585674ed0eb8dcd8f', '1346770080', 'no'),
(1122, 0, '_transient_dash_20494a3d90a6669585674ed0eb8dcd8f', '<p><strong>RSS Error</strong>: WP HTTP Error: Could not resolve host: blogsearch.google.com; Host not found</p>', 'no'),
(1123, 0, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1346770082', 'no'),
(1124, 0, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Could not resolve host: wordpress.org; Host not found</p></div>', 'no'),
(1136, 0, '_transient_timeout_dash_de3249c4736ad3bd2cd29147c4a0d43e', '1346770127', 'no'),
(1137, 0, '_transient_dash_de3249c4736ad3bd2cd29147c4a0d43e', '', 'no'),
(319, 0, 'ddsg_which_first', 'posts', 'yes'),
(320, 0, 'ddsg_post_sort_order', 'title', 'yes'),
(321, 0, 'ddsg_page_sort_order', 'title', 'yes'),
(322, 0, 'ddsg_comments_on_posts', '', 'yes'),
(323, 0, 'ddsg_comments_on_pages', '', 'yes'),
(324, 0, 'ddsg_show_zero_comments', '', 'yes'),
(325, 0, 'ddsg_hide_future', '', 'yes'),
(326, 0, 'ddsg_new_window', '', 'yes'),
(327, 0, 'ddsg_show_post_date', '', 'yes'),
(328, 0, 'ddsg_show_page_date', '', 'yes'),
(329, 0, 'ddsg_date_format', 'F jS, Y', 'yes'),
(330, 0, 'ddsg_hide_protected', '1', 'yes'),
(331, 0, 'ddsg_excluded_cats', '', 'yes'),
(332, 0, 'ddsg_excluded_pages', '', 'yes'),
(333, 0, 'ddsg_page_nav', '2', 'yes'),
(334, 0, 'ddsg_page_nav_where', 'top', 'yes'),
(335, 0, 'ddsg_xml_path', '', 'yes'),
(336, 0, 'ddsg_xml_where', 'last', 'yes'),
(352, 0, '_transient_plugins_delete_result_1', '1', 'yes'),
(1134, 0, '_transient_timeout_plugin_slugs', '1346813327', 'no'),
(1135, 0, '_transient_plugin_slugs', 'a:10:{i:0;s:21:"acs-with-discount.php";i:1;s:39:"sitemap-generator/sitemap-generator.php";i:2;s:36:"google-sitemap-generator/sitemap.php";i:3;s:20:"pagebar/pagebar2.php";i:4;s:65:"permalink-trailing-slash-fixer/permalink-trailing-slash-fixer.php";i:5;s:18:"scheduled_mias.php";i:6;s:27:"wp-optimize/wp-optimize.php";i:7;s:27:"wp-pagenavi/wp-pagenavi.php";i:8;s:29:"wp-postviews/wp-postviews.php";i:9;s:40:"wp-no-category-base/no-category-base.php";}', 'no'),
(373, 0, 'sm_options', 'a:57:{s:18:"sm_b_prio_provider";s:41:"GoogleSitemapGeneratorPrioByCountProvider";s:13:"sm_b_filename";s:11:"sitemap.xml";s:10:"sm_b_debug";b:1;s:8:"sm_b_xml";b:1;s:9:"sm_b_gzip";b:1;s:9:"sm_b_ping";b:1;s:12:"sm_b_pingask";b:1;s:12:"sm_b_pingmsn";b:1;s:19:"sm_b_manual_enabled";b:0;s:17:"sm_b_auto_enabled";b:1;s:15:"sm_b_auto_delay";b:1;s:15:"sm_b_manual_key";s:32:"45312c57769aa1fb90eca0a7533004b4";s:11:"sm_b_memory";s:0:"";s:9:"sm_b_time";i:-1;s:14:"sm_b_max_posts";i:-1;s:13:"sm_b_safemode";b:0;s:18:"sm_b_style_default";b:1;s:10:"sm_b_style";s:0:"";s:11:"sm_b_robots";b:1;s:12:"sm_b_exclude";a:0:{}s:17:"sm_b_exclude_cats";a:0:{}s:18:"sm_b_location_mode";s:4:"auto";s:20:"sm_b_filename_manual";s:0:"";s:19:"sm_b_fileurl_manual";s:0:"";s:10:"sm_in_home";b:1;s:11:"sm_in_posts";b:1;s:15:"sm_in_posts_sub";b:0;s:11:"sm_in_pages";b:1;s:10:"sm_in_cats";b:0;s:10:"sm_in_arch";b:0;s:10:"sm_in_auth";b:0;s:10:"sm_in_tags";b:0;s:9:"sm_in_tax";a:0:{}s:17:"sm_in_customtypes";a:0:{}s:13:"sm_in_lastmod";b:1;s:10:"sm_cf_home";s:5:"daily";s:11:"sm_cf_posts";s:7:"monthly";s:11:"sm_cf_pages";s:6:"weekly";s:10:"sm_cf_cats";s:6:"weekly";s:10:"sm_cf_auth";s:6:"weekly";s:15:"sm_cf_arch_curr";s:5:"daily";s:14:"sm_cf_arch_old";s:6:"yearly";s:10:"sm_cf_tags";s:6:"weekly";s:10:"sm_pr_home";d:1;s:11:"sm_pr_posts";d:0.59999999999999997779553950749686919152736663818359375;s:15:"sm_pr_posts_min";d:0.200000000000000011102230246251565404236316680908203125;s:11:"sm_pr_pages";d:0.59999999999999997779553950749686919152736663818359375;s:10:"sm_pr_cats";d:0.299999999999999988897769753748434595763683319091796875;s:10:"sm_pr_arch";d:0.299999999999999988897769753748434595763683319091796875;s:10:"sm_pr_auth";d:0.299999999999999988897769753748434595763683319091796875;s:10:"sm_pr_tags";d:0.299999999999999988897769753748434595763683319091796875;s:12:"sm_i_donated";b:0;s:17:"sm_i_hide_donated";b:0;s:17:"sm_i_install_date";i:1324132785;s:14:"sm_i_hide_note";b:0;s:15:"sm_i_hide_works";b:0;s:16:"sm_i_hide_donors";b:0;}', 'yes'),
(1140, 0, '_site_transient_timeout_wporg_theme_feature_list', '1346737757', 'yes'),
(1141, 0, '_site_transient_wporg_theme_feature_list', 'a:0:{}', 'yes'),
(1143, 0, 'theme_mods_twentyeleven', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1346726956;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:0:{}s:18:"orphaned_widgets_1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:18:"orphaned_widgets_2";a:0:{}s:18:"orphaned_widgets_3";a:0:{}s:18:"orphaned_widgets_4";a:0:{}s:18:"orphaned_widgets_5";a:0:{}}}}', 'yes'),
(159, 0, 'theme_mods_iBluety', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1344410923;s:4:"data";a:7:{s:19:"wp_inactive_widgets";a:0:{}s:19:"primary-widget-area";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:21:"secondary-widget-area";a:0:{}s:24:"first-footer-widget-area";a:0:{}s:25:"second-footer-widget-area";a:0:{}s:24:"third-footer-widget-area";a:0:{}s:25:"fourth-footer-widget-area";N;}}}', 'yes'),
(160, 0, 'theme_switched', '', 'yes'),
(163, 0, '_transient_random_seed', 'bb77726e5fe607aa71831da7ce01d08a', 'yes'),
(168, 0, 'recently_activated', 'a:0:{}', 'yes'),
(169, 0, 'postbar', 'a:23:{s:4:"left";s:1:"3";s:6:"center";s:1:"8";s:5:"right";s:1:"3";s:6:"pbText";s:6:"Pages:";s:6:"remove";s:0:"";s:8:"standard";s:6:"{page}";s:7:"current";s:6:"{page}";s:5:"first";s:6:"{page}";s:4:"last";s:6:"{page}";s:7:"connect";s:3:"...";s:4:"prev";s:4:"Prev";s:4:"next";s:4:"Next";s:11:"tooltipText";s:11:"Page {page}";s:8:"tooltips";s:2:"on";s:8:"pdisplay";s:4:"auto";s:8:"ndisplay";s:4:"auto";s:10:"stylesheet";s:8:"styleCss";s:11:"cssFilename";s:11:"pagebar.css";s:7:"inherit";s:0:"";s:4:"auto";s:2:"on";s:8:"bef_loop";s:0:"";s:8:"aft_loop";s:0:"";s:6:"footer";s:0:"";}', 'yes'),
(170, 0, 'multipagebar', 'a:21:{s:4:"left";s:1:"3";s:6:"center";s:1:"7";s:5:"right";s:1:"3";s:6:"pbText";s:6:"Pages:";s:6:"remove";s:0:"";s:8:"standard";s:6:"{page}";s:7:"current";s:6:"{page}";s:5:"first";s:6:"{page}";s:4:"last";s:6:"{page}";s:7:"connect";s:3:"...";s:4:"prev";s:4:"Prev";s:4:"next";s:4:"Next";s:11:"tooltipText";s:11:"Page {page}";s:8:"tooltips";s:2:"on";s:8:"pdisplay";s:4:"auto";s:8:"ndisplay";s:4:"auto";s:10:"stylesheet";s:8:"styleCss";s:11:"cssFilename";s:11:"pagebar.css";s:7:"inherit";s:2:"on";s:3:"all";s:2:"on";s:9:"label_all";s:3:"All";}', 'yes'),
(171, 0, 'commentbar', 'a:22:{s:4:"left";s:1:"3";s:6:"center";s:1:"7";s:5:"right";s:1:"3";s:6:"pbText";s:6:"Pages:";s:6:"remove";s:0:"";s:8:"standard";s:6:"{page}";s:7:"current";s:6:"{page}";s:5:"first";s:6:"{page}";s:4:"last";s:6:"{page}";s:7:"connect";s:3:"...";s:4:"prev";s:4:"Prev";s:4:"next";s:4:"Next";s:11:"tooltipText";s:11:"Page {page}";s:8:"tooltips";s:2:"on";s:8:"pdisplay";s:4:"auto";s:8:"ndisplay";s:4:"auto";s:10:"stylesheet";s:8:"styleCss";s:11:"cssFilename";s:11:"pagebar.css";s:7:"inherit";s:2:"on";s:3:"all";s:0:"";s:9:"where_all";s:0:"";s:9:"label_all";s:0:"";}', 'yes'),
(571, 0, 'category_children', 'a:0:{}', 'yes'),
(315, 0, 'ddsg_language', 'English', 'yes'),
(316, 0, 'ddsg_items_per_page', '68', 'yes'),
(317, 0, 'ddsg_sm_name', '', 'yes'),
(318, 0, 'ddsg_what_to_show', 'both', 'yes'),
(386, 0, '_site_transient_timeout_browser_5e48f79062d325bf84b3f1e22a652f32', '1329994848', 'yes'),
(391, 0, '_site_transient_update_core', 'O:8:"stdClass":3:{s:7:"updates";a:1:{i:0;O:8:"stdClass":9:{s:8:"response";s:7:"upgrade";s:8:"download";s:40:"http://wordpress.org/wordpress-3.4.1.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":4:{s:4:"full";s:40:"http://wordpress.org/wordpress-3.4.1.zip";s:10:"no_content";s:51:"http://wordpress.org/wordpress-3.4.1-no-content.zip";s:11:"new_bundled";s:52:"http://wordpress.org/wordpress-3.4.1-new-bundled.zip";s:7:"partial";b:0;}s:7:"current";s:5:"3.4.1";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"3.2";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1346756017;s:15:"version_checked";s:5:"3.3.1";}', 'yes'),
(396, 0, '_site_transient_update_plugins', 'O:8:"stdClass":3:{s:12:"last_checked";i:1346756017;s:7:"checked";a:13:{s:19:"akismet/akismet.php";s:5:"2.5.3";s:43:"all-in-one-seo-pack/all_in_one_seo_pack.php";s:8:"1.6.13.4";s:39:"sitemap-generator/sitemap-generator.php";s:4:"3.17";s:43:"easy-privacy-policy/easy-privacy-policy.php";s:4:"1.02";s:36:"google-sitemap-generator/sitemap.php";s:5:"3.2.6";s:35:"missed-schedule/missed-schedule.php";s:3:"1.0";s:20:"pagebar/pagebar2.php";s:6:"2.59.1";s:65:"permalink-trailing-slash-fixer/permalink-trailing-slash-fixer.php";s:5:"1.0.1";s:18:"scheduled_mias.php";s:5:"5.U.B";s:33:"seo-automatic-links/seo-links.php";s:3:"2.7";s:27:"wp-optimize/wp-optimize.php";s:5:"0.9.4";s:40:"wp-no-category-base/no-category-base.php";s:3:"1.0";s:44:"WP-Simplicity/WP-Simplicity-Installation.php";s:4:"1.01";}s:8:"response";a:5:{s:19:"akismet/akismet.php";O:8:"stdClass":5:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:11:"new_version";s:5:"2.5.6";s:3:"url";s:44:"http://wordpress.org/extend/plugins/akismet/";s:7:"package";s:55:"http://downloads.wordpress.org/plugin/akismet.2.5.6.zip";}s:43:"all-in-one-seo-pack/all_in_one_seo_pack.php";O:8:"stdClass":5:{s:2:"id";s:3:"520";s:4:"slug";s:19:"all-in-one-seo-pack";s:11:"new_version";s:6:"1.6.15";s:3:"url";s:56:"http://wordpress.org/extend/plugins/all-in-one-seo-pack/";s:7:"package";s:61:"http://downloads.wordpress.org/plugin/all-in-one-seo-pack.zip";}s:36:"google-sitemap-generator/sitemap.php";O:8:"stdClass":5:{s:2:"id";s:3:"132";s:4:"slug";s:24:"google-sitemap-generator";s:11:"new_version";s:5:"3.2.8";s:3:"url";s:61:"http://wordpress.org/extend/plugins/google-sitemap-generator/";s:7:"package";s:72:"http://downloads.wordpress.org/plugin/google-sitemap-generator.3.2.8.zip";}s:33:"seo-automatic-links/seo-links.php";O:8:"stdClass":5:{s:2:"id";s:4:"3622";s:4:"slug";s:19:"seo-automatic-links";s:11:"new_version";s:5:"2.7.5";s:3:"url";s:56:"http://wordpress.org/extend/plugins/seo-automatic-links/";s:7:"package";s:61:"http://downloads.wordpress.org/plugin/seo-automatic-links.zip";}s:40:"wp-no-category-base/no-category-base.php";O:8:"stdClass":5:{s:2:"id";s:4:"7311";s:4:"slug";s:19:"wp-no-category-base";s:11:"new_version";s:5:"1.1.1";s:3:"url";s:56:"http://wordpress.org/extend/plugins/wp-no-category-base/";s:7:"package";s:61:"http://downloads.wordpress.org/plugin/wp-no-category-base.zip";}}}', 'yes'),
(387, 0, '_site_transient_browser_5e48f79062d325bf84b3f1e22a652f32', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:11:"16.0.912.75";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(517, 0, '_site_transient_timeout_browser_5d0a23486ab602a914971c63fc0143e3', '1335841353', 'yes'),
(518, 0, '_site_transient_browser_5d0a23486ab602a914971c63fc0143e3', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:10:"18.0.966.0";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(632, 0, 'theme_mods_shanks', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1346726924;s:4:"data";a:3:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:4:{i:0;s:14:"recent-posts-2";i:1;s:17:"recent-comments-2";i:2;s:10:"archives-2";i:3;s:12:"categories-2";}s:9:"sidebar-2";a:0:{}}}}', 'yes'),
(639, 0, 'uninstall_plugins', 'a:2:{i:0;b:0;s:27:"wp-pagenavi/wp-pagenavi.php";s:14:"__return_false";}', 'yes'),
(640, 0, 'pagenavi_options', 'a:15:{s:10:"pages_text";s:36:"Page %CURRENT_PAGE% of %TOTAL_PAGES%";s:12:"current_text";s:13:"%PAGE_NUMBER%";s:9:"page_text";s:13:"%PAGE_NUMBER%";s:10:"first_text";s:8:"« First";s:9:"last_text";s:7:"Last »";s:9:"prev_text";s:2:"«";s:9:"next_text";s:2:"»";s:12:"dotleft_text";s:3:"...";s:13:"dotright_text";s:3:"...";s:9:"num_pages";i:5;s:23:"num_larger_page_numbers";i:0;s:28:"larger_page_numbers_multiple";i:10;s:11:"always_show";b:0;s:16:"use_pagenavi_css";b:1;s:5:"style";i:1;}', 'yes'),
(1095, 0, 'views_options', 'a:10:{s:5:"count";i:1;s:12:"exclude_bots";i:0;s:12:"display_home";i:0;s:14:"display_single";i:0;s:12:"display_page";i:0;s:15:"display_archive";i:0;s:14:"display_search";i:0;s:13:"display_other";i:0;s:8:"template";s:18:"%VIEW_COUNT% views";s:20:"most_viewed_template";s:89:"<li><a href="%POST_URL%"  title="%POST_TITLE%">%POST_TITLE%</a> - %VIEW_COUNT% views</li>";}', 'yes'),
(991, 0, '_site_transient_browser_5a78a246d8232f407f7b23d6d0e4e9fd', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:10:"18.0.966.0";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(990, 0, '_site_transient_timeout_browser_5a78a246d8232f407f7b23d6d0e4e9fd', '1345018559', 'yes'),
(1128, 0, '_transient_timeout_dash_aa95765b5cc111c56d5993d476b1c2f0', '1346770119', 'no'),
(1129, 0, '_transient_dash_aa95765b5cc111c56d5993d476b1c2f0', '<div class="rss-widget"><p><strong>RSS Error</strong>: WP HTTP Error: Could not resolve host: planet.wordpress.org; Host not found</p></div>', 'no'),
(1159, 0, '_site_transient_timeout_browser_aa5ed5e7480ad7e1057c81eb9794b05d', '1347360857', 'yes'),
(1160, 0, '_site_transient_browser_aa5ed5e7480ad7e1057c81eb9794b05d', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:17:"Internet Explorer";s:7:"version";s:3:"7.0";s:10:"update_url";s:51:"http://www.microsoft.com/windows/internet-explorer/";s:7:"img_src";s:45:"http://s.wordpress.org/images/browsers/ie.png";s:11:"img_src_ssl";s:44:"https://wordpress.org/images/browsers/ie.png";s:15:"current_version";s:1:"9";s:7:"upgrade";b:1;s:8:"insecure";b:1;}', 'yes');

-- --------------------------------------------------------

--
-- 表的结构 `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=41 ;

--
-- 转存表中的数据 `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(5, 2, '_edit_lock', '1324117066:1'),
(6, 2, '_edit_last', '1'),
(25, 14, '_wp_trash_meta_status', 'draft'),
(24, 14, '_edit_lock', '1344412297:2'),
(19, 12, '_edit_last', '2'),
(20, 12, '_edit_lock', '1344405480:2'),
(21, 12, '_wp_page_template', 'Affiliate Disclosure.php'),
(23, 14, '_edit_last', '2'),
(15, 10, '_edit_last', '2'),
(16, 10, '_edit_lock', '1344406896:2'),
(17, 10, '_wp_page_template', 'disclaimer.php'),
(26, 14, '_wp_trash_meta_time', '1344412304'),
(30, 15, '_edit_lock', '1344406227:2'),
(29, 15, '_edit_last', '2'),
(31, 15, '_wp_page_template', 'Contact Us.php'),
(33, 16, '_edit_last', '2'),
(34, 16, '_edit_lock', '1344406125:2'),
(35, 16, '_wp_page_template', 'Terms of Use.php'),
(37, 17, '_edit_last', '2'),
(38, 17, '_edit_lock', '1344406546:2'),
(39, 17, '_wp_page_template', 'Privacy Policy.php');

-- --------------------------------------------------------

--
-- 表的结构 `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` text NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- 转存表中的数据 `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(2, 2, '2011-12-16 17:03:26', '2011-12-16 17:03:26', '<!-- ddsitemapgen -->', 'Sitemap', '', 'publish', 'open', 'open', '', 'sitemap', '', '', '2011-12-17 12:17:07', '2011-12-17 12:17:07', '', 0, 'http://akanneklein.menswomenswatches.com/?page_id=2', 0, 'page', '', 0),
(13, 2, '2012-08-08 07:47:45', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-08-08 07:47:45', '0000-00-00 00:00:00', '', 0, 'http://www.piyi.com/?page_id=13', 0, 'page', '', 0),
(12, 2, '2012-08-08 07:48:17', '2012-08-08 07:48:17', '', 'Affiliate Disclosure', '', 'publish', 'open', 'open', '', 'affiliate-disclosure', '', '', '2012-08-08 07:51:49', '2012-08-08 07:51:49', '', 0, 'http://www.piyi.com/?page_id=12', 0, 'page', '', 0),
(8, 2, '2012-08-08 07:39:53', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-08-08 07:39:53', '0000-00-00 00:00:00', '', 0, 'http://www.piyi.com/?page_id=8', 0, 'page', '', 0),
(9, 2, '2012-08-08 07:40:21', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-08-08 07:40:21', '0000-00-00 00:00:00', '', 0, 'http://www.piyi.com/?page_id=9', 0, 'page', '', 0),
(10, 2, '2012-08-08 07:40:47', '2012-08-08 07:40:47', '', 'Disclaimer', '', 'publish', 'open', 'open', '', 'disclaimer-3', '', '', '2012-08-08 07:40:47', '2012-08-08 07:40:47', '', 0, 'http://www.piyi.com/?page_id=10', 0, 'page', '', 0),
(11, 2, '2012-08-08 07:42:59', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-08-08 07:42:59', '0000-00-00 00:00:00', '', 0, 'http://www.piyi.com/?page_id=11', 0, 'page', '', 0),
(14, 2, '2012-08-08 07:51:37', '2012-08-08 07:51:37', '', 'Contact Us', '', 'trash', 'open', 'open', '', 'contact-us', '', '', '2012-08-08 07:51:44', '2012-08-08 07:51:44', '', 0, 'http://www.piyi.com/?page_id=14', 0, 'page', '', 0),
(15, 2, '2012-08-08 07:51:58', '2012-08-08 07:51:58', '', 'Contact Us', '', 'publish', 'open', 'open', '', 'contact-us-2', '', '', '2012-08-08 07:51:58', '2012-08-08 07:51:58', '', 0, 'http://www.piyi.com/?page_id=15', 0, 'page', '', 0),
(16, 2, '2012-08-08 07:58:59', '2012-08-08 07:58:59', '', 'Terms of Use', '', 'publish', 'open', 'open', '', 'terms-of-use', '', '', '2012-08-08 08:03:04', '2012-08-08 08:03:04', '', 0, 'http://www.piyi.com/?page_id=16', 0, 'page', '', 0),
(17, 2, '2012-08-08 07:59:52', '2012-08-08 07:59:52', '', 'Privacy Policy', '', 'publish', 'open', 'open', '', 'privacy-policy', '', '', '2012-08-08 08:12:19', '2012-08-08 08:12:19', '', 0, 'http://www.piyi.com/?page_id=17', 0, 'page', '', 0),
(18, 2, '2012-08-08 08:15:59', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2012-08-08 08:15:59', '0000-00-00 00:00:00', '', 0, 'http://www.piyi.com/?p=18', 0, 'post', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Free Shopping: American Girl Dolls Coupons Codes Discounts', 'american-girl-dolls-coupons-codes-discounts', 0),
(2, 'Blogroll', 'blogroll', 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 2, 0),
(2, 2, 0),
(3, 2, 0),
(4, 2, 0),
(5, 2, 0),
(6, 2, 0),
(7, 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', 'Free Shopping: American Girl Dolls Coupons Codes Discounts', 0, 0),
(2, 2, 'link_category', '', 0, 7);

-- --------------------------------------------------------

--
-- 表的结构 `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- 转存表中的数据 `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(19, 2, 'first_name', ''),
(20, 2, 'last_name', ''),
(21, 2, 'nickname', 'shanks'),
(22, 2, 'description', ''),
(23, 2, 'rich_editing', 'true'),
(24, 2, 'comment_shortcuts', 'false'),
(25, 2, 'admin_color', 'fresh'),
(26, 2, 'use_ssl', '0'),
(27, 2, 'show_admin_bar_front', 'true'),
(28, 2, 'wp_capabilities', 'a:1:{s:13:"administrator";s:1:"1";}'),
(29, 2, 'wp_user_level', '10'),
(30, 2, 'dismissed_wp_pointers', 'wp330_toolbar,wp330_media_uploader,wp330_saving_widgets'),
(31, 2, 'aim', ''),
(32, 2, 'yim', ''),
(33, 2, 'jabber', ''),
(34, 2, 'wp_dashboard_quick_press_last_post_id', '18'),
(35, 2, 'wp_user-settings', 'editor=html'),
(36, 2, 'wp_user-settings-time', '1344410918'),
(37, 2, 'closedpostboxes_dashboard', 'a:1:{i:0;s:19:"dashboard_right_now";}'),
(38, 2, 'metaboxhidden_dashboard', 'a:0:{}');

-- --------------------------------------------------------

--
-- 表的结构 `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(2, 'shanks', '$P$BCVI0C.YCAWHN36llbm38ooit774T.1', 'shanks', 'shanks2003@hotmail.com', '', '2012-04-24 03:03:36', '', 0, 'shanks');
