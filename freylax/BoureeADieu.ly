\version "2.24.2"
sheetName = "Bourée à Dieu"
sheetComposer = "Wouter Kuyper"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 2/4
  \key a \minor
  \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
  e8. d16 e8 f e d c e 
  a,8. b16 c8 e d b c d \break
  e8. d16 e8 f 
  e d c e
  a,8. b16 c8 e
  d2
  } \break
  \mark \markup{ \box{\fontsize #4 B}}
  \repeat volta 2 {
  a4. b8~ b4 a16 b c d
  c4. d8~ d4 c16 d e f \break
   d4. e8~ e8 e f g
  a8. g16 d8 f
  } \alternative {
    { e8 d c b }
    { <b e>2 }
  }
  \bar "|."
}

chrdStrophe = \chordmode {
a2:m s f g a:m s f g
a4.:m g8 s2 f4. g8 s2 d2:m s f e:m e:m
}



\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \header {
    subtitle = "Bourée in 2 |AABB|"
  }
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }

}
\layout {
  \context {
    \omit SystemStartBar
  } 
 }