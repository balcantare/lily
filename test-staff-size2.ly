\version "2.24.0"

% Test 2: Global staff size with per-score overrides

% Set a global staff size
#(set-global-staff-size 18)

% Score 1: No per-score size (should use global 18pt)
\score {
  \new Staff \relative c' {
    c4 d e f g a b c
  }
  \header {
    piece = "No override (should be 18pt from global)"
  }
}

% Score 2: Override to 20pt
\score {
  \new Staff \relative c' {
    c4 d e f g a b c
  }
  \layout {
    #(layout-set-staff-size 20)
  }
  \header {
    piece = "Override to 20pt"
  }
}

% Score 3: Override to 14pt
\score {
  \new Staff \relative c' {
    c4 d e f g a b c
  }
  \layout {
    #(layout-set-staff-size 14)
  }
  \header {
    piece = "Override to 14pt"
  }
}
