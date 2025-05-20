---
layout: page
title: Blog
permalink: /blog/
---

# Blog

Thoughts on innovation, technology, and philosophical approaches to modern challenges.

<div class="blog-list">
  {% for post in site.posts %}
    <article class="blog-preview">
      <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
      <p class="post-meta">{{ post.date | date: "%B %-d, %Y" }}</p>
      <div class="post-excerpt">
        {{ post.excerpt }}
      </div>
      <a href="{{ post.url | relative_url }}" class="read-more">Read more</a>
    </article>
  {% endfor %}
</div> 