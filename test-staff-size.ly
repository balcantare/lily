\version "2.24.0"

% Test file to verify per-score staff size works in a single book

% Score 1: 20pt staff (default)
\score {
  \new Staff \relative c' {
    c4 d e f g a b c
  }
  \layout {
    #(layout-set-staff-size 20)
  }
  \header {
    piece = "Staff size 20pt"
  }
}

% Score 2: 16pt staff (smaller)
\score {
  \new Staff \relative c' {
    c4 d e f g a b c
  }
  \layout {
    #(layout-set-staff-size 16)
  }
  \header {
    piece = "Staff size 16pt"
  }
}

% Score 3: 24pt staff (larger)
\score {
  \new Staff \relative c' {
    c4 d e f g a b c
  }
  \layout {
    #(layout-set-staff-size 24)
  }
  \header {
    piece = "Staff size 24pt"
  }
}
