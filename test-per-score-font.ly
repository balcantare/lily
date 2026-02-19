\version "2.24.0"

% Test 4: Can we set fonts per-score?

\paper {
  #(define fonts (set-global-fonts
       #:music "feta"
       #:factor 1.0))
}

#(set-global-staff-size 20)

% Score 1: Default fonts (1.0 factor)
\score {
  \new Staff \relative c' {
    c4 d e f g a b c
  }
  \header {
    piece = "Default: 20pt staff, 1.0 font factor"
  }
}

% Score 2: Try to override fonts in layout (this may not work)
\score {
  \new Staff \relative c' {
    c4 d e f g a b c
  }
  \layout {
    #(layout-set-staff-size 16)
    % Note: fonts cannot be set in \layout, only in \paper
  }
  \header {
    piece = "16pt staff, still 1.0 font factor (fonts in paper only)"
  }
}
