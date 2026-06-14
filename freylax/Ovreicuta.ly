\version "2.24.2"
sheetName = "Ovreicuta"
sheetComposer = "Ansambul Romanesc"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

strophe = \relative c'' {
  \time 4/4
  \key c \major
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #4 A}}
g4 a8 b8 c8 d8 e4 |
d4 c8 b8 c8 d8 e4 |
g,8 g8 a8 b8 c8 d8 e8 b8 |
c8 b8   \tuplet 3/2 {d8 c8 b8} a4 r4 |
g4 a8 b8 c8 d8 e4 |
  \tuplet 3/2 {d8 d8 d8}   \tuplet 3/2 {d8 c8 b8} c8 d8 e4 |
g,8 g8 a8 b8 c8 d8 e8 b8 |
c8 b8   \tuplet 3/2 {d8 c8 b8} a4 r4 \bar "||" |
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 B}}
a'4 e4   \tuplet 3/2 {ds8 ds8 e8} f8 e8 |
a4 e4   \tuplet 3/2 {ds8 ds8 c8}   \tuplet 3/2 {c8 b8 a8} |
a'4 e4   \tuplet 3/2 {ds8 ds8 e8} f8 e8 |
ds8 e8 fs8 gs8 a4 r4 |
a4 e4   \tuplet 3/2 {ds8 ds8 e8} f8 e8 |
a4 e4   \tuplet 3/2 {ds8 ds8 c8}   \tuplet 3/2 {c8 b8 a8} |
a'4 e4   \tuplet 3/2 {ds8 ds8 e8} f8 e8 |
ds8 e8 fs8 gs8 a4 r4 |
\once \override Score.RehearsalMark.self-alignment-X = #-2
\mark \markup{ \box{\fontsize #4 A}}
 \bar "||" s1 \bar "||" \break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 C}}
ds,8 e8 fs8 e8 ds8 c8 b8 a8 |
ds8 e8 fs8 ds8 e4 a4 |
ds,8 e8 fs8 e8 ds8 c8 b8 a8 |
c4 gs4 a4 r4 |
ds8 e8 fs8 e8 ds8 c8 b8 a8 |
ds8 e8 fs8 ds8 e4 a4 |
ds,8 e8 fs8 e8 ds8 c8 b8 a8 |
c4 gs4 a4 r4 |
\bar "|."
}

chrdStrophe = \chordmode {
  g2:7 c | g:7 c | g:7 c | e2:7 a4:m d4:7 |
  g2:7 c | g:7 c | g:7 c | e2:7 a2:m |
  a1:m | s1 | s1 | e2:7 a2:m |
  a1:m | s1 | s1 | e2:7 a4:m d:7 | s1 
  a1:m | s1 | s1 | e2:7 a2:m |
  a1:m | s1 | s1 | e2:7 a4:m d4:7 | 
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
