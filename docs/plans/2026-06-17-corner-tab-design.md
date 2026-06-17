# Alphabetical Corner Tab Design

**Date:** 2026-06-17
**Status:** Approved

## Problem

When the printed book is flipped through, there is no quick visual cue for where
you are in the alphabetical ordering of pieces. A thumb-index-style marker in the
top-right corner of every page — showing a short prefix derived from the piece's
title — gives instant orientation, like the alphabet tabs on a dictionary or a
file folder.

## Appearance

A right-aligned **L-corner tab** in the top-right header area of every page. The
two letters are enclosed by a thick vertical line on the left and a thick
horizontal line beneath them, forming an L that opens toward the page's top-right
corner:

```
        ┃Au·Le
        ┃_____
```

The prefix is built from the title:

- Split the title into words on whitespace.
- Take the first 2 characters of word 1.
- If a word 2 exists, append `·` (U+00B7 middle dot) and the first 2 characters
  of word 2.
- **Examples:**
  - "Autumn Leaves" → `Au·Le`
  - "Zelda" (one word) → `Ze`
  - "The Beatles" → `ThBe` (articles disambiguate naturally, no stripping)
  - "le Jeune Homme De Nante" → `le·Je`
- Letter case is preserved exactly as it appears in `sheetName`.
- **Guard:** if the title is `##f`, empty, or not a string, draw nothing.
  This covers the TOC/cover bookpart (which sets `title = ##f`).

## Pages

Every page of every piece shows its own tab. Flipping through, each page
reinforces "you are in the `Au` section". Continuation pages of a multi-page
piece repeat the same tab.

## Dimensions

- **Variable width:** the L-corner is sized from the actual rendered text
  stencil extents (plus small padding). One-word tabs (`Ze`) are narrower than
  two-word tabs (`Au·Le`). This mirrors how real file-folder tabs are not all
  the same width.
- The two lines are drawn with `\draw-line` under a `(thickness . …)` override.
  Their lengths and positions are computed from the text stencil's X/Y extents
  inside the markup command, so the box always fits the text.
- Exact thickness, font size, and padding are tuned empirically by rendering
  `AutumnLeaves.ly` and iterating until the tab looks right.

## Implementation (Approach A: new include file)

### New file `include/cornerTab.ily`

Contains:

1. **Scheme helper `title->prefix`** — takes a string, splits on whitespace,
   returns the 2+2 prefix joined by `·` (or just the first 2 chars when there is
   only one word). Handles short titles safely via `min`.

2. **`\cornerTab` markup command** — declared with
   `#:properties ((header:title ""))` so it reads the current bookpart's title
   from the page props. It:
   - Returns an empty stencil when `header:title` is missing, empty, or
     non-string.
   - Otherwise builds the prefix string, stencils it (bold, sized), reads its
     extents, and overlays two `\draw-line`s (left vertical + bottom horizontal)
     to form the L-corner, positioned from the extents with padding.

3. **`\paper` override:**
   ```lilypond
   \paper {
     oddHeaderMarkup = \markup { \fill-line { \null \cornerTab } }
     evenHeaderMarkup = \oddHeaderMarkup
   }
   ```
   This overrides the current `oddHeaderMarkup = \markup \null` set in
   `bookDefines.ily`.

### Wiring into `book.ily`

One new line added alongside the existing sibling includes in `include/book.ily`:

```lilypond
#(include-from-here "cornerTab.ily")
```

No other file is edited. No `.ly` sheet file changes.

## Why it works for both standalone sheets and the book

Every piece calls `\bookItem`, which expands to `\header { title = \sheetName }`
inside its `\bookpart`. The page header reads `header:title` from the page
properties, so it always reflects the *current* bookpart's title — not the
global `sheetName` variable, which would be wrong mid-book. Therefore:

- Standalone `AutumnLeaves.ly` → header reads "Autumn Leaves" → `Au·Le`.
- Assembled `freylax.ly` → each bookpart reads its own title → correct tab per
  piece; the TOC bookpart (`title = ##f`) draws nothing.

## Scope / Non-goals

- No changes to any `.ly` sheet file.
- No article stripping — the 2+2 scheme already disambiguates articles.
- No per-book configuration beyond including (or not including) `cornerTab.ily`.
- Titles with leading non-letter characters (rare/absent in this collection) are
  not specially handled; the prefix simply starts with whatever characters are
  there.

## Verification plan

1. Render `AutumnLeaves.ly` standalone → expect `Au·Le` in the top-right of the
   page, with a clean L-corner around it.
2. Render `freylax.ly` → expect each bookpart's first page to show its own
   prefix; the TOC bookpart to show no tab.
3. Render a one-word-title sheet (e.g. `Zelda.ly`) → expect a 2-letter tab `Ze`.
4. Iterate on line thickness / font size / padding until the tab looks right.
5. Confirm the commit-date footer (from `book.ily`) still renders unchanged.
