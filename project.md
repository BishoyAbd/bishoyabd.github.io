
# Jekyll-Powered Portfolio — Full Specification

## 1. Overview & Goals
**Purpose:**  
A **dark-mode-only**, minimalist portfolio & thought-garden built with **Jekyll**, featuring four sections:
1. **Home** (feed of all posts)  
2. **About** (your narrative + links)  
3. **Articles** (long-form essays)  
4. **Projects** (technical case studies)  
5. **Thoughts** (brief, exploratory notes)

**Audience:**  
CTOs, product leads, hiring managers, and curious readers.

**Primary CTA:**  
“Get in touch” via email link or embedded scheduling widget on About page.

---

## 2. Technology Stack

| Concern                 | Tool / Plugin                                | Purpose / Rationale                                     |
|-------------------------|-----------------------------------------------|----------------------------------------------------------|
| Static-site generator   | Jekyll (Ruby)                                 | Markdown → HTML, Liquid templates, native to GitHub Pages |
| Templating              | Liquid                                        | Flexible, context-aware includes & layouts                |
| Styling                 | Tailwind CSS (PostCSS)                        | Utility-first, purgeable styles, design tokens            |
| Dark mode toggle        | Tailwind’s `darkMode` + small JS snippet      | User-preferred theme, zero-CSS overhead                   |
| Syntax highlighting     | Rouge                                          | Built-in highlighter, zero extra JS                       |
| Asset pipeline          | Jekyll Assets / Webpacker                     | Fingerprinted CSS/JS, image compression                   |
| RSS / Feeds             | `jekyll-feed` plugin                          | Automatic `<feed>.xml` generation                         |
| Sitemap                 | `jekyll-sitemap` plugin                       | SEO-friendly `sitemap.xml`                                |
| SEO metadata            | `jekyll-seo-tag` plugin                       | Generates meta tags, OpenGraph, Twitter cards             |
| Navigation helpers      | Custom Liquid include + data file             | Central nav configuration                                 |
| Pagination              | Jekyll’s built-in pagination                   | Limits items per page, clean `/page/2` URLs               |
| Deployment              | GitHub Pages (Actions or `gh-pages` branch)   | Free HTTPS hosting                                        |
| CI/CD                   | GitHub Actions                                | Build, test, deploy pipeline                              |
| Search (optional)       | Fuse.js (client-side)                         | Zero-backend full-text search                             |
| Forms / Lead capture    | Formspree / Netlify Forms                     | Simple email forms without custom backend                |

---

## 3. Information Architecture & URL Map

```

/                 ← Home (all posts, newest first)
/about            ← About you + contact & scheduling
/articles/        ← Filtered feed (category: article)
/projects/        ← Filtered feed (category: project)
/thoughts/        ← Filtered feed (category: thought)
/feed.xml         ← RSS all posts
/2025/05/slug/    ← Individual post pages (year/month/slug)

````

- **Collections:**  
  - `_posts/` holds all posts with front-matter `category: article/project/thought`.
  - `_data/navigation.yml` defines nav links & order.

- **Layouts:**  
  - `layout: default` → global wrapper with `<head>`, nav, footer.  
  - `layout: home` → extends `default`, loops through `paginator.posts`.  
  - `layout: post` → single-post view (headshot, title, date, content, footer nav).  
  - `layout: page` → for About (no pagination).

---

## 4. Front-Matter Specification

Every Markdown file in `_posts/` begins with YAML metadata:

```yaml
---
layout: post
title:   "My First Project: LLM Pipeline"
date:    2025-05-20 14:00:00 +0200
categories: project
tags:   [LLM, Python, Design]
summary: "A deep dive into building a production-grade LLM pipeline."
cover_image: "/assets/images/llm-pipeline.jpg"   # optional hero image
---
````

* **`layout`**: `post` for blog entries; `page` for non-post pages (`about.md`).
* **`categories`**: drives filtering on `/articles/`, `/projects/`, `/thoughts/`.
* **`tags`**: for per-post micro-navigation or future tag pages.
* **`summary`**: excerpt shown in cards.
* **`cover_image`**: large hero image for individual post pages (optional).

---

## 5. Template & Include Details

1. **`_includes/head.html`**

   * Meta tags via `jekyll-seo-tag`.
   * Link to `assets/main.css` (bundled Tailwind).
   * Dark-mode toggle JS.

2. **`_includes/nav.html`**

   * Loop over `_data/navigation.yml`.
   * Highlight active page.

3. **`_layouts/default.html`**

   * Wraps `head.html`, `nav.html`, yields `{{ content }}`, adds footer.

4. **`_layouts/home.html`**

   * Uses `paginator.posts` to render a **grid of cards**:

     ```liquid
     {% for post in paginator.posts %}
       {% include card.html post=post %}
     {% endfor %}
     ```

5. **`_includes/card.html`**

   * Renders a **floating card**:

     ```liquid
     <article class="group border rounded-lg p-6 hover:shadow-2xl transition">
       <time>{{ post.date | date: "%b %-d, %Y" }}</time>
       <h2>{{ post.title }}</h2>
       <p>{{ post.summary }}</p>
       <a href="{{ post.url }}">Read more →</a>
     </article>
     ```

6. **`_layouts/post.html`**

   * Show optional `cover_image` as hero.
   * Centered headshot (48×48).
   * Title, date, content, tags, back link.

7. **`about.md`** in root with front-matter `layout: page`.

---

## 6. Assets & Styles

* **`assets/css/main.css`**

  * Generated by **Tailwind + PostCSS**:

    ```css
    @tailwind base;
    @tailwind components;
    @tailwind utilities;
    /* Custom utilities & Dark-mode variants */
    ```

* **`postcss.config.js`**

  * Plugins: `tailwindcss`, `autoprefixer`, `cssnano` (for prod).

* **Dark-mode**

  * Use Tailwind’s `dark:` variants, set `<html class="dark">` via small inline JS reading `localStorage`.

* **Images**

  * Stored under `assets/images/`, optimized WebP + fallback JPG.
  * Use `<picture>` + `srcset` for retina support.

---

## 7. Build & Deployment Workflow

1. **Local development**

   ```bash
   bundle install
   bundle exec jekyll serve --livereload
   ```
2. **Production build**

   ```bash
   NODE_ENV=production npm run build:css
   JEKYLL_ENV=production bundle exec jekyll build
   ```
3. **CI/CD (GitHub Actions)**

   * On `push` to `main`:

     * Install Ruby & Node.
     * Run `npm ci && npm run build:css`.
     * Run `bundle install && jekyll build`.
     * Deploy `_site/` to `gh-pages` branch via `peaceiris/actions-gh-pages`.

---

## 8. Analytics & SEO

* **SEO tags** via `jekyll-seo-tag`.
* **Sitemap** via `jekyll-sitemap`.
* **RSS** via `jekyll-feed`.
* **Analytics**: add Plausible or Google Analytics snippet in `head.html` (optional).

---

## 9. Performance & Accessibility

* **Core Web Vitals** goals:

  * LCP < 2 s (optimize hero images, lazy-load).
  * CLS = 0 (reserve image dimensions).
  * TBT < 150 ms (no heavy JS).

* **Accessibility**:

  * Semantic HTML (`<main>`, `<article>`, `<nav>`).
  * Keyboard-focus states.
  * Sufficient color contrast (WCAG AA).

---

## 10. Content Strategy

* **Launch with ≥ 5 posts** (mix of articles/projects/thoughts).
* **Writing cadence**: at least one new post per month.
* **Editorial calendar** in `_data/calendar.yml` (optional).

---

## 11. Risk Mitigation

| Risk                     | Mitigation                                        |
| ------------------------ | ------------------------------------------------- |
| Stale content            | Pre-write draft posts; schedule publishing.       |
| Slow builds (many posts) | Use incremental regeneration (Jekyll 4+).         |
| Overly heavy CSS/JS      | Purge Tailwind; limit JS to theme toggle & Forms. |

---

# Next: Task Breakdown in `tasks.md`

