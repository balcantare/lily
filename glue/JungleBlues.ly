\version "2.24.4"
sheetName = "Jungle Blues"
sheetComposer = "Dirk Reuter"
\include "../include/book.ily"

strophe = \relative b {
  \clef "treble" 
  \time 4/4 
  \accidentalStyle modern-voice-cautionary
  \key c \major | % 1
   \mark \markup{ \bold {Swing} }
  \tempo 2=78
     b8   c8
   d8  b8  c8  ef8  d8  c8 | % 2
   d8  ds8  f8  fs8 ~ -.  fs8
   a8  af8  fs8 | % 3
   gs8  a8  af8  f8  fs4 -. 
  d8  c8 ~ -. | % 4
   c8  c8  b8  a8 ~ -.  a4 r4 | % 5
   e'8 f8  g8  e8  f8
   af8  g8  f8 | % 6
   g8  gs8  bf8  b8 ~ -.  b8
   d8  df8  b8 | % 7
   cs8  d8  df8  bf8  b4
  -.  g8  f8 ~ -. | % 8
   f8  f8  e8  d8 ~ -.  d4 r4 | % 9
   b8 c8  d8  b8  c8
   ef8  d8  c8 | % #10
   d8  ds8  f8  fs8 ~ -.  fs8
   a8  af8  fs8 | % 11
   gs8  a8  af8  f8  fs4 -. 
  d8  c8 ~ -. | % 12
   c8  c8  b8  a8 ~ -.  a4 r4 | % 13
   fs'8 g8  a8  fs8  g8
   bf8  a8  g8 | % 14
   a8  as8  c8  cs8 ~ -. 
  cs4 r4 | % 15
   e,8 f8  g8  e8  f8
   af8  g8  f8 | % 16
   g8  gs8  bf8  b8 ~ -.  b4 r4 | % 17
   b,8  c8  d8  b8  c8
   ef8  d8  c8 | % 18
   d8  ds8  f8  fs8 ~ -.  fs8
   a8  af8  fs8 | % 19
   gs8  a8  af8  f8  fs4 -. 
  d8  c8 -. | % #20
  R1 \bar "|."
}

bass =  \relative d {
  \clef "bass" 
  \time 4/4 
  \accidentalStyle modern-voice-cautionary
  \key c \major | % 1
   d8  d8 -. r4 r4 r8  ef8 -. | % 2
  r8  d8 -. r4  b4 -.  c4 -. | % 3
   d8  d8 -. r4 r4  ef8  d8 -. | % 4
  R1 | % 5
   g,8  g8 -. r4 r4 r8  af8 -. | % 6
  r8  g8 -. r4  e4 -.  f4 -. | % 7
   g8  g8 -. r4 r4  af8  g8 -. | % 8
  R1 | % 9
   d'8  d8 -. r4 r4 r8  ef8 -. |
  % #10
  r8  d8 -. r4  b4 -.  c4 -. | % 11
   d8  d8 -. r4 r4  ef8  d8 -. | % 12
  R1 | % 13
   a8  a8 -. r4 r4 r8  bf8 -. | % 14
  r8  a8 -. r4 r4  fs4 | % 15
   g8  g8 -. r4 r4 r8  af8 -. | % 16
  r8  g8 -. r4  b4 -.  c4 -. | % 17
   d8  d8 -. r4 r4 r8  ef8 -. | % 18
  r8  d8 -. r4  b4 -.  c4 -. | % 19
   d8  d8 -. r4 r4  ef8  d8 -. |
  R1 \bar "|."
}
chrdStrophe = \chordmode { 
  d1:7.9+ s s s 
  g:7.9+ s s s
  d:7.9+ s s s
  a:7.9+ s g:7.9+ s
  d:7.9+ s s s
}


\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    \layout {#(layout-set-staff-size-with-jazz 24)}
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Staff <<
      \new Voice = "Bass" {\bass}   
      >>
    >>
  }
}