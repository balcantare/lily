\version "2.24.2"
sheetName = "Neuer Swing (So what's new)"
sheetComposer = "Lois Armstrong"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

strophe = \relative c'' {
  \time 4/4
  \key c \major
  \accidentalStyle modern-cautionary
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #1 Intro}}
  g4 gs4 a4 r4 |
  g4 gs4 a8 a gs4 |
  g4 gs4 a4 r4 |
  g4 gs4 a8 a gs4 |\break
\repeat volta 2 {
  
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #2 A}}
  g4 gs4 a4 gs8 g8~ |
  g4 r4 r4 r8 gs8 |
a4 as4 b4 as8 a8~ |
a4 r4 r2 | \break
r4 c2 a4 |
g4 f4 e4 d8 g8~ |
g4 r4 r2 |
r1 |\break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 A}}
g4 gs4 a4 gs8 g8~ |
g4 r4 r4 r8 gs8 |
a4 as4 b4 as8 a8~ |
a4 r4 r2 | \break
r4 c2 a4 |
g4 f4 e4 d8 c8~ |
c4 r4 r2 |
r1 | \break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 B}}
c'4 cs4 d4 r4 |
c4 cs8 d8~ 8 cs8 d8 r8 |
r4 e4. ds8 d4 |
c4. a8 r2 | \break
r4 e'4~ e8 ds8 d4 |
c4. a8 b4 c4 |
e8 d4 c8 b4 a4 |
r2 gs2 | \break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 A}}
g4 gs4 a4 gs8 g8~ |
g4 r4 r4 r8 gs8 |
a4 as4 b4 as8 a8~ |
a4 r4 r2 
\once \override Score.RehearsalMark.self-alignment-X =
    #RIGHT
\once \override Score.RehearsalMark.break-visibility =
    #end-of-line-visible
\mark \markup{ \box{\fontsize #1 ..Coda}}
| 
  \break
r4 c2 a4 |
g4 f4 e4 d8 c8~ |
c4 r4 r2 |
r1 } \break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #1 Coda}}
r4 c'2 a4 |
g4 f4 e8 d8 r4 |
r4 d'2 b4 |
a4 g4 f8 e8 r4 |\break
f2 fs2 |
g4 c2 a4 |
f2 fs2 |
g4 c2 a4 |\break
f2 fs2 |
g2 a2 |
e'8 d4 c8 b4 c4 |
r4 g4 c4 r4 |
\bar "|."
}

chrdStrophe = \chordmode {
  c1:6 s1*3 
  c1:6 | s1 | a1:7 | s1 | 
  d1:m7 | g1:7 | c1:6 | g1:7 |
  c1:6 | s1 | a1:7 | s1 |
  d1:m7 | g1:7 | c1:6 | c1:7 |
  f1:6 | f1:m6 | e1:7 | a1:m7 |
  d1:7 | s1 | g1:7 | s1 | c1:6 |
  s1 | a1:7 | s d1:m7 |
  g1:7 | c1:6 | \parenthesize g:7 |
  d1:m7 |  g1:7 | e1:m7 | a1:7 | 
  d2:m7 ef:dim | e:m7 a:7 | 
  d2:m7 ef:dim | e:m7 a:7 | 
  d2:m7 ef:dim | e:m7 a:7 | 
  d2:7 g4:7 c:6  s4 g4:7 c4:6  
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup {Swing | Intro |: A A B A :| Coda | }
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
