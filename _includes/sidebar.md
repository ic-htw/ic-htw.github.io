  {% if site.data.nav.toc[0] %}
    <ul class="w3-ul w3-large">
      {% for item in site.data.nav.toc %}
        <li class="w3-padding-small w3-light-grey">{{ item.short }}</li>
        {% if item.levels == 1 %}
          <ul class="w3-ul w3-small">
            {% for link in item.links %}
              <li> <a  href="{{ link.url }}">{{ link.page }}</a> </li>
            {% endfor %}
          </ul>
        {% else %}
          <ul class="w3-ul w3-large">
            {% for sub in item.subs %}
              <li> {{ sub.short }} </li>
              <ul class="w3-ul w3-small">
                {% for link in sub.links %}
                  <li class="w3-padding-large"> <a  href="{{ link.url }}">{{ link.page }}</a> </li>
                {% endfor %}
              </ul>
            {% endfor %}
          </ul>
        {% endif %}
      {% endfor %}
    </ul>
  {% endif %}