\version "2.24.2"
sheetName = "Lulu Swing"
sheetComposer = "Lulu Reinhardt"
\include "../include/book.ily"

sheetTonality = d
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key d \major
  \accidentalStyle modern-cautionary

\language "english"
  \partial 1
  \mark \markup{ \box{\fontsize #4 I}}
fs'4. fs8 fs8 fs4. |
f8 f4. r4 f4 |
fs4. fs8 fs8 fs4. 
f2 r8 \bar "||" \break a,8 b8 d8 |
fs8 es8 fs8 a,8 r2 |
r8 a8 b8 d8 fs8 a,8 b8 d8 |
fs8 es8 fs8 gs,8 r2 |
r8 a8 b8 d8 fs8 a,8 b8 d8 |
fs8 es8 fs8 g,8 r2 |
r4 fs'8 a8 fs8 a,8 b4 |
d4 b'8 bf8 a4 a8 gs8 |
g4 g8 fs8 e4 f4 |\break 
fs8 es8 fs8 a,8 r2 |
r8 a8 b8 d8 fs8 a,8 b8 d8 |
fs8 es8 fs8 gs,8 r2 |
r8 a8 b8 d8 fs8 a,8 b8 d8 |
fs8 es8 fs8 g,8 r2 |
r4 fs'8 a8 fs8 a,8 b4 |
d4 r4 r2 |
r1 \bar "||" |\break  
  \mark \markup{ \box{\fontsize #4 B}}
s1*8  | \break
  \mark \markup{ \box{\fontsize #4 A}}
fs8 es8 fs8 a,8 r2 |
r8 a8 b8 d8 fs8 a,8 b8 d8 |
fs8 es8 fs8 gs,8 r2 |
r8 a8 b8 d8 fs8 a,8 b8 d8 |
fs8 es8 fs8 g,8 r2 |
r4 fs'8 a8 fs8 a,8 b4 |
d4 r4 r2 |
r1 |
\bar "|."
}

chrdStrophe = \chordmode {
  %d1:6 | d1d:/A | d1:6 | d1d:/A | d1:6 | s1 | e1:7 | s1 | a1:7 | s1 | d1:6 | -1:1A7 | s2. | s1 | d1:6 | s1 | e1:7 | s1 | a1:7 | s1 | d1:6 | d1:7 | g1:6 | s1 | d1:6 | s1 | e1:7 | s1 | a1:7 | s1 | d1:6 | s1 | e1:7 | s1 | a1:7 | s1 | d1:6 | s1 | 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Swing I |AA B A|}
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
