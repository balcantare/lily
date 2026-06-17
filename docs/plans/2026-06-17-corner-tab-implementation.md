# Alphabetical Corner Tab — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a top-right L-corner tab on every page showing a 2+2-letter prefix of the piece's title (e.g. `Au·Le` for "Autumn Leaves"), for alphabetical orientation when flipping through the printed books.

**Architecture:** One new file `include/cornerTab.ily` defines a Scheme helper (`title->prefix`), a `\cornerTab` markup command that reads the current bookpart's title from page props and draws the L-corner from the text stencil's extents, and a `\paper` override for `oddHeaderMarkup`/`evenHeaderMarkup`. It is included as the last sibling include in `include/book.ily`, so every standalone sheet and every assembled book picks it up automatically — no `.ly` sheet file changes.

**Tech Stack:** LilyPond 2.24 (Guile 2.2 Scheme), existing `include-from-here` mechanism in `book.ily`, `chain-assoc-get` for header access, `make-line-stencil` for the L-corner.

**Repo commit policy:** This repo is not auto-committed by the assistant. Commit steps below are executed only when the user explicitly asks for them; otherwise the steps are still performed (file written, rendered, verified) and the commit is skipped.

---

## File Structure

- **Create** `include/cornerTab.ily` — self-contained feature: prefix helper, `\cornerTab` markup command, `\paper` header override.
- **Modify** `include/book.ily` — add one line: `#(include-from-here "cornerTab.ily")` as the last sibling include, so its `\paper` wins over `bookDefines.ily`'s `oddHeaderMarkup = \markup \null`.
- **Create** `freylax/test_cornerTab.ly` — visual test harness rendering several titles to verify prefix logic and the L-corner shape. Kept permanently (matches existing `test_*.ly` convention in this dir).
- **No changes** to any piece `.ly` file, and **no changes** to `bookDefines.ily`.

## Why these access patterns

- `chain-assoc-get 'header:title props` reads the *current bookpart's* title at page-render time. This is what makes the feature correct inside an assembled book (each bookpart shows its own title) and not just for standalone sheets.
- `make-line-stencil` + `ly:stencil-add` gives precise control of the L-corner geometry from the measured text extents and guarantees the combined stencil has correct extents for right-alignment by `\fill-line`.

---

## Task 1: Create `include/cornerTab.ily`

**Files:**
- Create: `include/cornerTab.ily`

- [ ] **Step 1: Write the file with the full implementation**

Create `include/cornerTab.ily` with exactly this content:

```lilypond
\version "2.24.0"

#(use-modules (srfi srfi-1) (srfi srfi-14))

% Split a title into whitespace-separated words, dropping empty strings.
#(define (title-words str)
   (delete "" (string-split str char-set:whitespace)))

% Build the corner-tab prefix from a title string:
%   first 2 chars of word 1, then middle dot, then first 2 chars of word 2.
% One-word titles yield just the first 2 chars.  Non-string/empty -> "".
#(define (title->prefix str)
   (if (not (string? str))
       ""
       (let* ((words (title-words str))
              (w1 (if (pair? words) (car words) ""))
              (w2 (and (pair? words) (pair? (cdr words)) (cadr words))))
         (if (string-null? w1)
             ""
             (let ((p1 (substring w1 0 (min 2 (string-length w1)))))
               (if w2
                   (string-append
                    p1
                    (string (integer->char #xb7))   ; middle dot, U+00B7
                    (substring w2 0 (min 2 (string-length w2))))
                   p1))))))

% \cornerTab - read the current bookpart's title from the page props,
% build the prefix, and render it inside an L-corner (thick line on the
% left and on the bottom).  Returns an empty stencil when there is no
% usable title (e.g. the TOC/cover bookpart, which sets title = ##f).
#(define-markup-command (cornerTab layout props) ()
  "Draw the alphabetical corner tab from the bookpart title."
  (let* ((title-raw (chain-assoc-get 'header:title props #f))
         (prefix    (title->prefix title-raw)))
    (if (or (not (string? prefix)) (string-null? prefix))
        empty-stencil
        (let* ((txt-stil (interpret-markup layout props
                           (markup #:bold #:fontsize 4 prefix)))
               (xex (ly:stencil-extents txt-stil X))
               (yex (ly:stencil-extents txt-stil Y))
               (x0 (car xex))  (x1 (cdr xex))
               (y0 (car yex))  (y1 (cdr yex))
               (pad       0.6)
               (line-thick 0.8)
               (left-x   (- x0 pad))
               (right-x  (+ x1 pad))
               (bottom-y (- y0 pad))
               (top-y    (+ y1 pad))
               (vline (make-line-stencil line-thick left-x bottom-y left-x top-y))
               (hline (make-line-stencil line-thick left-x bottom-y right-x bottom-y)))
          (ly:stencil-add (ly:stencil-add vline hline) txt-stil)))))

\paper {
  oddHeaderMarkup = \markup { \fill-line { \null \cornerTab } }
  evenHeaderMarkup = \oddHeaderMarkup
}
```

Notes on the literals above that are easy to get wrong:
- The middle dot is produced by `(string (integer->char #xb7))` rather than a `"\u00b7"` escape, because Guile 2.2 does not reliably interpret `\uXXXX` in string literals. Keep the `integer->char` form.
- `pad` and `line-thick` are starting values; Task 3 tunes them visually.

- [ ] **Step 2: Sanity-check that it parses (no render yet)**

Run a parse-only compile to catch Scheme/syntax errors early:

```bash
lilypond -dno-print-pages /home/robert/music/lily/include/cornerTab.ily 2>&1 | tail -20
```

Expected: a complaint like "fatal error: cannot find file" or "no \paper/\book" is fine (the file is a fragment, not a score). What we are checking for is the **absence** of Scheme errors such as `no such variable title-words`, `unexpected "}"`, or `Wrong number of arguments to make-line-stencil`. If any Scheme/syntax error appears, fix it before continuing. A clean "no input" / success message is the target.

---

## Task 2: Visual test harness for prefix logic and L-corner shape

**Files:**
- Create: `freylax/test_cornerTab.ly`

This harness includes `cornerTab.ily` directly (not via `book.ily`), so the prefix logic and shape can be verified in isolation before wiring into the whole framework.

- [ ] **Step 1: Write the test harness**

Create `freylax/test_cornerTab.ly` with this content:

```lilypond
\version "2.24.4"

% Include cornerTab.ily directly for isolated testing.
\include "../include/cornerTab.ily"

\header { tagline = ##f }

% Each bookpart sets a title; the corner tab in the top-right header
% should show the prefix derived from that title. Cover all prefix cases.

\bookpart {
  \header { title = "Autumn Leaves" }
  \markup \vspace #6
  \markup { "Expected top-right tab:  Au (middot) Le" }
}

\bookpart {
  \header { title = "Zelda" }
  \markup \vspace #6
  \markup { "Expected top-right tab:  Ze   (one word, narrower)" }
}

\bookpart {
  \header { title = "The Beatles" }
  \markup \vspace #6
  \markup { "Expected top-right tab:  Th (middot) Be" }
}

\bookpart {
  \header { title = "le Jeune Homme De Nante" }
  \markup \vspace #6
  \markup { "Expected top-right tab:  le (middot) Je   (lowercase preserved)" }
}

\bookpart {
  \header { title = "A Day In The Life Of A Fool" }
  \markup \vspace #6
  \markup { "Expected top-right tab:  A (middot) Da   (one-letter first group)" }
}

\bookpart {
  \header { title = ##f }
  \markup \vspace #6
  \markup { "Expected: NO tab on this page (title is ##f, like the TOC bookpart)" }
}
```

- [ ] **Step 2: Render the harness**

```bash
lilypond -o /tmp/test_cornerTab freylax/test_cornerTab.ly 2>&1 | tail -20
```

(The CWD for this command is `/home/robert/music/lily`, so `freylax/test_cornerTab.ly` resolves and the file's own `\include "../include/cornerTab.ily"` resolves. Output PDF goes to `/tmp/test_cornerTab.pdf`.)

Expected: compilation succeeds, producing `/tmp/test_cornerTab.pdf` with 6 pages.

- [ ] **Step 3: Open and inspect the PDF**

Open `/tmp/test_cornerTab.pdf`. Verify **all** of:

1. Page 1 top-right shows `Au·Le` with a thick vertical line on its left and a thick horizontal line beneath it.
2. Page 2 shows `Ze` (no second group; tab visibly narrower).
3. Page 3 shows `Th·Be`.
4. Page 4 shows `le·Je` (lowercase preserved).
5. Page 5 shows `A·Da` (one-letter first group preserved).
6. Page 6 shows **no tab** at all.

- [ ] **Step 4: Iterate shape constants if needed**

If the lines are too thin/thick, the box too tight/loose, or the text too small/large, edit `include/cornerTab.ily` and adjust only these three values near the bottom of `\cornerTab`:
- `pad 0.6` — space between text and lines (bigger = looser box).
- `line-thick 0.8` — thickness of the two lines.
- `#:fontsize 4` (inside `(markup #:bold #:fontsize 4 prefix)`) — text size.

Re-run the Step 2 render command and re-inspect. Repeat until the tab looks right. Do not change anything else during this step.

- [ ] **Step 5: Commit (only if the user has asked for commits)**

```bash
git add include/cornerTab.ily freylax/test_cornerTab.ly
git commit -m "Add cornerTab.ily and visual test harness"
```

---

## Task 3: Wire into `book.ily` and verify standalone sheets

**Files:**
- Modify: `include/book.ily` (add one include line as the last sibling include)

- [ ] **Step 1: Add the include line**

In `include/book.ily`, the sibling-include block currently ends with:

```lilypond
#(include-from-here "bookDefines.ily")
#(include-from-here "transposition.ily")
```

Add one line immediately after the `transposition.ily` line, so the block becomes:

```lilypond
#(include-from-here "bookDefines.ily")
#(include-from-here "transposition.ily")
#(include-from-here "cornerTab.ily")
```

`cornerTab.ily` must come **after** `bookDefines.ily` so its `\paper { oddHeaderMarkup … }` overrides `bookDefines.ily`'s `oddHeaderMarkup = \markup \null`.

- [ ] **Step 2: Render a two-word-title standalone sheet**

```bash
lilypond -o /tmp/AutumnLeaves freylax/AutumnLeaves.ly 2>&1 | tail -20
```

Expected: compilation succeeds; `/tmp/AutumnLeaves.pdf` is produced.

- [ ] **Step 3: Inspect the standalone render**

Open `/tmp/AutumnLeaves.pdf`. Verify:
1. Top-right of the page shows the `Au·Le` L-corner tab.
2. The bottom commit-date footer (from `book.ily`'s `oddFooterMarkup`) is **still present** and unchanged.
3. Nothing else about the sheet's layout has shifted.

- [ ] **Step 4: Render and inspect a one-word-title standalone sheet**

```bash
lilypond -o /tmp/Zelda freylax/Zelda.ly 2>&1 | tail -20
```

Open `/tmp/Zelda.pdf`. Verify the top-right tab shows `Ze` (2-letter, narrower box) and the footer is intact.

- [ ] **Step 5: If the tab looks off in real sheets, re-tune**

Real sheet fonts differ slightly from the harness. If needed, repeat Task 2 Step 4's tuning (only `pad`, `line-thick`, `fontsize`) and re-render `AutumnLeaves.ly` until correct.

- [ ] **Step 6: Commit (only if the user has asked for commits)**

```bash
git add include/book.ily
git commit -m "Wire cornerTab.ily into book.ily"
```

---

## Task 4: Verify the assembled book and finalize

**Files:**
- (none modified; this task is verification only)

- [ ] **Step 1: Render the full freylax book**

```bash
lilypond -o /tmp/freylax freylax/freylax.ly 2>&1 | tail -25
```

Expected: compilation succeeds; `/tmp/freylax.pdf` is produced (this book is large; expect it to take a while).

- [ ] **Step 2: Inspect the assembled book**

Open `/tmp/freylax.pdf`. Verify:
1. The TOC/cover bookpart (first pages, "Inhalt") shows **no tab** (its `title = ##f`).
2. The first piece (`A Day In The Life Of A Fool`) shows `A·Da` top-right on its page.
3. Several pieces further in (e.g. `FairfieldFancy` → `Fa·Fa`, `Zelda` → `Ze`) each show their own correct prefix on their pages.
4. A multi-page piece, if any, repeats the same tab on every page.
5. The commit-date footer is present and unchanged throughout.

- [ ] **Step 3: Spot-check the second book (`freylax-trio.ly`) for regressions**

```bash
lilypond -o /tmp/freylax-trio freylax/freylax-trio.ly 2>&1 | tail -25
```

Open `/tmp/freylax-trio.pdf`. Verify tabs appear and the layout isn't broken. (If a piece in this book sets a non-string title and produces no tab, that is acceptable graceful behavior, not a failure.)

- [ ] **Step 4: Regenerate the in-repo PDFs (optional, only if the user keeps PDFs in git)**

The repo currently keeps built PDFs alongside sources. If the user wants the in-repo PDFs updated, run the normal build for the affected targets (do not do this unless asked):

```bash
make -C freylax freylax.pdf freylaxBf.pdf
```

- [ ] **Step 5: Commit (only if the user has asked for commits)**

If commits were requested across this plan, ensure everything is staged and committed:

```bash
git status
git add include/cornerTab.ily include/book.ily freylax/test_cornerTab.ly
git commit -m "Add alphabetical corner tab to sheet headers"
```

---

## Definition of Done

- `include/cornerTab.ily` exists and parses cleanly.
- `include/book.ily` includes it as the last sibling include.
- `freylax/test_cornerTab.ly` exists and renders 6 pages with the expected prefixes (and no tab on the `##f` page).
- Standalone `AutumnLeaves.ly` shows `Au·Le`; `Zelda.ly` shows `Ze`.
- Assembled `freylax.ly` shows per-piece tabs on every piece's pages and no tab on the TOC.
- Commit-date footer is unchanged everywhere.

## Spec coverage check

- L-corner shape (left + bottom thick line) — Task 1 (`\cornerTab` body), tuned Task 2 Step 4.
- Every page — Task 1 (`oddHeaderMarkup`/`evenHeaderMarkup` both set, no first-page condition).
- As-is case — Task 1 (`title->prefix` preserves case; verified Task 2 page 4).
- 2+2 with middle dot, one-word fallback — Task 1 (`title->prefix`); verified Task 2 pages 1–5.
- Guard for empty/`##f` title — Task 1 (`string-null?` → `empty-stencil`); verified Task 2 page 6.
- Works for standalone and book — Task 3 (standalone) + Task 4 (book), via `chain-assoc-get 'header:title`.
- TOC bookpart no tab — Task 4 Step 2 item 1.
- Variable width from text extents — Task 1 (`ly:stencil-extents` drives line coords).
- New `cornerTab.ily` wired from `book.ily` — Task 3 Step 1.
- Empirical tuning of thickness/size/padding — Task 2 Step 4, Task 3 Step 5.
