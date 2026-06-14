\version "2.24.2"
sheetName = "Only You"
sheetComposer = "Buck Ram and Andre Rand"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

lyr = {
  \lyricmode {  
  On -- ly you can make this world seem right
  On -- ly you can make the dark -- ness bright
  On -- ly you and you a -- lone
  Can thrill me like you do
  And _ fill my heart with love for on -- ly you

  On -- ly you can make this change in me
  For it's true, you are my des -- ti -- ny
  When you hold my hand
  I un -- der -- stand the ma -- gic that you do
  You're my dream come true
  My one_and on -- ly you
  }
}

strophe = \relative c' {
  \time 4/4
  \key c \major
  \partial 2
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 A}}
fs4 g4 |
e'1~ |
e4 g,4 c4 e4 |
d4 b8 gs8~ 2~ |
2 \break e'4 d4 |
c1~ |
c4 e,4 a4 c4 |
bf4 g8 e8~ e2~ |
e2 \break 
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 B}}
f4 g4 |
a4 f4 a4 c4 |
b2. g4 |
e'4 e4 d4 d4 |
c2. \break b8 c8 |
d4 c4 c4 b4 |
a4 a4 c4 e4 |
d1~ |
d2 \break 
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 A}}
fs,4 g4 |
e'1~ |
e4 g,4 c4 e4 |
d4 b8 gs8~ gs2~ |
gs2 \break e'4 d4 |
c1~ |
c4 e,4 a4 c4 |
bf4 g8 e8~ e2~ |
e2 \break 
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 B'}}
f4 g4 |
a4 f4 a4 c4 |
e4 d4 c4 a4 |
fs4 g4 c4 d4 |
e2 \break a,4 g4 |
fs4 e'4 e4 e4 |
d4 e2 d4 |
c1~ |
c2  
\bar "|."
}

chrdStrophe = \chordmode {
  s2 | c1:6 | s1 | e1:7 | s1 | 
  a1:m7 | s1 | c1:7 | s1 | 
  f1:6 | g1:7 | c1:6 e1:7 | 
  a1:m7 | d1:7 | s1 | g1:7  | 
  c1:6 | s1 | e1:7 | s1 | 
  a1:m7 | s1 | c1:7 | s1 | 
  f1:6 | g1:7 | c2:6 e2:7 | a1:7 |
  d1:7 | g1:7 | c2:6 f2:6 | c2:6  
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Swing | A B A B' | }
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
     \new Lyrics \lyricsto "Strophe" \lyr
    >>
  }
}
