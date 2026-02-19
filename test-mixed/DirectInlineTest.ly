\version "2.24.0"

% Test: Just inline the value directly in \layout
% No variable definition needed!

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (set-global-fonts
         #:music "feta"
         #:factor 1.0))
  }
  \header {
    piece = "Direct inline 20pt"
  }
  \score {
    \new Staff \relative c' {
      c4 d e f g a b c
    }
    \layout {
      #(layout-set-staff-size 20)
    }
  }
}
