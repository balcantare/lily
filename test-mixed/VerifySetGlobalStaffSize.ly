\version "2.24.0"

% Test: Does set-global-staff-size in \bookpart \paper actually work?

\book {
  \paper {
    #(set-paper-size "a4")
  }
  \header {
    title = "set-global-staff-size Test"
    tagline = ##f
  }

  % Score 1: First, set to 20pt
  \bookpart {
    \paper {
      #(set-global-staff-size 20)
    }
    \header { piece = "Score 1: Should be 20pt" }
    \score {
      \new Staff \relative c' {
        c4 d e f g a b c
        \mark \markup "(look at staff height)"
      }
    }
  }

  % Score 2: Try to change to 16pt
  \bookpart {
    \paper {
      #(set-global-staff-size 16)
    }
    \header { piece = "Score 2: Should be 16pt (smaller!)" }
    \score {
      \new Staff \relative c' {
        g4 a b c b a g2.
        \mark \markup "(look at staff height - should be smaller)"
      }
    }
  }

  % Score 3: Try to change to 24pt
  \bookpart {
    \paper {
      #(set-global-staff-size 24)
    }
    \header { piece = "Score 3: Should be 24pt (larger!)" }
    \score {
      \new Staff \relative c' {
        f4 g a bes a g f2
        \mark \markup "(look at staff height - should be larger)"
      }
    }
  }
}
