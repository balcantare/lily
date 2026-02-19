\version "2.24.0"

% Test: Can we create a custom function that preserves jazz fonts
% when changing staff size?

\include "../include/book.ily"

% Define a custom function that sets staff size AND preserves jazz fonts
#(define-public (layout-set-staff-size-with-jazz sz)
   "Set staff size and preserve lilyjazz fonts"
   (let* ((mod (current-module))
          (factor (/ sz 20.0)))  ; Calculate font factor based on staff size
     ;; First set the staff size normally
     (layout-set-staff-size sz)
     ;; Then re-apply the jazz fonts with the correct factor
     (module-define! mod 'fonts
                     (set-global-fonts
                      #:music "lilyjazz"
                      #:brace "lilyjazz"
                      #:sans "lilyjazz-chord"
                      #:factor factor))))

\book {
  \paper {
    #(set-paper-size "a4")
  }
  \header {
    title = "Test: Custom layout-set-staff-size with jazz fonts"
    tagline = ##f
  }

  % Score 1: Default 24pt
  \bookpart {
    \header { piece = "Score 1: 24pt (default, jazz fonts)" }
    \score {
      \new Staff \relative c' {
        \key g \minor
        c4 d e f g a b c
      }
    }
  }

  % Score 2: 20pt with custom function
  \bookpart {
    \header { piece = "Score 2: 20pt (custom function, jazz fonts?)" }
    \score {
      \new Staff \relative c' {
        \key g \minor
        g4 a b c b a g2.
      }
      \layout {
        #(layout-set-staff-size-with-jazz 20)
      }
    }
  }

  % Score 3: 16pt with custom function
  \bookpart {
    \header { piece = "Score 3: 16pt (custom function, jazz fonts?)" }
    \score {
      \new Staff \relative c' {
        \key g \minor
        f4 g a b a g f2
      }
      \layout {
        #(layout-set-staff-size-with-jazz 16)
      }
    }
  }
}
