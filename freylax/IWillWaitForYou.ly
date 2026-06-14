\version "2.24.2"
sheetName = "I Will Wait For You"
sheetComposer = " Michel Legrand / Norman Gimbel"
\include "../include/book.ily"

sheetTonality = f
octaveBf = 0

strophe = \relative c'' {
  \time 4/4
  \key d \minor
  \accidentalStyle modern-cautionary
  \mark \markup{ \box{\fontsize #4 A}}
\repeat volta 2 {
\partial 2
gs4 a4 |
g2 f2 |
e4 d4 cs'4 d4 |
c2 bf2 |
bf2 \break fs4 g4 |
f2 e2 |
d4 c4 b'4 c4 |
bf2 a2 |
a2 \break gs4 a4 |
g2 f2 |
e4 d4 cs'4 d4 |
c2 bf2 |
bf2 \break a4 g4 |
a4 d4 d,2 |
e4 a4 a,2 |
d1 
}
\alternative {
  { r2  }
  { d2\repeatTie r4 r8 }  
}
 \break bf'8
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
c8 c8 bf8 bf8 c8 c8 bf4 |
d4 c8 bf8~ bf4. a8 |
bf8 bf8 a8 a8 bf8 bf8 a8 a8 |
c4 bf8 a8~ a4. \break g8 |
a8 a8 g8 g8 a8 a8 g8 g8 |
  }
  \alternative {
    {bf4 a8 g8~ g2 |
     f1 |
     r8 d e f fs g af bf } 
    {\break bf4 a8 g~ g2 
     f2 r8 e8 f g 
     e2 }
  }
\bar "|."
}

chrdStrophe = \chordmode {
  s2 | d1:m | s1 | g1:m7 | s1 | c1:7 | 
  s1 | f1 | a1:7 | d1:m |
  s1 | g1:m7 | s1 | d1:m | a1:7 | d:m | 
  s2  d1:7 | g1:m7 | c1:7 | f1:7+ | bf1:7+ | 
  e1:m5-7 | a:7 d:m d:7 
  e:m5-7 a:7 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Swing |AA BB|}
  }
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 24)
    }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
