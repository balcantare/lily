\version "2.24.2"
sheetName = "Andro uit Hanterdroom"
sheetComposer = "Wouter Kuyper"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 4/4
  \key a \minor
  \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
  a4 e'8 a, a e' e a,
  c4 d b8 c b g
  a4 e'8 a, a e' e a,
  c4 d b2
  } \break
  \mark \markup{ \box{\fontsize #4 B}}
  \repeat volta 2 {
   c4. c8 b8 a g4
   a4 e g \tuplet 3/2 {e8 g a}
   c4. c8  b8 a g4
   a8 e c' b a2
   } \break
   \mark \markup{ \box{\fontsize #4 C}}
   e'4. e8 d c b4~
   b2. a8 b
   c4. c8 b a g4~
   g2~ g8 a b c \break
   e4. e8 d c b4~
   b2. a8 b
   c4. c8 b a g4
   a8 e c' b a2
   \bar "|."
}

chrdStrophe = \chordmode {
  a1:m d2:m e:m a1:m d2:m e:m
  a1:m e:m a:m e2:m a:m
  a1:m e:m a:m e2:m a:m
  a1:m e:m a:m e2:m a:m
  
}



\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \header {
    subtitle = "Andro |AABBC|"
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
