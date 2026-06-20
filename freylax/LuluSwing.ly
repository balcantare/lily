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
  \mark \markup{ \box{\fontsize #4 I}}
fs'4. fs8 fs8 fs4. |
f8 f4. r4 f4 |
fs4. fs8 fs8 fs4. 
f2 r8 \bar "||" \break 
    \once\override Score.RehearsalMark.self-alignment-X = #2
\mark \markup{ \box{\fontsize #4 A}}
a,8 b8 d8 |
fs8 es8 fs8 a,8 r2 |
r8 a8 b8 d8 fs8 a,8 b8 d8 |
fs8 es8 fs8 gs,8 r2 |
r8 a8 b8 d8 fs8 a,8 b8 d8 |
fs8 es8 fs8 g,8 r2 |
r4 fs'8 a8 fs8 a,8 b4 |
d4 b'8 bf8 a4 a8 gs8 |
g4 g8 fs8 e4 f4 |\break 
    \once\override Score.RehearsalMark.self-alignment-X = #2
\mark \markup{ \box{\fontsize #4 A}}
fs8 es8 fs8 a,8 r2 |
r8 a8 b8 d8 fs8 a,8 b8 d8 |
fs8 es8 fs8 gs,8 r2 |
r8 a8 b8 d8 fs8 a,8 b8 d8 |
fs8 es8 fs8 g,8 r2 |
r4 fs'8 a8 fs8 a,8 b4 |
d4 r4 r2 |
r1 \bar "||" |\break  
    \once\override Score.RehearsalMark.self-alignment-X = #2
  \mark \markup{ \box{\fontsize #4 B}}
s1*8  | \break
    \once\override Score.RehearsalMark.self-alignment-X = #2
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
  d1 a:5+7 m d a:5+7
  d1:6 s e:7 s 
  e:m7 a:7 d2 b:m7 e:m7 a:7
  d1:6 s e:7 s
  e:m7 a:7 d1 d:7
  g1 gs:dim d s
  e:7 s ef:7 a:7
  d1:6 s e:7 s
  e:m7 a:7 d e2:m7 a:7
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
