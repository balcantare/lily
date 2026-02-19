\version "2.24.0"
\include "../include/book.ily"

% FINAL SOLUTION TEST
% This proves that #(layout-set-staff-size) in \layout
% preserves jazz fonts (both note heads and chords)

\book {
  \paper {
    #(set-paper-size "a4")
  }
  \header {
    title = "FINAL SOLUTION: #(layout-set-staff-size) WITH Jazz Fonts"
    tagline = ##f
  }

  % Score 1: 20pt - default size
  \bookpart {
    \header { piece = "Score 1: 20pt (no layout-set-staff-size)" }
    \score {
      <<
      \new ChordNames \chordmode { c1:7 f:7 c:7 g:7 c:7 }
      \new Staff \relative c' {
        c4 d e f g a b c
      }
      \new Lyrics \lyricmode { C _ F _ C _ G _ C }
      >>
      \layout {
        %#(layout-set-staff-size 20)  % No explicit setting, uses default
      }
    }
  }

  % Score 2: 16pt - smaller
  \bookpart {
    \header { piece = "Score 2: 16pt (explicitly set)" }
    \score {
      <<
      \new ChordNames \chordmode { g1:7 c:7 g:7 d:7 g:7 }
      \new Staff \relative c' {
        g4 a b c b a g2.
      }
      \new Lyrics \lyricmode { G _ C _ G _ D _ G }
      >>
      \layout {
        #(layout-set-staff-size 16)
      }
    }
  }

  % Score 3: 24pt - larger
  \bookpart {
    \header { piece = "Score 3: 24pt (explicitly set)" }
    \score {
      <<
      \new ChordNames \chordmode { f1:7 c:7 f:7 c:7 f:7 }
      \new Staff \relative c' {
        f4 g a b a g f2
      }
      \new Lyrics \lyricmode { F _ C _ F _ C _ F }
      >>
      \layout {
        #(layout-set-staff-size 24)
      }
    }
  }
}
