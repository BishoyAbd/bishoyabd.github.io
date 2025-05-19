
# Project Task Board

_All tasks are blocking unless marked “↓” (later). Owner: Bi._

## 1. Project Setup
| ID    | Task                                                      | Criteria                                           | Status |
|-------|-----------------------------------------------------------|----------------------------------------------------|--------|
| S1    | Create GitHub repo & clone locally                        | Repo live; `git push` works                        | ☐      |
| S2    | Initialize Jekyll site (`jekyll new . --force`)           | `_config.yml`, `index.md`, `_posts/` present       | ☐      |
| S3    | Install plugins: feed, sitemap, seo-tag                   | Entries in `plugins:` in `_config.yml`             | ☐      |
| S4    | Configure `_config.yml` with base settings                  | URL, pagination, collections, plugins              | ☐      |

## 2. Theme & Layout
| ID    | Task                                                      | Criteria                                           | Status |
|-------|-----------------------------------------------------------|----------------------------------------------------|--------|
| T1    | Set up `assets/css/main.css` & `postcss.config.js`        | Tailwind directives present; `npm run build:css` OK| ☐      |
| T2    | Create `_layouts/default.html` (head, nav, footer)       | Renders site wrapper                               | ☐      |
| T3    | Create `_includes/nav.html` & `_data/navigation.yml`      | Nav links show & highlight active                  | ☐      |
| T4    | Create `_layouts/home.html` + `_includes/card.html`       | Homepage grid of post cards                        | ☐      |
| T5    | Create `_layouts/post.html` for individual posts          | Hero image, headshot, title, content rendered      | ☐      |
| T6    | Create `about.md` with `layout: page`                     | Renders About page                                 | ☐      |

## 3. Content & Assets
| ID    | Task                                                      | Criteria                                           | Status |
|-------|-----------------------------------------------------------|----------------------------------------------------|--------|
| C1    | Write & add 5 initial Markdown posts                      | In `_posts/`, correct front-matter, images present | ☐      |
| C2    | Optimize & place images in `assets/images/`               | WebP + JPG fallback, dimensions declared           | ☐      |
| C3    | Add `favicon.ico` & meta in `head.html`                   | `<link rel="icon">` in `<head>`                    | ☐      |

## 4. CI/CD & Deployment
| ID    | Task                                                      | Criteria                                           | Status |
|-------|-----------------------------------------------------------|----------------------------------------------------|--------|
| D1    | Configure GitHub Actions workflow                        | Builds CSS + Jekyll + deploys via `actions-gh-pages` | ☐      |
| D2    | Test local build (`jekyll serve`)                        | No errors; site live at `localhost:4000`           | ☐      |
| D3    | Push to `main` → verify GitHub Pages live                 | Site available at `https://USERNAME.github.io/REPO`| ☐      |

## 5. SEO & Analytics ↓
| ID    | Task                                                      | Criteria                                           | Status |
|-------|-----------------------------------------------------------|----------------------------------------------------|--------|
| E1    | Add `jekyll-seo-tag` & configure social card defaults     | `<meta>` tags rendered                             | ☐      |
| E2    | Add Plausible/GA snippet in `head.html`                   | No script errors; data flows                      | ☐      |

## 6. Optional Enhancements ↓
| ID    | Task                                                      | Criteria                                           | Status |
|-------|-----------------------------------------------------------|----------------------------------------------------|--------|
| O1    | Integrate Fuse.js for client-side search                  | Search box works                                  | ☐      |
| O2    | Set up newsletter via Formspree                           | Form sends emails                                 | ☐      |

---

**Milestones**  
- **M1 (Week 1):** Setup, theme skeleton, first content  
- **M2 (Week 2):** Styling, images, build pipeline  
- **M3 (Week 3):** CI/CD, SEO, final review  

