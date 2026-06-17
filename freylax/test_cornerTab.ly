\version "2.24.4"

% Include cornerTab.ily directly for isolated testing.
\include "../include/cornerTab.ily"

\header { tagline = ##f }

% Each bookpart sets a title; the corner tab in the top-right header
% should show the prefix derived from that title. Cover all prefix cases.

\bookpart {
  \header { title = "Autumn Leaves" }
  \markup \vspace #6
  \markup { "Expected top-right tab:  Au (middot) Le" }
}

\bookpart {
  \header { title = "Zelda" }
  \markup \vspace #6
  \markup { "Expected top-right tab:  Ze   (one word, narrower)" }
}

\bookpart {
  \header { title = "The Beatles" }
  \markup \vspace #6
  \markup { "Expected top-right tab:  Th (middot) Be" }
}

\bookpart {
  \header { title = "le Jeune Homme De Nante" }
  \markup \vspace #6
  \markup { "Expected top-right tab:  le (middot) Je   (lowercase preserved)" }
}

\bookpart {
  \header { title = "A Day In The Life Of A Fool" }
  \markup \vspace #6
  \markup { "Expected top-right tab:  A (middot) Da   (one-letter first group)" }
}

\bookpart {
  \header { title = ##f }
  \markup \vspace #6
  \markup { "Expected: NO tab on this page (title is ##f, like the TOC bookpart)" }
}
