# Per-Score Staff Size Design

**Date:** 2026-02-18
**Status:** Approved

## Problem

The current framework requires all sheets in a book to use the same staff size. Books like `liederbuch.ly` (24pt) and `liederbuch20.ly` (20pt) must be compiled separately. This prevents mixing sheets with different staff sizes in a single book.

## Solution

LilyPond 2.24+ supports `#(layout-set-staff-size XX)` in each score's `\layout` block. This allows individual scores to specify their own staff size while remaining in the same book.

## Implementation

### Per-Sheet Changes

Add `#(layout-set-staff-size XX)` to each score's `\layout` block:

```lilypond
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
```

### Default Behavior (24pt)

Omit `layout-set-staff-size` to use the book's default:

```lilypond
\score {
  << ...music... >>
  \layout {
    % No staff size specified = uses default (24pt)
  }
}
```

## Benefits

1. **Simplicity** – No variable definitions, one line per score
2. **Explicit** – Staff size visible at point of use
3. **No scope issues** – Each layout block independent
4. **Backward compatible** – Existing sheets work unchanged
5. **Standalone compatible** – Works for both standalone and book compilation

## Migration

1. Add `#(layout-set-staff-size XX)` to scores requiring non-default sizes
2. Compile books containing mixed staff sizes
3. Remove redundant book files (e.g., `liederbuch20.ly` if merging into `liederbuch.ly`)

## Test Results

Tested with `/home/robert/music/lily/test-mixed/BookWithInlineSheets.pdf`:
- Standalone compilation: ✓
- Mixed sizes in single book: ✓
- Default fallback (no inline value): ✓
