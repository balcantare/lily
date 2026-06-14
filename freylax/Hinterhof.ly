\version "2.24.2"
sheetName = "Hinterhof"
sheetComposer = ""
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key a \minor
  \accidentalStyle modern-cautionary
  \partial 8
    \mark \markup{ \box{\fontsize #4 A}}
ds'8 |
e4 e8 e8 f4 e8 c8~ |
c8 a8 r4 r4. ds8 |
e8 e4 e8 f4 e8 d8~ |
d4 r4 r4. \break c8 |
cs8 d8 d8 d8 e4 d8 b8~ |
b8 gs8 r4 r4. ds'8 |
e4 e8 f8 e4 b8 c8~ |
c4 r4 a8 b8 c8 d8 |
ds8 e8 e8 e8 f4 e8 c8~ |
c8 a8 r4 r4. e'8 |
a4 a8 g8 f4 e8 d8~ |
d4 r4 r4. \break c8 |
cs8 d8 d8 d8 e4 d8 b8~ |
b8 gs8 r4 r4. ds'8 |
e4 e8 f8 e4 gs,8 a8~ |
a4 r4 a8 b8 c8 e8 |
    \mark \markup{ \box{\fontsize #4 B}}
a4. g8~ 8 f4 e8 |
f4 e8 d8~ d4 r8 d8 |
g4 g8 f8 e4 d8 ds8 |
e8 d4 c8~ c4 r8 \break ds8 |
e8 e4 e8 f4 e8 d8~ |
d8 b8~ b4 r4. e8 |
e8 e4 f8 e4 b8 c8~ |
c4 r4 a8 b8 c8 e8 |\break
a8 a4 g8 f4 e4 |
f8 e4 d8~ d4 r8 d8 |
g8 g4 f8 e4 d8 ds8 |
e8 d4 c8~ c4 r8 \break ds8 |
e8 e4 e8 f4 e8 d8~ |
d8 b8~ b4 r4. e8 |
e8 e4 f8 e4 gs,8 a8~ |
a4 r2. |
\bar "||"
\once\override Score.RehearsalMark.self-alignment-X = #-1
\mark \markup{ \box{\fontsize #2 Impro}}
s1
\bar "|."
}

chrdStrophe = \chordmode {
  s8 | a1:m | s1*2 | e1:7 | s1*3 | a1:m |
  s1*3 | e1:7 | s1*3 |
  a1:m | a1:7 | d1:m | s1 
  | a1:m | s1 | e1:7 | s1 | a1:m | a1:7 | d1:m | s1 | a1:m | s1 | e1:7 | s1 | a1:m |a:m 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Cumbria? |A B Impro| }
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
