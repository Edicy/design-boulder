<div class="comment-form{% unless comment.valid? %} form_with_errors{% endunless %}">
  {% commentform %}
    {% assign comment_name_error = false %}
    {% assign comment_email_error = false %}
    {% assign comment_body_error = false %}
    {% unless comment.valid? %}
        {% for error in comment.errors %}
          {% if error == "comment_author_blank" %}{% assign comment_name_error = true %}{% endif %}
          {% if error == "comment_email_blank" %}{% assign comment_email_error = true %}{% endif %}
          {% if error == "comment_body_blank" %}{% assign comment_body_error = true %}{% endif %}
        {%endfor %}
    {% endunless %}

    <div class="form_area">
      <div class="form_fields">
        <div class="form_field comment_form_textfield_wrap{% if comment_name_error %} form_field_with_errors{% endif %}">
          <input id="comment-form-name" class="form_field_textfield js-placeholder" name="comment[author]" value="{{ comment.author }}" placeholder="{% if comment_name_error %}{{ "comment_author_blank" | lc }}{% else %}{{ 'name' | lc }}{% endif %}">
        </div>

        <div class="form_field comment_form_textfield_wrap{% if comment_email_error %} form_field_with_errors{% endif %}">
          <input id="comment-form-email" class="form_field_textfield js-placeholder" name="comment[author_email]" value="{{ comment.author_email }}" placeholder="{% if comment_email_error %}{{ "comment_email_blank" | lc }}{% else %}{{ 'email' | lc }}{% endif %}">
        </div>

        <div class="form_field comment_form_textarea_wrap{% if comment_body_error %} form_field_with_errors{% endif %}">
          <textarea id="comment-form-body" class="form_field_textarea js-placeholder" name="comment[body]" rows="5" placeholder="{% if comment_body_error %}{{ "comment_body_blank" | lc }}{% else %}{{ 'comment' | lc }}{% endif %}">{{ comment.body }}</textarea>
        </div>
      </div>

      <div class="form_submit">
        <input type="submit" value="{{ 'submit' | lc }}">
      </div>
    </div>
  {% endcommentform %}
</div>
