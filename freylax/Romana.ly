\version "2.24.2"
sheetName = "Romana"
sheetComposer = "Ansambul Romanesc"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key a \major
    \accidentalStyle modern-cautionary
  \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
cs'4 cs4~ cs8 a8 b8 cs8 |
d4 d4~ d8 cs8 b8 a8 |
cs4 cs4~ cs8 a8 cs8 d8 |
e4 r4 e4 r4 |
cs4 cs4~ cs8 a8 b8 cs8 |
d4 d4~ d8 cs8 b8 a8 |
gs4 gs4~ gs8 e8 fs8 gs8 |
a4 r4 a4 r4  }
\break
  \repeat volta 2 {
\key a \minor
\mark \markup{ \box{\fontsize #4 B}}
a8 gs8 a8 b8 c8 b8 a8 e8 |
a8 gs8 a8 b8 c8 b8 a8 e8 |
a8 gs8 a8 b8 c8 b8 d8 c8 |
b4 r4 b4 r4 |
a8 gs8 a8 b8 c8 b8 a8 e8 |
a8 gs8 a8 b8 c8 b8 a8 e8 |
gs4 gs4~ gs8 e8 fs8 gs8 |
a4 r4 a4 r4  }|
|\once \override Score.RehearsalMark.self-alignment-X = #-2
\mark \markup{ \box{\fontsize #4 A}}
  s1 \break

  \key a \minor
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 C}}
e'8 ds8 e8 fs8 g8 fs8 g8 gs8 |
a8 g8 fs8 e8 ds8 c8 b8 a8 |
a'8 g8 fs8 e8 ds8 c8 b8 a8 |
b4 r4 b4 r4 |
e8 ds8 e8 fs8 g8 fs8 g8 gs8 |
a8 g8 fs8 e8 ds8 c8 b8 a8 |
a'8 g8 fs8 e8 ds8 c8 b8 c8 |
a4 r4 a4 r4  }|
|
%\bar "|."
}

chrdStrophe = \chordmode {
  a1 | d1 | a1 | e1:7 | 
  a1 | d1 | e1 | a1 | 
  a1:m | s1 | s1 | e1:7 | 
  a1:m | f1 | e1 | a1:m | 
  s1 a1:m | s1 | s1 | e1 | 
  a1:m | f1 | e1 | a1:m | 
}
\bookpart {
  \paper {
    page-count = #1
    system-system-spacing.padding = #6
  }
  \bookItem
  \header{
    subtitle = \markup { | A B A C | }
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
