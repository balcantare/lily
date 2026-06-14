\version "2.24.2"
sheetName = "Unisono Walzer"
sheetComposer = "trad."
\include "../include/book.ily"

sheetTonality = f
octaveBf = 0

strophe = \relative c' {
  \time 6/8
  \key d \minor
  \accidentalStyle modern-cautionary
  \partial 8*5
    \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #4 A}}
d8 e8 f8 a8 f8 |
e8 d8 e8 f8 a8 d8 |
f8 e8 d8 a8 c8 bf8 |
a2.~ |
a8 d,8 e8 f8 a8 f8 |
e8 d8 e8 f8 a8 d8 |
f8 e8 d8 a8 c8 b8 |
bf2.~ |
bf8 a8 bf8 b8 c8 cs8 |
d4. cs8 e4~ |
e8 d8 e8 d8 e8 d8 |
f4. d8 a4~ |
a8 d8 e8 f8 e8 d8 |
f2. |
e4 d4 f4 |
e2.~ |
e8 \break
d,8[ e8 f8 a8 f8] |
e8 d8 e8 f8 a8 d8 |
f8 e8 d8 a8 c8 bf8 |
a2.~ |
a8 d8 cs8 d8 cs8 d8 |
ef4. d8 cs8 d8 |
bf'2 fs4 |
a8 g8 fs8 g8 d8 bf8 |
g2 \break g'4 |
g8 a8 bf8 g8 a8 bf8 |
g8 a8 bf8 g8 a8 bf8 |
a4 f8 d8 a4~ |
a8 d8 e8 f8 e8 d8 |
f2 e8 d8 |
e4 d4 cs4 |
d2.~ |
d8 r4 \bar "||" \break 
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 B}}
bf'8 bf8 bf8 |
bf2 g8 e8 |
cs4. g'8 g8 a8 |
g4 f2~ |
f4 f4 g4 |
f4 e2~ |
e4 e4 f4 |
e4 d2~ |
d4 r8 \break
bf'8 bf8 bf8 |
bf2 g8 e8 |
cs4. g'8 g8 a8 |
g4 f2~ |
f4 f4 f4 |
a,4. cs8 e8 a,8 |
f'2 e4 |
a,4 cs4 e4 |
a2 \bar "||" \break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 C}}

a,4 |
bf2 a4~ |
a4 e4 g4 |
g2 fs4 |
f2 d'4 |
ef2 d4~ |
d4 a4 c4 |
c2 b4 |
bf2. |
g8 a8 bf8 g8 a8 bf8 |
d8 cs8 e8~ e4 d8 |
f4 d8~ d4 a8 |
f8 d'8 e8 f8 e8 d8 |
f4 e8~ e4 d8 |
e4 d4 cs4 |
d2.~ |
d8 
\bar "|."
}

chrdStrophe = \chordmode {
  s8*5 | d2.:m6 | s2. | s | s2. | 
  s2. | s2. | g:m6 | s2. | 
  a2.:7 | s2. | d2.:m6 | s2. |
  e2.:7 | s2. | a2.:7 | s2. | 
  d2.:m6 | s2. | s2. | s2. | 
  d2.:7 | s2. | g:m6 | s2. |
  s2. | s2. | d:m6 | s2. |
  e:7 | a:7 | d:m6 | s2. | 
  a:7 | s | d:m6 | s2. | a:7 |
  s2. | d:m6 | s2. | a:7 | s |
  d:m6 | s2. | a:7 | s2. | s2. |
  s2. | a:7 | s2. | d:m6 | d:m7 | 
  d:7 | s2. | g:m7 | g:m6 | ef: | 
  s2. | d:m6 | s2. | e:7 | a:7 | 
  d:m6  
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Walzer | A B C | }
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
