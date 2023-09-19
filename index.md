---
layout: default
title: "Prof. Dr. Ingo Claßen"
---

<nav>
    {% if site.data.nav.toc[0] %}
      {% for item in site.data.nav.toc %}
        <h3>{{ item.title }}</h3>
          {% if item.subfolderitems[0] %}
            <ul>
              {% for entry in item.subfolderitems %}
                  <li><a href="{{ entry.url }}">{{ entry.page }}</a>
                    {% if entry.subsubfolderitems[0] %}
                      <ul>
                      {% for subentry in entry.subsubfolderitems %}
                          <li><a href="{{ subentry.url }}">{{ subentry.page }}</a></li>
                      {% endfor %}
                      </ul>
                    {% endif %}
                  </li>
              {% endfor %}
            </ul>
          {% endif %}
        {% endfor %}
    {% endif %}
</nav>