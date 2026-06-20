\version "2.24.2"
sheetName = "Marina"
sheetComposer = "Rocco Granata / deutscher Text: Axel Weingarten"
\include "../include/book.ily"

sheetTonality = g
octaveBf = 0

strophe = \relative c' {
  \time 2/4
  \key g \major
\language "english"
  \partial 8
  \bar ".|:"
  \repeat volta 2 {
    \once\override Score.RehearsalMark.self-alignment-X = #2
    \mark \markup{ \box{\fontsize #4 A}}
d8 |
b'8 g8 b8 g8 |
b8 g8 b8 g8 |
b8 g4.~ |
g4. d8 |
b'8 g8 b8 g8 |
b8 g8 b8 g8 |
a8 fs4.~ |
fs4. d8 |
c'8 a8 c8 a8 |
c8 a8 c8 a8 |
c8 a4.~ |
a4. d8 |
d8 e8 c8 d8 |
b8 c8 a8 b8 |
g2~ |
g4.  }  \break
    \once\override Score.RehearsalMark.self-alignment-X = #2
    \mark \markup{ \box{\fontsize #4 B}}
b8 |
b4 d8 g,8 |
g4 b8 c8 |
b4 a4~ |
a4. d8 |
d4 e8 c8 |
d4 b8 a8 |
g2~ |
g4. \break b8 |
b4 d8 g,8 |
g4 b8 c8 |
b4 a4~ |
a4. d8 |
d4 e8 c8 |
d4 b8 a8 |
g4. \break
    \once\override Score.RehearsalMark.self-alignment-X = #2
    \mark \markup{ \box{\fontsize #4 C}}
b8 |
b8 c8 b8 c8 |
d4 c8 d8~ |
d8 c8 d8 c8 |
b4 g8 b8 |
c8 b8 c8 b8 |
a4 fs8 b8~ |
b8 a8 fs8 a8 |
g4. \break b8 |
b8 c8 b8 c8 |
d4 c8 d8~ |
d8 c8 d8 c8 |
b4 g8 b8 |
c8 b8 c8 b8 |
a4 fs8 b8~ |
b8 a8 fs8 a8 |
g4. 
\bar "|."
}

chrdStrophe = \chordmode {
  s8 | 
  g2 | s2*5 | d2 | s2*7 |
  g2 | s2 |
  g2 s d s s s g s g s d s s s g 
  s d s g s d s g s d s g s d s g4. 
}
\bookpart {
  \paper {
    page-count = #1
    system-system-spacing.padding = #6
  }
  \bookItem
  \header{
    subtitle = \markup { | A A B C | }
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
