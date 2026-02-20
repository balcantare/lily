\version "2.24.2"
sheetName = "Salbei Schottisch"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 2/4
  \key c \major
  \bar ".|:"
  \partial 4
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
  a8 b
  c a a g
  a4 a8 b
  c b c d
  e4 \bar "" \break
  e8 f
  g8 e d c
  d4 d8 c
  b8 g e g
  a4
  } \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
  \repeatTie
  a4

  a4 e'8 a,
  c4. b8
  c b c d
  e4 c \break
  c4 g'8 c,
  d4. c8
  b8 g e g
  a4 }
}

chrdStrophe = \chordmode {
  s4
  a2:m s s c s g e:m a:m
  a:m f s c s g e:m a4:m
}

\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \header {
    subtitle = "Schottish |AABB|"
  }
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
