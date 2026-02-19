\version "2.24.0"

% Test: Can we use set-global-staff-size inside \bookpart?

\book {
  \paper {
    #(set-paper-size "a4")
  }
  \header {
    title = "set-global-staff-size in \\bookpart Test"
    tagline = ##f
  }

  % Score 1: 20pt via set-global-staff-size in bookpart
  \bookpart {
    \paper {
      #(set-global-staff-size 20)
    }
    \header { piece = "Score 1: 20pt (set-global in bookpart)" }
    \score {
      \new Staff \relative c' {
        c4 d e f g a b c
      }
    }
  }

  % Score 2: 16pt via set-global-staff-size in bookpart
  \bookpart {
    \paper {
      #(set-global-staff-size 16)
    }
    \header { piece = "Score 2: 16pt (set-global in bookpart)" }
    \score {
      \new Staff \relative c' {
        g4 a b c b a g2.
      }
    }
  }

  % Score 3: 24pt via set-global-staff-size in bookpart
  \bookpart {
    \paper {
      #(set-global-staff-size 24)
    }
    \header { piece = "Score 3: 24pt (set-global in bookpart)" }
    \score {
      \new Staff \relative c' {
        f4 g a bes a g f2
      }
    }
  }
}
