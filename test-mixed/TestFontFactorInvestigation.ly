\version "2.24.0"

% Investigation: Does layout-set-staff-size affect the font factor?
% Hypothesis: layout-set-staff-size resets fonts to default, losing lilyjazz

\include "../include/book.ily"

\book {
  \paper {
    #(set-paper-size "a4")
  }
  \header {
    title = "Font Factor Investigation"
    tagline = ##f
  }

  % Score 1: No per-score layout (uses book-level jazz fonts)
  \bookpart {
    \header { piece = "Score 1: Default (24pt, jazz fonts)" }
    \score {
      \new Staff \relative c' {
        \key g \minor
        c4 d e f g a b c
      }
    }
  }

  % Score 2: With layout-set-staff-size only
  \bookpart {
    \header { piece = "Score 2: layout-set-staff-size 20 (jazz fonts?)" }
    \score {
      \new Staff \relative c' {
        \key g \minor
        g4 a b c b a g2.
      }
      \layout {
        #(layout-set-staff-size 20)
      }
    }
  }

  % Score 3: With layout-set-staff-size AND explicit font setting
  \bookpart {
    \header { piece = "Score 3: layout-set-staff-size 20 + fonts" }
    \score {
      \new Staff \relative c' {
        \key g \minor
        f4 g a b a g f2
      }
      \layout {
        #(layout-set-staff-size 20)
        % Can we set fonts here? No - fonts must be in \paper
      }
    }
  }
}
