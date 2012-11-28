<?php
//Plugin slugs are managed here to install
$pluginslug = array('google-sitemap-generator'=>'Google XML Sitemaps','si-captcha-for-wordpress'=>'SI CAPTCHA Anti-Spam','all-in-one-seo-pack' => 'All in One SEO Pack','gocodes'=>'GoCodes','si-contact-form' => 'Fast and Secure Contact Form','page-links-to' => 'Page Links To','google-analytics-for-wordpress' => 'Google Analytics for WordPress','google-analyticator' => 'Google Analyticator','wp-super-cache' => 'WP Super Cache','global-translator' => 'Global Translator','yet-another-related-posts-plugin' => 'Yet Another Related Posts Plugin','amazonpress' => 'Amazonpress','tubepress' => 'Tubepress','twitme' => 'Twitme','g-lock-double-opt-in-manager' => 'G-Lock Double Opt-in Manager','shorten2ping' => 'Shorten2Ping','nextgen-gallery' => 'NextGEN Gallery','contact-form-7' => 'Contact Form 7','wp-followme' => 'WP FollowMe','add-to-any' => 'AddToAny: Share/Bookmark/Email Button','wp-cumulus' => 'WP-Cumulus','gd-star-rating' => 'GD Star Rating','wp-e-commerce' => 'WP e-Commerce','page-flip-image-gallery' => 'Page Flip Image Gallery','stats' => 'WordPress.com Stats','post-rich-videos-and-photos-galleries' => 'Post videos and photo galleries','wp-security-scan'=> 'WP Security Scan','broken-link-checker' => 'Broken Link Checker','sexybookmarks' => 'SexyBookmarks','twitter-widget-pro' => 'Twitter Widget Pro','feedwordpress' => 'FeedWordPress','wp-pagenavi' => 'WP-PageNavi','tweetmeme' => 'TweetMeme Button','exploit-scanner' => 'Exploit Scanner','wp-optimize' => 'WP-Optimize','wp-greet-box' => 'WP Greet Box','random-posts-widget-include' => 'Random Pages Widget','facebook-like-button' => 'Facebook Like Button','buddypress' => 'BuddyPress','wp-db-backup' => 'WP-DB-Backup','social-media-widget' => 'Social Media Widget','wordpress-importer' => 'WordPress Importer');

// Manage the title and content of posts
$postdata = array(
			'1'=>array(
				'title'=>"{v} - Some Text Here",
				'content'=>"Edit this with an article that has your {v} 2-3 times in this post. Also include 2-3 more other keywords in this post"
			),
			'2'=>array(
				'title'=>"{v} - Some Title Text Here",
				'content'=>"Edit this with an article that has your {v} 2-3 times in this post. Also include 2-3 more other keywords in this post"
			),
			'3'=>array(
				'title'=>"{v} - Some Title",
				'content'=>"Edit this with an article that has your {v} 2-3 times in this post. Also include 2-3 more other keywords in this post"
			),
			'4'=>array(
				'title'=>"Some Title Text",
				'content'=>"Edit this with an article that has your {v} 2-3 times in this post. Also include 2-3 more other keywords in this post"
                        ),
			'5'=>array(
				'title'=>"Some Title Text Here",
				'content'=>"Edit this with an article that has your {v} 2-3 times in this post. Also include 2-3 more other keywords in this post"
                        ),
			'6'=>array(
				'title'=>"Post Title - Some Text Here",
				'content'=>"Edit this with an article that has your {v} 2-3 times in this post. Also include 2-3 more other keywords in this post"
                        ),
			'7'=>array(
				'title'=>"Post Title - More Text Here",
				'content'=>"Edit this with an article that has your {v} 2-3 times in this post. Also include 2-3 more other keywords in this post"
                        ),
			'8'=>array(
				'title'=>"Some Title Text Here about {v}",
				'content'=>"Edit this with an article that has your {v} 2-3 times in this post. Also include 2-3 more other keywords in this post"
                        ),
			'9'=>array(
				'title'=>"Another Title Text Here",
				'content'=>"Edit this with an article that has your {v} 2-3 times in this post. Also include 2-3 more other keywords in this post"
                        ),
			'10'=>array(
				'title'=>"Some Post Title Text Here",
				'content'=>"Edit this with an article that has your {v} 2-3 times in this post. Also include 2-3 more other keywords in this post"
			),
		);

// Manage the title and content of pages
$pagedata = array(
			'1'=>array(
				'title'=>"About",
				'content'=>"<p><h3>Welcome to my blog site for {v}.</h3></p>
<p>This website is created to provide updated information on {v} and
enlighten people about what they need to know about {v}.</p>
<p>I've cut through all the hype and revealed the facts that will help you
decide whether {v} is right for you or not.</p>
<p>Feel free to go through my website and get to know more about
{v}. If you have any questions, please go to the contact
page.</p>
<p>Thanks for visiting my website!</p>"
			),
			'2'=>array(
				'title'=>"Contact",
				'content'=>"<p>If you have any questions or comments, please feel free to contact me
at the following email address:</p>
<p><i>info@{d}</i></p>
<p>I'll respond back typically within 24 hours.</p>
<p>Thanks!</p>
<p>Or use the contact form below</p>
<p>[si-contact-form form='1']</p>"
			),
			'3'=>array(
				'title'=>"Privacy",
				'content'=>"<p><strong>Your Privacy</strong><br/>Your privacy is important to us. To better protect your privacy we provide this notice explaining our online information practices and the choices you can make about the way your information is collected and used. To make this notice easy to find, we make it available on our homepage and at every point where personally identifiable information may be requested.
<p/><strong>Google Adsense and the DoubleClick DART Cookie</strong><br/>Google, as a third party advertisement vendor, uses cookies to serve ads on this site. The use of DART cookies by Google enables them to serve adverts to visitors that are based on their visits to this website as well as other sites on the internet.</p> 
<p>To opt out of the DART cookies you may visit the Google ad and content network privacy policy at the following url <a href=\"http://www.google.com/privacy_ads.html\">http://www.google.com/privacy_ads.html</a> Tracking of users through the DART cookie mechanisms are subject to Google&#8217;s own privacy policies.</p> 
<p>Other Third Party ad servers or ad networks may also use cookies to track users activities on this website to measure advertisement effectiveness and other reasons that will be provided in their own privacy policies, {d} has no access or control over these cookies that may be used by third party advertisers.
<p/><strong>Collection of Personal Information</strong><br/>When visiting {d}, the IP address used to access the site will be logged along with the dates and times of access. This information is purely used to analyze trends, administer the site, track users movement and gather broad demographic information for internal use. Most importantly, any recorded IP addresses are not linked to personally identifiable information.</p> 
<p/><strong>Links to third party Websites</strong><br/>We have included links on this site for your use and reference. We are not responsible for the privacy policies on these websites. You should be aware that the privacy policies of these sites may differ from our own. </p> 
<p/><strong>Changes to this Privacy Statement</strong><br/>The contents of this statement may be altered at any time, at our discretion. </p> 
<p>If you have any questions regarding our privacy policy then you may contact us at info@{d}
<p/> "
			),
		);
?>
