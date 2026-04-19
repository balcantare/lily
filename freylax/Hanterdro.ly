\version "2.24.2"
sheetName = "Hanterdro"
sheetComposer = "Wouter Kuyper"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

strophe = \relative c'' {
  \time 6/4
  \key a \minor
  \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
    c4 a8 b c4. e8 d8[ c b a]
    c4 a8 b c4 d b g \break
    c4 a8 b c4. e8 d8[ c b a]
    c4 a8 b c4 e b2
  } \break
  \mark \markup{ \box{\fontsize #4 B}}
  \repeat volta 2 {
    e4 c8 d e4. g8 f[ e d c]
    a4 b8 c d4 c8 d e4 c \break
    e4 c8 d e4. g8 f[ e d c]
    a4 b8 c d4 e b2
   } 
}

chrdStrophe = \chordmode {
  a1:m g2
  f1 e2:m
  a1:m d2:m
  f1 g2
  c1 f2
  d2:m g a:m
  c1 f2
  d2:m g4 a:m e:m
  
}

\bookpart {
  \paper {
    page-count = #1
    system-system-spacing.padding = #8
  }
  \bookItem
  \header {
    subtitle = "Hanterdro |AABB|"
  }
  \score {
    \layout {#(layout-set-staff-size-with-jazz 24)}
    <<
    \new ChordNames { \doTranspose \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \doTranspose \strophe }
    >>
    >>
  }
}
