\version "2.24.0"
#(define sheetName "Simple Song (20pt staff)")
#(define sheetStaffSize 20)

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (set-global-fonts
         #:music "feta"
         #:factor 1.0))
  }
  \header {
    piece = \markup \column {
      "Simple Song in C"
      "(staff size 20pt)"
    }
  }
  \score {
    \new Staff \relative c' {
      \time 4/4
      \key c \major
      c4 d e f g a b c
      c4 b a g f e d c
    }
    \layout {
      #(layout-set-staff-size sheetStaffSize)
    }
  }
}
