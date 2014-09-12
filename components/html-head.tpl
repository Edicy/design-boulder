{% comment %}IE SETTINGS{% endcomment %}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{% comment %}BASIC META INFO{% endcomment %}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="keywords" content="{{ page.keywords }}">
<meta name="description" content="{{ page.description }}">

{% comment %}FAV ICON{% endcomment %}
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="/favicon.ico" type="image/ico">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" href="{{ images_path }}/{{ page.data.touchicon }}"> <!-- TODO: Add image location data tag -->

{% comment %}MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC{% endcomment %}
<script src="{{ javascripts_path }}/modernizr.min.js"></script>

{% comment %}STYLESHEETS{% endcomment %}
{% stylesheet_link "main.min.css" %}
{% if editmode %}{% stylesheet_link "editmode.min.css" %}{% endif %}
<!--[if lt IE 9]>{% stylesheet_link "ie8.min.css" %}<![endif]-->

{% comment %}SITE TITLE{% endcomment %}
{% capture page_title %}{% if article %}{{ article.title }} — {{ page.site_title }}{% else %}{% if site.root_item.selected? %}{{ page.site_title }}{% else %}{{ page.title }} — {{ page.site_title }}{% endif %}{% endif %}{% endcapture %}
<title>{{ page_title }}</title>

{% comment %}FACEBOOK OPENGRAPH{% endcomment %}
{% comment %}https://developers.facebook.com/tools/debug - Debug after each modification{% endcomment %}
{% comment %}<!-- TODO: Add admin and image editing support after the CMS is going to support it -->{% endcomment %}
{% if site.data.fb_admin %}<meta property="fb:admins" content="{{ site.data.fb_admin }}">{% endif %}
<meta property="og:type" content="{% if article %}article{% else %}website{% endif %}">
<meta property="og:url" content="{{ site.url }}{% if article %}{{ article.url | remove_first:'/' }}{% else %}{{ page.url | remove_first:'/' }}{% endif %}">
<meta property="og:title" content="{{ page_title | escape }}">
<meta property="og:site_name" content="{{ page.site_title | escape }}">

{% if article %}
  {% comment %}Facebook OG image on for article pages.{% endcomment %}
  {% if article.data.fb_image %}
    <meta property="og:image" content="{{ article.data.fb_image }}">
  {% elsif page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% endif %}
  <meta property="og:description" content="{{ article.excerpt | strip_html | truncatewords: 200, '...' }}">
  <meta name="description" content="{{ article.excerpt | strip_html | truncatewords: 200, '...' }}">
{% else %}
  {% comment %}Facebook OG image dor content pages.{% endcomment %}
  {% if page.data.fb_image %}
    <meta property="og:image" content="{{ page.data.fb_image }}">
  {% elsif site.data.fb_image %}
    <meta property="og:image" content="{{ site.data.fb_image }}">
  {% else %}
    {% unless header_image == '' %}
      <meta property="og:image" content="{{ header_image }}">
    {% endunless %}
  {% endif %}

  {% unless page.description == nil or page.description == "" %}
    <meta property="og:description" content="{{ page.description }}">
    <meta name="description" content="{{ page.description }}">
  {% else %}
    {% unless blog or editmode %}
      {% capture content %}{% content %}{% endcapture %}
      <meta property="og:description" content="{{ content | strip_html | truncatewords: 200, '...' }}">
      <meta name="description" content="{{ content | strip_html | truncatewords: 200, '...'  }}">
    {% endunless %}
  {% endunless %}
{% endif %}

{% if blog %}{{ blog.rss_link }}{% endif %}
{{ site.stats_header }}
