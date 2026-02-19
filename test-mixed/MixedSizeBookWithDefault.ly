\version "2.24.0"

% Book with mixed staff sizes including default

\book {
  \paper {
    #(set-paper-size "a4")
    #(define fonts (set-global-fonts
         #:music "feta"
         #:factor 1.0))
  }

  \header {
    title = "Mixed Staff Size Test Book"
    subtitle = "Four songs: explicit sizes + default (24pt)"
    tagline = ##f
  }

  \markuplist \table-of-contents

  \include "SimpleSong20.ly"
  \include "SimpleSong16.ly"
  \include "SimpleSong24.ly"
  \include "SimpleSongDefault.ly"
}
