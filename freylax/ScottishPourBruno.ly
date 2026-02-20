\version "2.24.2"
sheetComposer = "Wouter Kuyper"
sheetName = "Scottish pour Bruno"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 4/4
  \key a \minor
  \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
  e4 a,8 b a g e g~
  g e g e c' b a g
  a4 a8 b c d e g,~
  g g c d e d c4
  e4 a,8 b a g e g~
  g e g e c' b a g
  a4 a8 b c d e b~
  }
  \alternative {
    {b4 b b2}
    {b1}
  }
  \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
    a4 a8 b a g e d'~
    4 8 c a2
    b4 b8 c d c b a~
    a4 a8 g e c' b g
    a4 a8 b a g e d'~
    4 8 c a2
    b4 b8 c b a g a~
    a1
  } 
  %\bar "|."
}

chrdStrophe = \chordmode {
  a1:m c f c a:m c f g2 e:m g1
  a:m d g a:m a:m d g a:m
}

\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \header{
    subtitle = "Scottish |AABB|"
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
}
  
