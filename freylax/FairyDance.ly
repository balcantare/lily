\version "2.24.2"
sheetName = "Fairy Dance"
\include "../include/book.ily"

Ostrophe = \relative c'' {
  \time 3/4
  \key c \major
  %\bar ".|:"
  %\partial 4
  e2.~ e4 e e
  e d2~ d4 d d
  f2. c c-\prall c2-\prall d4 \break
  r4 e e
  e e e
  e d2~
  d4 d d
  c2.~
  c4 c b
  c2.
  d8 c4. d4
  e2.
  g8 e4. d8 e
  d2.~
  d4 g8( e d c)
  c4 a a~
  a4 c b
  c2.
  d8 c4. d4
  e2.
  d2 e4
  d2.
  g2 e8( d)
  c4 a a~
  a c b
  c2.
  d8 c4. d4
}

chrdStrophe = \chordmode {
  c2. s g s f s g s
  c s g s f s g s
  c s g s f s g s
  c s g s f s g s
  \bar "|."
}

\bookpart {
  \paper {
    page-count = #1
  }
  \header {
    subtitle = "Walzer"
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
    }
  }
}
