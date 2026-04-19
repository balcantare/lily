\version "2.24.2"
sheetName = "Hanterdro Ouwe Jonge"
sheetComposer = "Wouter Kuyper"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

strophe = \relative c' {
  \time 6/4
  \key a \minor
  \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
    e4 a8 g a4 b c8 b a4
    e4 a8 g a4 c b g \break
    e4 a8 g a4 b c8 b a4
    e4 a8 g a4 c b2
  } \break
  \mark \markup{ \box{\fontsize #4 B}}
  \repeat volta 2 {
    a4 b8 c d4. e8 d[ c] b4
    c4 b8 a g4 a b e, \break
    a4 b8 c d4. e8 d[ c] b4
    c4 b8 a g4 b a2
   } 
}

chrdStrophe = \chordmode {
  a1.:m
  a1:m e2:m
  a1.:m
  a1:m e2:m
  a2:m d1:m
  f2 e1:m
  a2:m d1:m
  f2 c a:m
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
