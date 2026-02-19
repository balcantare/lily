\version "2.24.0"
#(define sheetName "Simple Song (16pt staff)")
#(define sheetStaffSize 16)

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (set-global-fonts
         #:music "feta"
         #:factor 1.0))
  }
  \header {
    piece = \markup \column {
      "Simple Song in G (3/4)"
      "(staff size 16pt - smaller)"
    }
  }
  \score {
    \new Staff \relative c' {
      \time 3/4
      \key g \major
      g4 a b c b a g2.
    }
    \layout {
      #(layout-set-staff-size sheetStaffSize)
    }
  }
}
