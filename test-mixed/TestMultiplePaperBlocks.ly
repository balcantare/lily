\version "2.24.0"

% Test: Can we use \paper blocks with different fonts per bookpart?
% Each bookpart can have its own \paper block

\include "../include/book.ily"

\book {
  \header {
    title = "Test: Multiple \paper blocks with different fonts"
    tagline = ##f
  }

  % Score 1: 24pt
  \bookpart {
    \paper {
      #(set-paper-size "a4")
      #(define fonts (book-font 1.2))
    }
    \header { piece = "Score 1: 24pt (factor 1.2)" }
    \score {
      \new Staff \relative c' {
        \key g \minor
        c4 d e f g a b c
      }
    }
  }

  % Score 2: 20pt - try different font factor
  \bookpart {
    \paper {
      #(set-paper-size "a4")
      #(define fonts (book-font 1.0))  % Smaller factor for smaller staff
    }
    \header { piece = "Score 2: 20pt (factor 1.0)" }
    \score {
      \new Staff \relative c' {
        \key g \minor
        g4 a b c b a g2.
      }
    }
  }

  % Score 3: 16pt - even smaller font factor
  \bookpart {
    \paper {
      #(set-paper-size "a4")
      #(define fonts (book-font 0.8))
    }
    \header { piece = "Score 3: 16pt (factor 0.8)" }
    \score {
      \new Staff \relative c' {
        \key g \minor
        f4 g a b a g f2
      }
    }
  }
}
