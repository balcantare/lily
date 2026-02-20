\version "2.24.2"
sheetName = "FairyValse"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 3/4
  \key c \major
  a2 b8( c)
  a4 b c
  c4 a2~
  a4 c c
  d e e~
  e4 e e
  d c b
  b c b \break
  a2 b8( c)
  a4 b c
  a2. c
  c2. e2 e4
  d4 c b
  b c b \break
  %\bar "||"
  a2. c2 c4
  a2 a4
  c2 c4
  c2 c4
  e2 e4
  d4 c b
  b c b \break
  a2. c2 c4
  a2 a4
  c2 c4
  c2 c4
  e2 e4
  d4 c b
  b c b
  \bar "|."
}

chrdStrophe = \chordmode {
  a2.:m s f s c s g s
  a2.:m s f s c s g s
  a2.:m s f s c s g s
  a2.:m s f s c s g s
}

\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \header { subtitle = "Walzer" }
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
