\version "2.24.0"

\book {
  \paper {
    #(set-paper-size "a4")
    #(define fonts (set-global-fonts
         #:music "feta"
         #:factor 1.0))
  }

  \header {
    title = "Direct Inline Test (with include)"
    subtitle = "No variables, just inline #(layout-set-staff-size XX)"
    tagline = ##f
  }

  \markuplist \table-of-contents

  \include "SheetInline20.ly"
  \include "SheetInline24.ly"
}
