# Per-Score Staff Size Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Enable sheets with different staff sizes (16pt, 20pt, 24pt) to coexist in a single book by adding `#(layout-set-staff-size XX)` to each score's `\layout` block.

**Architecture:** LilyPond 2.24+ supports `layout-set-staff-size` within each score's `\layout` block. This sets the staff size for that specific score only, independent of the book's global staff size. Each sheet's `\bookpart` contains a `\score` block - we add `\layout { #(layout-set-staff-size XX) }` inside each `\score`.

**Tech Stack:** LilyPond 2.24.4, existing framework (`include/book.ily`, `include/bookDefines.ily`), test files in `test-mixed/` directory

---

## Task 1: Create Test Sheet Files

Verify the pattern works with actual sheet structure (including chord names, lyrics, etc.)

**Files:**
- Create: `test-mixed/RealSong20.ly`
- Create: `test-mixed/RealSong24.ly`
- Create: `test-mixed/RealSongBook.ly`

**Step 1: Create test sheet with 20pt staff**

```lilypond
\version "2.24.0"
sheetName = "Test Song 20pt"
\include "../include/book.ily"

strophe = \relative c' {
  \time 4/4
  \key c \major
  c4 d e f g a b c
  c4 b a g f e d c
}

chrdStrophe = \chordmode {
  c1 f c g7 c
}

lyrStrophe = \lyricmode {
  This is a test song with __ twen -- ty point staff.
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff {
        \new Voice = "Strophe" { \strophe }
      }
      \new Lyrics \lyricsto "Strophe" \lyrStrophe
    >>
    \layout {
      #(layout-set-staff-size 20)
    }
  }
}
```

**Step 2: Create test sheet with 24pt staff**

```lilypond
\version "2.24.0"
sheetName = "Test Song 24pt"
\include "../include/book.ily"

strophe = \relative c' {
  \time 3/4
  \key g \major
  g4 a b c b a g2.
}

chrdStrophe = \chordmode {
  g2. c g d:7 g
}

lyrStrophe = \lyricmode {
  This is a test song with __ twen -- ty -- four point staff.
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff {
        \new Voice = "Strophe" { \strophe }
      }
      \new Lyrics \lyricsto "Strophe" \lyrStrophe
    >>
    \layout {
      #(layout-set-staff-size 24)
    }
  }
}
```

**Step 3: Create test book file**

```lilypond
\version "2.24.0"
#(define book-staff-size 20)
\include "../include/book.ily"

\bookpart {
  \paper {
    tocTitleMarkup = \markup \huge \column {
      \fill-line { \null "Test Contents" \null }
    }
  }
  \header { title = ##f }
  \markuplist \table-of-contents
}

\includeSheet "../test-mixed/RealSong20.ly"
\includeSheet "../test-mixed/RealSong24.ly"
```

**Step 4: Compile standalone test sheets**

Run:
```bash
cd test-mixed
lilypond -dno-point-and-click RealSong20.ly
lilypond -dno-point-and-click RealSong24.ly
```
Expected: Two PDFs created, visibly different staff sizes

**Step 5: Compile test book**

Run:
```bash
lilypond -dno-point-and-click RealSongBook.ly
```
Expected: Single PDF with two songs, visibly different staff sizes

**Step 6: Commit**

```bash
git add test-mixed/RealSong*.ly
git commit -m "test: add real sheet test files for mixed staff sizes"
```

---

## Task 2: Update Existing Sheet - Example

Update one existing sheet as a reference example.

**Files:**
- Modify: `balcantare/LesChampsElysees.ly:174-188`

**Step 1: Add \layout block to the score**

Find the `\score {` block in the sheet (around line 174). Add `\layout` before the closing `}`:

```lilypond
  \score {
    <<
      \new ChordNames { \transpose g g \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \transpose g g \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheAA
    \new AltLyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheCC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheDD
    >>
    \layout {
      #(layout-set-staff-size 20)
    }
  }
```

**Step 2: Compile standalone**

Run:
```bash
cd balcantare
lilypond -dno-point-and-click LesChampsElysees.ly
```
Expected: PDF created, staff size 20pt

**Step 3: Compile in a book**

Create test book:
```lilypond
\version "2.24.0"
#(define book-staff-size 20)
\include "../include/book.ily"

\bookpart {
  \header { title = ##f }
  \markuplist \table-of-contents
}

\includeSheet "LesChampsElysees.ly"
```

Run:
```bash
lilypond -dno-point-and-click TestBook.ly
```
Expected: PDF created

**Step 4: Commit**

```bash
git add balcantare/LesChampsElysees.ly
git commit -m "feat: add explicit staff size to LesChampsElysees"
```

---

## Task 3: Document Usage Pattern

Create documentation for adding staff size to sheets.

**Files:**
- Create: `docs/per-score-staff-size.md`

**Step 1: Write documentation**

```markdown
# Per-Score Staff Size

To specify a staff size for a sheet, add `\layout { #(layout-set-staff-size XX) }` inside the `\score` block.

## Example

\bookpart {
  \paper {
    #(define fonts (book-font 1.2))
  }
  \bookItem
  \score {
    << ...music... >>
    \layout {
      #(layout-set-staff-size 20)
    }
  }
}

## Common Staff Sizes

- 16pt: Smaller, fits more content
- 20pt: Medium size
- 24pt: Larger, default for this framework

## Default Behavior

If no `layout-set-staff-size` is specified, the score uses the book's global staff size (default 24pt).
```

**Step 2: Commit**

```bash
git add docs/per-score-staff-size.md
git commit -m "docs: add per-score staff size documentation"
```

---

## Task 4: Consolidate Books (Optional)

After updating sheets, books like `liederbuch20.ly` can be merged into `liederbuch.ly`.

**Files:**
- Modify: `balcantare/liederbuch.ly`
- Delete: `balcantare/liederbuch20.ly` (after migration)

**Step 1: Review current book files**

List books to consolidate:
```bash
grep -l "liederbuch" balcantare/*.ly
```

**Step 2: Add songs from liederbuch20.ly to liederbuch.ly**

Copy `\includeSheet` lines from `liederbuch20.ly` to `liederbuch.ly`.

**Step 3: Test compilation**

```bash
cd balcantare
lilypond -dno-point-and-click liederbuch.ly
```

**Step 4: Remove redundant book file**

```bash
rm balcantare/liederbuch20.ly
```

**Step 5: Update makefile if needed**

Edit `balcantare/makefile` to remove `liederbuch20.pdf` from books list.

**Step 6: Commit**

```bash
git add balcantare/liederbuch.ly balcantare/makefile
git commit -m "refactor: consolidate liederbuch books with mixed staff sizes"
```

---

## Testing Checklist

After implementation, verify:

- [ ] Standalone sheet compilation works
- [ ] Book with mixed staff sizes compiles
- [ ] PDF output shows visibly different staff sizes
- [ ] Existing sheets without explicit size still work (backward compatibility)
- [ ] Font factor (`book-font`) still applies correctly
