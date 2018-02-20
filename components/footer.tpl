<footer class="footer js-footer">
  {% if blog and articles.size > 3 %}
    <div class="menu-pagination-wrap js-menu-pagination-wrap"></div>
  {% endif %}

  <div class="footer-inner">
    <div class="wrap">
      <div class="footer-left content-formatted">{% xcontent name="footer_title" %}</div>
      <div class="footer-right content-formatted js-custom-content-formatted">{% xcontent name="footer" %}</div>
    </div>
    {% if page.private? %}
      <div class="signout-btn-pad"></div>
    {% endif %}
  </div>
</footer>
