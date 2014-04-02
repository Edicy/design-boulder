<header class="header" {% if site.root_item.selected? %}style="background-image: url('/photos/header-bg.jpg');"{% endif %}>
  {% if site.root_item.selected? %}<div class="bg-color" style="background-color: #333; background-color: rgba(51, 51, 51, 0.5);"></div>{% endif %}
  <div class="header-top">
    <div class="wrap">
      <section class="header-left">
        <div class="header-title">{% unless editmode %}<a href="{{ site.root_item.url }}">{% endunless %}{% editable site.header %}{% unless editmode %}</a>{% endunless %}</div>
      </section>

      <section class="header-right">
        <nav class="main-menu js-main-menu">
          {% include "nav-menu" %}
          {% if editmode or site.has_many_languages? %}
          <div class="mobile-lang-menu lang-menu">
            {% include "lang-menu" %}
          </div>
          {% endif %}
        </nav>

        {% if site.search.enabled %}
          <section class="search">
            <form id="search" class="edys-search" method="get" action="#">
              <div class="search-left">
                <input id="onpage_search" class="edys-search-input" type="text" placeholder="Search" name="">
              </div>
              <div class="search-right">
                <input class="search-submit" type="submit" value="" name="">
              </div>
            </form>
            <div id="customsearch"></div>
          </section>
        {% endif %}

        {% if editmode or site.has_many_languages? %}
          <nav class="lang-menu">
            <button class="lang-menu-btn js-lang-menu-btn lang-flag {% for language in site.languages %}{% if language.selected? %}{{ language.code }}{% endif %}{% endfor %}">Choose language</button>
            <div class="lang-menu-popover js-lang-menu-popover">
              {% include "lang-menu" %}
            </div>
          </nav>
        {% endif %}

      </section>
    </div>
  </div>

  {% if site.root_item.selected? %}
    <div class="header-bottom">
      <section class="content-formatted">
        <div class="wrap">
          {% content name="header_content" %}
          <button class="btn">View our menu</button>
        </div>
      </section>
    </div>
  {% endif %}
</header>
