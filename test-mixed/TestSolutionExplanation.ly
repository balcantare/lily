\version "2.24.0"

% SOLUTION DEMONSTRATION
% =====================
%
% PROBLEM: #(set-global-staff-size) in \bookpart \paper does NOT work
% when sheets are included in a larger book.
%
% ROOT CAUSE:
%   - #(set-global-staff-size) can only be used at top level
%   - In \bookpart \paper, LilyPond warns: "Nicht auf höchster Ebene im Gültigkeitsbereich"
%   - All sheets inherit the FIRST staff size set
%
% SOLUTION: Use #(layout-set-staff-size) in \score \layout block
%
% WHY THIS WORKS:
%   1. Jazz note head fonts are set in \paper via (set-global-fonts ...) in book.ily
%   2. Jazz chord styling is set in global \layout in jazzchords.ily
%   3. #(layout-set-staff-size) in per-score \layout changes staff size
%      while INHERITING all other layout settings (jazz chords, thickness, etc.)
%   4. Font settings from \paper apply globally to the book
%
% Before: (WRONG - doesn't work in book context)
%   \bookpart {
%     \paper {
%       #(set-global-staff-size 20)  % Ignored in bookpart!
%     }
%     \score { ... }
%   }
%
% After: (CORRECT)
%   \bookpart {
%     \paper { ... }
%     \score {
%       ...
%       \layout {
%         #(layout-set-staff-size 20)  % Works!
%       }
%     }
%   }

\include "../include/book.ily"

\book {
  \paper {
    #(set-paper-size "a4")
  }
  \header {
    title = "Mixed Staff Sizes WITH Jazz Fonts"
    tagline = ##f
  }

  % Score 1: Default (book-staff-size = 20)
  \bookpart {
    \header { piece = "Score 1: Default (20pt from book-staff-size)" }
    \score {
      <<
      \new ChordNames \chordmode { c1:7 f:7 c:7 g:7 c:7 }
      \new Staff \relative c' {
        c4 d e f g a b c
      }
      >>
      % No explicit layout-set-staff-size - uses book default
    }
  }

  % Score 2: 16pt - smaller
  \bookpart {
    \header { piece = "Score 2: 16pt (smaller)" }
    \score {
      <<
      \new ChordNames \chordmode { g1:7 c:7 g:7 d:7 g:7 }
      \new Staff \relative c' {
        g4 a b c b a g2.
      }
      >>
      \layout {
        #(layout-set-staff-size 16)
      }
    }
  }

  % Score 3: 24pt - larger
  \bookpart {
    \header { piece = "Score 3: 24pt (larger)" }
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
