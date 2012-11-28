<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>免登陆 WordPress 发布接口 by hamo</title>
</head>
<body >
<p>
最新版本或者意见建议请访问 
本接口主要实现了不登陆Wordpress直接发文的功能，并扩展了一些辅助选项。<br/>
<ul>
<li>随机时间安排与预约发布功能： 可以设定发布时间以及启用预约发布功能</li>
<li>服务器时间与博客时间的时区差异处理。这特别适合在国外服务器上的博客</li>
<li>永久链接的自动翻译设置。根据标题自动翻译为英文并进行seo处理</li>
<li>多标签处理(多个标签可以用火车头默认的tag|||tag2|||tag3的形式)</li>
<li>增加了发文后ping功能</li>
<li>增加了“pending review”的设置</li>
</ul>
</p>
<p>
<form action="hm-locowp.php?action=save&secret=abcd1234s" method="post">
标题:<input type="text" name="post_title" value="WordPress免登录发布接口hm-locowp"><br/>
分类:<input type="text" name="post_category" value="6"><br/>
时间:<input type="text" name="post_date" value=""> (YYYY-MM-DD 格式，留空则自动计算)<br/>
Tag: <input type="text" name="tag" value="">(以逗号分割多个)<br/>
内容:<br/>
<textarea name="post_content"></textarea></br>
<input type="submit" value="提交">
</form>
</p>
<body>

