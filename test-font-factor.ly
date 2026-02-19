\version "2.24.0"

% Test 3: Font factor with per-score staff size
% This tests if book-font factor can work independently of staff size

\paper {
  % Default font factor for the book
  #(define fonts (set-global-fonts
       #:music "feta"
       #:factor 1.2))
}

#(set-global-staff-size 20)

% Score 1: 20pt staff, 1.2 font factor (default)
\score {
  \new Staff \relative c' {
    c4 d e f g a b c
  }
  \header {
    piece = "20pt staff, 1.2 font factor (default)"
  }
}

% Score 2: 16pt staff, but still 1.2 font factor
\score {
  \new Staff \relative c' {
    c4 d e f g a b c
  }
  \layout {
    #(layout-set-staff-size 16)
  }
  \header {
    piece = "16pt staff, 1.2 font factor (from paper)"
  }
}

% Score 3: 24pt staff, but still 1.2 font factor
\score {
  \new Staff \relative c' {
    c4 d e f g a b c
  }
  \layout {
    #(layout-set-staff-size 24)
  }
  \header {
    piece = "24pt staff, 1.2 font factor (from paper)"
  }
}
