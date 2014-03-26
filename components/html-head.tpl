<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="{{ page.keywords }}">
<meta name="description" content="{{ page.description }}">
<meta name="author" content="{{ site.author }}">

<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="{{ images_path }}/{{ page.data.touchicon }}"> <!-- TODO: Add image location data tag -->

<script type="text/javascript" src="//use.typekit.net/vno7cqi.js"></script>
<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
<script src="{{ javascripts_path }}/modernizr.js?1"></script>

{% stylesheet_link "main.css?1" %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.css?!" %}<![endif]-->

<title>{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}</title>

<meta property="fb:admins" content="XXXXXXXXXX">
<meta property="og:type" content="website">
