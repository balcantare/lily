\version "2.24.0"

% Test: Include a pt20 sheet in a 24pt book
% The sheet should render at 20pt, while other scores render at 24pt

\include "../include/book.ily"

#(define book-staff-size 24)  % Main book is 24pt

\book {
  \paper {
    #(set-paper-size "a4")
  }
  \header {
    title = "Test: pt20 sheet in 24pt book"
    tagline = ##f
  }

  % Score 1: 24pt
  \bookpart {
    \header { piece = "Score 1: 24pt (native book size)" }
    \score {
      <<
      \new ChordNames \chordmode { c1:7 f:7 c:7 g:7 c:7 }
      \new Staff \relative c' {
        c4 d e f g a b c
      }
      >>
      \layout {
        #(layout-set-staff-size 24)
      }
    }
  }

  % Include the pt20 sheet (DanserEncore)
  % This sheet uses #(layout-set-staff-size 20) in its \score \layout
  \include "../balcantare/DanserEncore.ly"

  % Score 3: Back to 24pt
  \bookpart {
    \header { piece = "Score 3: 24pt (back to book size)" }
    \score {
      <<
      \new ChordNames \chordmode { f1:7 c:7 f:7 c:7 f:7 }
      \new Staff \relative c' {
        f4 g a b a g f2
      }
      >>
      \layout {
        #(layout-set-staff-size 24)
      }
    }
  }
}
