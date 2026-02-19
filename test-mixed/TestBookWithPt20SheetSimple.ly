\version "2.24.0"

% Simple test: Compare a score with layout-set-staff-size 20
% versus a score with no explicit setting (uses book default 24)

\include "../include/book.ily"

#(define book-staff-size 24)  % Main book is 24pt

\book {
  \paper {
    #(set-paper-size "a4")
  }
  \header {
    title = "Test: layout-set-staff-size 20 vs 24"
    tagline = ##f
  }

  % Score 1: 24pt (default)
  \bookpart {
    \header { piece = "Score 1: 24pt (default from book-staff-size)" }
    \score {
      <<
      \new ChordNames \chordmode { c1:7 f:m7 c:m7 g:7 c:7 }
      \new Staff \relative c' {
        c4 d e f g a b c
      }
      >>
      % No explicit layout-set-staff-size
    }
  }

  % Score 2: 20pt (explicitly set)
  \bookpart {
    \header { piece = "Score 2: 20pt (explicitly set)" }
    \score {
      <<
      \new ChordNames \chordmode { g1:7 c:m7 g:m7 d:7 g:7 }
      \new Staff \relative c' {
        g4 a b c b a g2.
      }
      >>
      \layout {
        #(layout-set-staff-size 20)
      }
    }
  }

  % Score 3: 24pt (back to default)
  \bookpart {
    \header { piece = "Score 3: 24pt (back to default)" }
    \score {
      <<
      \new ChordNames \chordmode { f1:7 c:m7 f:m7 c:7 f:7 }
      \new Staff \relative c' {
        f4 g a b a g f2
      }
      >>
      % No explicit layout-set-staff-size
    }
  }

  % Score 4: 16pt (smaller)
  \bookpart {
    \header { piece = "Score 4: 16pt (smaller)" }
    \score {
      <<
      \new ChordNames \chordmode { d1:7 g:m7 d:m7 a:7 d:7 }
      \new Staff \relative c' {
        d4 e f g f e d2.
      }
      >>
      \layout {
        #(layout-set-staff-size 16)
      }
    }
  }
}
