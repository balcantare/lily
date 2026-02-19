\version "2.24.0"

% Book with direct inline values - no variables at all!

\book {
  \paper {
    #(set-paper-size "a4")
    #(define fonts (set-global-fonts
         #:music "feta"
         #:factor 1.0))
  }

  \header {
    title = "Direct Inline Test"
    subtitle = "No sheetStaffSize variable - just inline values"
    tagline = ##f
  }

  \markuplist \table-of-contents

  % Sheet 1: 20pt
  \bookpart {
    \header { piece = "Song 1: 20pt" }
    \score {
      \new Staff \relative c' {
        c4 d e f g a b c
      }
      \layout {
        #(layout-set-staff-size 20)
      }
    }
  }

  % Sheet 2: 22pt
  \bookpart {
    \header { piece = "Song 2: 22pt" }
    \score {
      \new Staff \relative c' {
        g4 a b c b a g2.
      }
      \layout {
        #(layout-set-staff-size 22)
      }
    }
  }

  % Sheet 3: 24pt
  \bookpart {
    \header { piece = "Song 3: 24pt" }
    \score {
      \new Staff \relative c' {
        f4 g a bes a g f2
      }
      \layout {
        #(layout-set-staff-size 24)
      }
    }
  }

  % Sheet 4: No layout-set-staff-size (uses global default)
  \bookpart {
    \header { piece = "Song 4: No inline (uses global)" }
    \score {
      \new Staff \relative c' {
        e4 f g a b a g2.
      }
      \layout {
        % No layout-set-staff-size here
      }
    }
  }
}
