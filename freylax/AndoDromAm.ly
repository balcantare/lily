\version "2.24.2"
sheetName = "Ando Drom Am"
sheetComposer = "Ando Drom"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key a \minor
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 A}}
e2 c'2 |
r4 c4 b4 a4 |
g4 a4 b2 |
r4 b4 a4 g4 |\break 
f4 g4 a2 |
r4 a4 g4 f4 |
\once \override Score.RehearsalMark.self-alignment-X = #0
\mark \markup{ \fontsize #2 (!)}
e1~ 
|
e1 \bar "||"
\once \override Score.RehearsalMark.self-alignment-X = -1.2
\mark \markup{ \box{\fontsize #2 AAA}}
s1 | \break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 B}}
\repeat volta 2 {
  e4 a4 c4 a4 |
  r8 e4 a8 c4 a4 |
  e4 a4 c4 a4 |
  r8 e4 a8 c4 a4 |\break
  r4 d4 d4 d4 |
  d4 c4 d4 c4 |
  c4-\prall b2.~ |
b1 | } \break
\once \override Score.RehearsalMark.self-alignment-X = #-2

  \mark \markup{ \box{\fontsize #2 A!A}}
s1 |
\repeat volta 2 {
\once \override Score.RehearsalMark.self-alignment-X = #-1
  \mark \markup{ \box{\fontsize #4 C}}
 s1 
}

e,4 f4 fs4 gs4 |
\bar "|."
}

chrdStrophe = \chordmode {
  a1:m | s1 | g1 | s1 | f1 | s1 | e1 | s1 | s1 | a1:m | s1 | a1:m | s1 | 
  g:7 | s |  e:7 s s s4 e 
}
\bookpart {
  \paper {
    page-count = #1
    system-system-spacing.padding = #6
  }
  \bookItem
  \header{
    subtitle = \markup { A-Rumba B-Swing | AAAA BB AA C |}
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
