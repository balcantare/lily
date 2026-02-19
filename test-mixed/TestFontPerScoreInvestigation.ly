\version "2.24.0"

% Investigation: Can we use different fonts per score in a book?
% The key insight: set-global-fonts only works in \paper block
% \layout blocks cannot set fonts, only overrides

\include "../include/bookDefines.ily"

\book {
  \paper {
    #(set-paper-size "a4")
    % Global font setting applies to ALL scores in this book
    #(define fonts (book-font 1.2))
  }
  \header {
    title = "Font Per-Score Investigation"
    tagline = ##f
  }

  % Score 1: 20pt with jazz fonts (from paper)
  \bookpart {
    \header { piece = "Score 1: 20pt WITH jazz fonts" }
    \score {
      \new Staff \relative c' {
        c4 d e f g a b c
      }
      \layout {
        #(layout-set-staff-size 20)
        % Note head fonts come from \paper set-global-fonts
        % Jazz chords override would go here
      }
    }
  }

  % Score 2: 16pt - still same fonts from paper
  \bookpart {
    \header { piece = "Score 2: 16pt (same jazz fonts from paper)" }
    \score {
      \new Staff \relative c' {
        g4 a b c b a g2.
      }
      \layout {
        #(layout-set-staff-size 16)
      }
    }
  }

  % Score 3: 24pt - still same fonts from paper
  \bookpart {
    \header { piece = "Score 3: 24pt (same jazz fonts from paper)" }
    \score {
      \new Staff \relative c' {
        f4 g a b a g f2
      }
      \layout {
        #(layout-set-staff-size 24)
      }
    }
  }
}
