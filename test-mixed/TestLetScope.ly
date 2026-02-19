\version "2.24.0"

% Test: Can we use a let-block to scope variables per sheet?

\book {
  \paper {
    #(set-paper-size "a4")
    #(define fonts (set-global-fonts
         #:music "feta"
         #:factor 1.0))
  }

  \header {
    title = "Let Scope Test"
    tagline = ##f
  }

  % The challenge: \layout block doesn't support let-binding
  % But we can inline the value directly!

  \bookpart {
    \header { piece = "Sheet 1: Inline 20pt" }
    \score {
      \new Staff \relative c' { c4 d e f }
      \layout {
        #(layout-set-staff-size 20)  % Direct value, no variable
      }
    }
  }

  \bookpart {
    \header { piece = "Sheet 2: Inline 16pt" }
    \score {
      \new Staff \relative c' { g4 a b c }
      \layout {
        #(layout-set-staff-size 16)  % Direct value, no variable
      }
    }
  }

  \bookpart {
    \header { piece = "Sheet 3: Inline 24pt" }
    \score {
      \new Staff \relative c' { e4 f g a }
      \layout {
        #(layout-set-staff-size 24)  % Direct value, no variable
      }
    }
  }
}
