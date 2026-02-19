\version "2.24.0"

% A book containing sheets with different staff sizes
% This demonstrates that we can mix staff sizes in one book

\book {
  \paper {
    #(set-paper-size "a4")
    % Default font factor for the book
    #(define fonts (set-global-fonts
         #:music "feta"
         #:factor 1.0))
  }

  \header {
    title = "Mixed Staff Size Test Book"
    subtitle = "Three songs with different staff sizes in one book"
    tagline = ##f
  }

  % Table of contents
  \markuplist \table-of-contents

  % Include the three sheets with different staff sizes
  \include "SimpleSong20.ly"
  \include "SimpleSong16.ly"
  \include "SimpleSong24.ly"
}
