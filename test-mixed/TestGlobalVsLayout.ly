\version "2.24.0"

% Test: Does set-global-staff-size prevent layout-set-staff-size from working?

\include "../include/book.ily"

% Override with set-global-staff-size at top level
#(set-global-staff-size 24)

\book {
  \paper {
    #(set-paper-size "a4")
  }
  \header {
    title = "Test: Global 24pt, then per-score 20pt"
    tagline = ##f
  }

  % Score 1: No explicit layout (should be 24pt from global)
  \bookpart {
    \header { piece = "Score 1: No layout (should be 24pt)" }
    \score {
      \new Staff \relative c' {
        c4 d e f g a b c
      }
    }
  }

  % Score 2: Explicit layout-set-staff-size-with-jazz 20
  \bookpart {
    \header { piece = "Score 2: layout-set-staff-size-with-jazz 20" }
    \score {
      \new Staff \relative c' {
        g4 a b c b a g2.
      }
      \layout {
        #(layout-set-staff-size-with-jazz 20)
      }
    }
  }

  % Score 3: Back to no layout
  \bookpart {
    \header { piece = "Score 3: No layout (should be 24pt)" }
    \score {
      \new Staff \relative c' {
        f4 g a b a g f2
      }
    }
  }
}
