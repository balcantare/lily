\version "2.24.2"
sheetName = "Kriebels"
sheetComposer = "Wouter Kuyper"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 2/4
  \key a \minor
  \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
  a4 e' d4. c8 b8. g16 b8 c d b c b \break
  a4 e' d4. c8 b8. a16 b8 c b2
  } \break
  \mark \markup{ \box{\fontsize #4 B}}
  \repeat volta 2 {
  a4 e8 b'~ 8 e, c'4~ 8 a b c
  d c b c \break
  a4 e8 b'~ 8 e, c'4~ 8 c d e
  b2
  } 
}

chrdStrophe = \chordmode {
a2:m s e:m s a:m s e:m s
a4.:m g8 s4 f4 s2 s2
a4.:m g8 s4 f4 s2 e:m
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
    \layout {
      #(layout-set-staff-size-with-jazz 24)
      \context {
        \omit SystemStartBar
      } 
    }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
