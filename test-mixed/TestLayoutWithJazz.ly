\version "2.24.0"
% Include jazz settings
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
      #(set-global-staff-size 20)
    }
    \header { piece = "Score 1: 20pt" }
    \score {
      <<
      \new ChordNames \chordmode { c1 f c g:7 c }
      \new Staff \relative c' {
        c4 d e f g a b c
      }
      \new Lyrics \lyricmode { C _ F _ C _ G _ C }
      >>
      \layout {
        \context {
          \ChordNames
          \override ChordName.font-name = #"lilyjazz-chord"
        }
        #(layout-set-staff-size 20)
      }
    }
  }

  % Score 2: 16pt
  \bookpart {
    \paper {
      #(set-global-staff-size 16)
    }
    \header { piece = "Score 2: 16pt" }
    \score {
      <<
      \new ChordNames \chordmode { g1 c g d:7 g }
      \new Staff \relative c' {
        g4 a b c b a g2.
      }
      \new Lyrics \lyricmode { G _ C _ G _ D _ G }
      >>
      \layout {
        \context {
          \ChordNames
          \override ChordName.font-name = #"lilyjazz-chord"
        }
        #(layout-set-staff-size 16)
      }
    }
  }

  % Score 3: 24pt
  \bookpart {
    \paper {
      #(set-global-staff-size 24)
    }
    \header { piece = "Score 3: 24pt" }
    \score {
      <<
      \new ChordNames \chordmode { f1 b f c:7 f }
      \new Staff \relative c' {
        f4 g a b a g f2
      }
      \new Lyrics \lyricmode { F _ Bb _ F _ C _ F }
      >>
      \layout {
        \context {
          \ChordNames
          \override ChordName.font-name = #"lilyjazz-chord"
        }
        #(layout-set-staff-size 24)
      }
    }
  }
}
