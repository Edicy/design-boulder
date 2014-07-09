<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  <link rel="stylesheet" href="/assets/admin/tools/0.1.3/edicy-tools.css">
  {% include "bg-picker-variables" %}
  {{ site.stats_header }}
</head>

  <body class="front-page">
    <div class="container js-container">
      {% include "header" %}

      <main class="content js-content" role="main">
        <div class="main-feature">
          <div class="wrap">
            <section class="feature-left content-formatted">
              {% contentblock name="feature_content_left" %}{% endcontentblock %}
            </section>
            <section class="feature-right content-formatted">
              {% content name="feature_content_right" %}
            </section>
          </div>
        </div>

        <div class="summary">
          <div class="wrap">
            <section class="blog">
              <h1 class="blog-title">{{ "latest_news" | lc }}</h1>
              {% for article in site.latest_articles limit:3 %}
                <article class="post">
                  <h2 class="post-title"><a href="{{ article.url }}">{{ article.title }}</a></h2>
                  <time class="post-date" datetime="{{ article.created_at | date : "%Y-%m-%d" }}">{{ article.created_at | date : "%B %d, %Y" }}</time>
                </article>
              {% endfor %}
            </section>

            <section class="quotation">
              <div class="content-formatted">
                {% content name="quotation_content" %}
              </div>
            </section>
          </div>
        </div>

        <div class="contacts">
          <section class="wrap content-formatted js-custom-content-formatted">
            {% content name="contacts_content" %}
          </section>
        </div>

        <div class="map">
          <section class="content-formatted">
            {% content name="map_content" %}
          </section>
        </div>
      </main>


      {% include "footer" %}
    </div>

    {% include "javascripts" %}
    {% include "bg-picker" %}
  </body>
</html>
