{% if site.data.nav.toc[0] %}
  {% for item in site.data.nav.toc %}
    <p>{{ item.title }}</p>
      {% if item.subfolderitems[0] %}
        <ul>
          {% for entry in item.subfolderitems %}
              <li><a class="w3-bar-item w3-button w3-hover-black" href="{{ entry.url }}">{{ entry.page }}</a>
                {% if entry.subsubfolderitems[0] %}
                  <ul>
                  {% for subentry in entry.subsubfolderitems %}
                      <li><a class="w3-bar-item w3-button w3-hover-black" href="{{ subentry.url }}">{{ subentry.page }}</a></li>
                  {% endfor %}
                  </ul>
                {% endif %}
              </li>
          {% endfor %}
        </ul>
      {% endif %}
    {% endfor %}
{% endif %}