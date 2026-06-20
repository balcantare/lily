\version "2.24.2"
sheetName = "Sternennacht"
sheetComposer = "trad."
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key a \minor
  \accidentalStyle modern-cautionary
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 I}}
e'8 e8 e8 e8~ e2 |
f8 f8 f8 f8~ f2 |
  \tuplet 3/2 {g4 g4 g4}   \tuplet 3/2 {g4 f4 g4} |
e4 d4 c4 b4  \break
\repeat volta 2 {
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 A}}
a8. b16 c8 e8~ e2 |
c8. b16 a8 e8~ e2 |
a8. b16 c8 f8~ f2 |
d8. c16 b8 f8~ f2 |
d'8. c16 b8 d8~ d2 |
c8. b16 a8 c8~ c2 |
  \tuplet 3/2 {b4 b4 b4}   \tuplet 3/2 {b4 fs4 a4} |
gs4 f4 e4 d4 | \bar "||" \break
a'8. b16 c8 e8~ e2 |
c8. b16 a8 e8~ e2 |
a8. b16 c8 f8~ f2 |
d8. c16 b8 f8~ f2 |
d'8. c16 b8 d8~ d2 |
c8. b16 a8 c8~ c2 |


  \once \override Score.RehearsalMark.self-alignment-X = #LEFT
  \mark \markup{ \box{\fontsize #2 ..Coda}}
  \tuplet 3/2 {b4 b4 b4}   \tuplet 3/2 {b4 fs4 gs4} |
a4 b4 c4 e4 | \break

\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 B}}

bf'2 a4 g8 e8~ |
e1 |
r8 bf'4. a4 g4 |
e8 g8~ g2. |
af2 g4 f8 af8~ |
af1 |
g2 d4 g8 f8~ |
f1 |
e8 e8 e8 e8~ e2 |
f8 f8 f8 f8~ f2 |
  \tuplet 3/2 {g4 g4 g4}   \tuplet 3/2 {g4 f4 g4} |
e4 d4 c4 b4 |
} \break
  \once \override Score.RehearsalMark.self-alignment-X = #0
  \mark \markup{ \box{\fontsize #2 Coda}}
  \tuplet 3/2 {b4 b4 b4} c4 c4 |
a1 |
  \tuplet 3/2 {b4 b4 b4} c4 c4 |
a1 |
b1 |
c1 |
a1~ |
a1 |
\bar "|."
}

chrdStrophe = \chordmode {
  s1 | s | s | s | 
  a:m | s | d:m | s | 
  e:7 | a:m | b:7 | e:7 | 
  a:m | s | d:m | s | 
  e:7 | a:m | b2:7 e:7 | a1:m |
  g1:m | a1:7 | g1:m | a1:7 | 
  f:m | s | g1:7 | f2:7 e:7 |
  a1:m | d1:m7 | d1:m6 | e1:7 | b2:7 e:7 | a1:m | b2:7 e:7 | a1:m | b1:7 | e1:7 | a1:m | s1 | 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { | I |: A B :| Coda | }
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
