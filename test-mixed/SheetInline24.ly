\version "2.24.0"

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (set-global-fonts
         #:music "feta"
         #:factor 1.0))
  }
  \header {
    piece = "Inline 24pt"
  }
  \score {
    \new Staff \relative c' {
      f4 g a bes a g f2
    }
    \layout {
      #(layout-set-staff-size 24)
    }
  }
}
