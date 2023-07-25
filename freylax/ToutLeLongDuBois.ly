\version "2.22.2"
sheetName = "Tout le long du bois"
\include "book.ily"

strophe = \relative c' {
  \time 2/4
  \key c \major
  \bar ".|:"
  \repeat volta 2 {
    e4 a8 b c4 a8 b
    c8 c b a g2
    e4 a8 b c a a b
    c4 b a2
  }
  \repeat volta 2 {
    c4 a8 b c4 a8 b
    c c b a g2
    c8 c a b c a a b
    c4 b a2
  }
}

chrdStrophe = \chordmode {
  a2:m s s g
  a:m s f4 g a2:m
  a:m s s g
  f s f4 g a2:m
}

\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}