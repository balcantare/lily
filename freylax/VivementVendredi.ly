\version "2.24.2"
sheetName = "Vivement Vendredi"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

strophe = \relative c'' {
  \time 4/4
  \key a \minor
  \bar ".|:"
  \partial 2
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
  \parenthesize a2 
  a,8 c e g a b c d
  d e d c b d c b 
  a c b a g4. a8
  b16 c d8 c a b g e g
  a,8 c e g a b c d
  d e d c b d c b 
  a c b a g a b g  
  a4 g8 b
  } \break
  \mark \markup{ \box{\fontsize #4 B}}
  \repeat volta 2 {
    a8 b c d
    d e e d e d b c
    d4 d8 e d b a g
    e8 a a4 f8 a c d
    d8 e d c b c d g,
    e'4 e8 d e d b c
    d4 d8 e d b a g
    e8 a a4 f8 a f' e
    d g b, g
  } 
}

chrdStrophe = \chordmode {
  s2
  a1:m
  f2 g
  a:m e:m
  g1
  a:m
  f2 g
  a:m g a:m s
  c1 g
  a2:m f c g c1 g a2:m f g
}

\bookpart {
  \paper {
    page-count = #1
    system-system-spacing.padding = #8
  }
  \bookItem
  \header {
    subtitle = "|AABB|"
  }
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 24)
      \context {
        \omit SystemStartBar
      } 
    }
    <<
    \new ChordNames \doTranspose \chrdStrophe 
    \new Staff <<
      \new Voice = "Strophe" \doTranspose \strophe 
      >>
    >>
  }
}
