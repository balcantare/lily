\version "2.24.0"
\include "../include/book.ily"

\book {
  \paper {
    #(set-paper-size "a4")
  }
  \header {
    title = "layout-set-staff-size with jazz chords test"
    tagline = ##f
  }

  % Score 1: 20pt
  \bookpart {
    \paper {
      page-count = #1
    }
    \header { piece = "Score 1: 20pt" }
    \score {
      <<
      \new ChordNames \chordmode { c1 f c g c }
      \new Staff \relative c' {
        c4 d e f g a b c
      }
      \new Lyrics \lyricmode { C _ F _ C _ G _ C }
      >>
      \layout {
        %#(layout-set-staff-size 20)
      }
    }
  }

  % Score 2: 16pt
  \bookpart {
    \paper {
      page-count = #1
    }
    \header { piece = "Score 2: 16pt (smaller!)" }
    \score {
      <<
      \new ChordNames \chordmode { g1 c g d g }
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

  % Score 3: 24pt
  \bookpart {
    \paper {
      page-count = #1
    }
    \header { piece = "Score 3: 24pt (larger!)" }
    \score {
      <<
      \new ChordNames \chordmode { f1 c:dim f c f }
      \new Staff \relative c' {
        f4 g a r b a g f2
      }
      \new Lyrics \lyricmode { F _ C _ F _ C _ F }
      >>
      \layout {
        #(layout-set-staff-size 24)
      }
    }
  }
}
