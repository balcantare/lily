\version "2.24.0"
\include "../include/book.ily"

% Test: Can we use \magnifyStaff per score instead of layout-set-staff-size?

\book {
  \paper {
    #(set-paper-size "a4")
    #(define fonts
      (set-global-fonts
       #:music "lilyjazz"
       #:brace "lilyjazz"
       #:roman "lilyjazz-text"
       #:sans "lilyjazz-chord"
       #:factor (/ staff-height pt 20)
      ))
  }
  \header {
    title = "magnifyStaff test with jazz fonts"
    tagline = ##f
  }

  % Score 1: normal (1.0x)
  \bookpart {
    \paper {
      page-count = #1
    }
    \header { piece = "Score 1: normal (1.0x)" }
    \score {
      <<
      \new ChordNames \chordmode { c1 f c g c }
      \new Staff \relative c' {
        c4 d e f g a b c
      }
      \new Lyrics \lyricmode { C _ F _ C _ G _ C }
      >>
    }
  }

  % Score 2: smaller staff (0.75x)
  \bookpart {
    \paper {
      page-count = #1
    }
    \header { piece = "Score 2: 0.75x (smaller!)" }
    \score {
      <<
      \new ChordNames \chordmode { g1 c g d g }
      \new Staff \with {
        \magnifyStaff #0.75
      } \relative c' {
        g4 a b c b a g2.
      }
      \new Lyrics \lyricmode { G _ C _ G _ D _ G }
      >>
    }
  }

  % Score 3: larger staff (1.2x)
  \bookpart {
    \paper {
      page-count = #1
    }
    \header { piece = "Score 3: 1.2x (larger!)" }
    \score {
      <<
      \new ChordNames \chordmode { f1 c f c f }
      \new Staff \with {
        \magnifyStaff #1.2
      } \relative c' {
        f4 g a b a g f2
      }
      \new Lyrics \lyricmode { F _ C _ F _ C _ F }
      >>
    }
  }
}
