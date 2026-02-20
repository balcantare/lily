\version "2.22.2"
sheetName = "Dubbele"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 2/4
  \key c \major
  \bar ".|:"
  \mark \markup{ \box{\fontsize #4 A}}
  \repeat volta 2 {
     c8 b c d
     e4 e8  e
     e d c b  a2
     f'8 e  d c
     b a b c
     d e f d
     e4 c
     c8 b c d
     e4 e8  e
     e d c b  a2
     f'8 e  d c
     b a b c
     d e f d
     c2
  } \break
  
    \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
    c4 b
    a4 a8 a
    a g a b
    a4. a8
    a g  a b
    c4. f8
    e8 d c e
    d2
    c4 b
    a4 a8 a
    a g a b
    a4. a8
    a g  a b
    c4. g'8
    f8 e d b
    c2 }
}

chrdStrophe = \chordmode {
  s2
  c2 e:m f s g s c s
  c e:m f s g s c
  c4 g a2:m s f s
  c s g
  c4 g a2:m s f s
  c g c
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
    \layout {#(layout-set-staff-size-with-jazz 24)}
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
