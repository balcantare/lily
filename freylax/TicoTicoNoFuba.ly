\version "2.24.2"
sheetName = "Tico Tico no Fub'a"
sheetComposer = "Zequinha de Abreu"
\include "../include/book.ily"

sheetTonality = a
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key a \minor
  \accidentalStyle modern-cautionary
  \partial 2
  \repeat volta 2 {
    \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #4 A}}
r8 e ds e
f8 e4 a8~ 8 e8 ds8 e8 |
f8 e4 gs8~ 8 e8 ds8 e8 |
f8 e8 d'8 b8 gs8 e8 d8 df8 |
c2~ c8 a'8 af8 g8 |
f8 a4 d8~ 8 c8 a8 f8 |
e8 a4 c8~ 8 c8 b8 as8 |
b8 b,8 ds8 fs8 a8 c8 b8 a8 |
gs8 e4 b'8 r8 e,8 ds8 e8 |
f8 e4 a8~ 8 e8 ds8 e8 |
f8 e4 gs8~ 8 e8 ds8 e8 |
f8 e8 d'8 b8 gs8 e8 d8 df8 |
c2~ c8 a'8 af8 g8 |
f8 a4 d8~ 8 c8 a8 f8 |
e8 a4 c8~ 8 c8 b8 as8 |
b8 e,8 gs8 b8 e8 d8 c8 b8 |
a2  } \break
  \repeat volta 2 {
    \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #4 B}}
r8 b8 a af
g c, e g c, e g gs |
a4 f8 f8 r8 b8 a8 af8 |
g8 b,8 d8 f8 b,8 d8 f8 g8 |
a4 e8 e8 r8 c'8 c8 c8 |
c8 b8 b8 b8~ 8 a8 a8 a8 |
a8 f8 f8 f8~ 8 b8 b8 b8 |
b8 g8 g8 b8 a8 f8 f8 b8 |
g2~ g8 b8 a8 af8 |
g8 c,8 e8 g8 c,8 e8 g8 gs8 |
a4 f8 f8 r8 b8 a8 af8 |
g8 b,8 d8 f8 b,8 d8 f8 g8 |
a4 e8 e8 r8 c'8 b8 bf8 |
a8 gs8 a8 b8 d8 c8 b8 a8 |
e'8 g,8 c8 e8 g8 gf8 f8 e8 |
d8 c8 b8 a8 g8 f8 e8 d8 |
c4 r4  }
\once \override Score.RehearsalMark.self-alignment-X = #-2
\mark \markup{ \box{\fontsize #4 A}}
  s2
  \break
  \key a \major
  \repeat volta 2 {
    \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #4 C}}
  \partial 2
r8 a'8 cs8 e8 |
a8 a,8 cs8 gs'8~ gs8 a,8 cs8 fs8 |
fs8 a,8 cs8 e8~ 8 a,8 cs8 fs8 |
fs8 a,8 cs8 e8~ 8 a,8 cs8 fs8 |
fs8 b,8 d8 e8~ 8 d8 e8 fs8 |
a8 d,8 e8 gs8~ 8 d8 e8 fs8 |
fs8 b,8 d8 e8~ 8 d8 e8 fs8 |
a8 d,8 e8 gs8~ 8 d8 e8 fs8 |
fs8 a,8 cs8 e8~ 8 a,8 cs8 e8 |
a8 a,8 cs8 gs'8~ gs8 a,8 cs8 fs8 |
fs8 a,8 cs8 e8~ 8 a,8 cs8 e8 |
fs8 e8 cs8 as8 fs'8 e8 cs8 as8 |
b8 as8 b8 cs8 d8 r8 r4 |
d,8 cs8 d8 e8 fs8 gs8 a8 b8 |
cs8 d8 ds8 e8 fs8 e8 d8 cs8 |
b8 a8 gs8 fs8 e8 d8 cs8 b8 |
a4 r4  }
%\bar "|."
}

chrdStrophe = \chordmode {
  s2 
  a1:m6 | e1:7  | s1 | a1:m6 | 
  d1:m6 | a1:m6 | b1:7 | e1:7 | 
  a1:m6 | e1:7  | s1 | a1:m6 | 
  d1:m6 | a1:m6 | e1:7 | a1:m6 | 
  c1:6 | g1:7 | s1 | c1:6 |
  s1 | g1:7 | s1 | c1:6 | 
  c1 | g1:7 | s1 | c1:6 | 
  f2:6 fs2:dim | c2:6 a2:7 | d2:m7 g2:7 
  | c2:6  s2 e2:7 | a1:6 | s1 | s1 |
  e1:7 | s1 | s1 | s1 | 
  a1:6 | s1 | s1 | fs1:7 | 
  b1:m7 | b2:m7 e2:7 | a2:6 fs2:7 
  | b2:m7 e2:7   a2:6  
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Choro | AA BB A(A) CC |}
  }
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 22)
    }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
