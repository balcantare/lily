\version "2.24.0"

% Test: Does per-score \layout inherit or replace global \layout?
% Hypothesis: Per-score \layout REPLACES global \layout, losing jazz chord settings

\include "../include/book.ily"

\book {
  \paper {
    #(set-paper-size "a4")
    #(define fonts (book-font 1.2))
  }
  \header {
    title = "Test: Per-score layout WITH jazz context"
    tagline = ##f
  }

  % Score 1: No per-score layout (should have jazz chords)
  \bookpart {
    \header { piece = "Score 1: No per-score layout (has jazz chords)" }
    \score {
      <<
      \new ChordNames \chordmode { c1:7 f:7 c:7 g:7 c:7 }
      \new Staff \relative c' {
        c4 d e f g a b c
      }
      >>
    }
  }

  % Score 2: With per-score layout but NO jazz context (loses jazz chords)
  \bookpart {
    \header { piece = "Score 2: Per-score layout WITHOUT jazz context" }
    \score {
      <<
      \new ChordNames \chordmode { g1:7 c:7 g:7 d:7 g:7 }
      \new Staff \relative c' {
        g4 a b c b a g2.
      }
      >>
      \layout {
        #(layout-set-staff-size 20)
        % No jazz chord context here - will be lost!
      }
    }
  }

  % Score 3: With per-score layout AND jazz context (has jazz chords)
  \bookpart {
    \header { piece = "Score 3: Per-score layout WITH jazz context" }
    \score {
      <<
      \new ChordNames \chordmode { f1:7 c:7 f:7 c:7 f:7 }
      \new Staff \relative c' {
        f4 g a b a g f2
      }
      >>
      \layout {
        #(layout-set-staff-size 20)
        \context {
          \ChordNames
          chordRootNamer = #JazzChordNames
          chordNameExceptions = #JazzChords
          \override ChordName.font-name = #"lilyjazz-chord"
        }
      }
    }
  }
}
