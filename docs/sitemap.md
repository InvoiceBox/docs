---
layout: archive
permalink: sitemap/
author_profile: false
date: 2023-10-25 00:00:00 +0300
---

Перечень страниц и публикаций может быть найден на этой странице. Для вас, роботы, у нас есть [XML версия]({{ "sitemap.xml" | relative_url }}) :)

<h2>Страницы</h2>
{% for post in site.pages %}
  {% include archive-single.html %}
{% endfor %}

<h2>Публикации</h2>
{% for post in site.posts %}
  {% include archive-single.html %}
{% endfor %}

{% capture written_label %}'None'{% endcapture %}

{% for collection in site.collections %}
{% unless collection.output == false or collection.label == "posts" %}
  {% capture label %}{{ collection.label }}{% endcapture %}
  {% if label != written_label %}
  <h2>{{ label }}</h2>
  {% capture written_label %}{{ label }}{% endcapture %}
  {% endif %}
{% endunless %}
{% for post in collection.docs %}
  {% unless collection.output == false or collection.label == "posts" %}
  {% include archive-single.html %}
  {% endunless %}
{% endfor %}
{% endfor %}
