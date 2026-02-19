\version "2.24.0"
#(define sheetName "Simple Song (24pt staff)")
#(define sheetStaffSize 24)

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (set-global-fonts
         #:music "feta"
         #:factor 1.0))
  }
  \header {
    piece = \markup \column {
      "Simple Song in F (2/4)"
      "(staff size 24pt - larger)"
    }
  }
  \score {
    \new Staff \relative c' {
      \time 2/4
      \key f \major
      f4 g a bes a g f2
    }
    \layout {
      #(layout-set-staff-size sheetStaffSize)
    }
  }
}
