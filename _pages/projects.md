---
layout: page
title: Projects
permalink: /projects/
---

# My Projects

Here are some of the key projects I've worked on that demonstrate my approach to problem-solving and innovation.

{% for project in site.data.projects %}
<div class="project-card">
  <h2>{{ project.title }}</h2>
  {% if project.image %}
  <img src="{{ project.image | relative_url }}" alt="{{ project.title }}" class="project-image">
  {% endif %}
  <p>{{ project.description }}</p>
  {% if project.technologies %}
  <p class="technologies"><strong>Technologies:</strong> {{ project.technologies | join: ", " }}</p>
  {% endif %}
  {% if project.url %}
  <a href="{{ project.url }}" class="project-link" target="_blank">View Project</a>
  {% endif %}
</div>
{% endfor %} 