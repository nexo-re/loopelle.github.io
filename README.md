# Crochet shop template (demo)

First page only: **hero (crochet animation) → product catalogue → product details**.

## Run it
Double-click **start-demo.bat** (Windows) or **start-demo.command** (Mac).
It opens http://localhost:8080. (Opening index.html directly does not work: browsers block the hero picture.)
No Python? Use VS Code → "Live Server" → *Open with Live Server*.

## Make it for a new business (3 things)

### 1. Name + logo  →  `site-config.js` → `business` and `logo`
- Change `name`, `tagline`, `instagram`.
- Logo pictures: drop files in `assets/brand/` and point `wordmark` (full logo) and `mark` (small round icon) at them.
  Best = single-colour SVG or transparent PNG.

### 2. Hero crochet + hanging crochets  →  `site-config.js` → `hero`
- `image`: the picture that gets crocheted. **Transparent-background PNG/WebP**, portrait works best.
  Put it in `assets/hero/` (cut the background out with remove.bg or Canva's Background Remover).
- `hanging`: exactly 5 crochet pictures that drop in and hang. **Transparent background**, any size.
  Put them in `assets/hanging/`. A black cord + clasp is added automatically. Each one falls and glides into its own product card (row 1 of products.csv gets hang-1, and so on).
- If a new hero picture overlaps the hanging crochets, adjust `charmZone` (explained in the file).

### 3. Product catalogue  →  `products.csv`
Open it in Excel / Google Sheets, one row per product, save as **CSV**:

| column | what it is |
|---|---|
| name, price | required |
| original_price | optional, shows a crossed-out price + "% off" |
| shipping_time | `8 days` → "Ships in 8 days" |
| stock | number; shows "Only N left", `0` = sold out |
| photo | file name inside `assets/products/` (e.g. `red-bag.webp`). Several photos: `a.webp\|b.webp` |
| category | creates the filter buttons automatically |
| badge | optional ribbon, e.g. `Bestseller` |
| description | optional, shown on the product details page |

Also in `site-config.js`: shop heading text, currency (`₹`, `$`...).

## Folder map
```
site-config.js     ← name, logo, hero, hanging, texts, colours
products.csv       ← catalogue
assets/brand/      ← logo files
assets/hero/       ← hero picture
assets/hanging/    ← hanging crochets
assets/products/   ← product photos
```

## Product page extras
Every product page now has a live "watch it being crocheted" player (progress bar, stitches, yarn metres, hours) and an e-adoption certificate (product photo, buyer name, character name).
Edit character names and numbers per product in `site-config.js` -> `lore` (matched by product name, lower-case). Files: `assets/js/extras.js`, `assets/css/extras.css`.

## Cut-out pictures
`assets/cutouts/<product-name>.webp` are the background-free plushie pictures used by the live crocheting player and the certificate (file name = product name in lower-case with dashes, e.g. `fluffy-bunny.webp`). The hero is the Strawberry Cow cut-out, and the 5 hanging crochets are the first 5 products.

## 3D hero (optional)
`site-config.js` → `hero.model` points to a `.glb` (default `assets/hero/model.glb`). The hook stitches the model's front view, then the live 3D model appears and does a full 360° turn while it glides to the corner. three.js loads from jsDelivr (internet needed). Set `model: ''` or remove the file to use the flat picture; if 3D fails to load, the picture is used automatically.
