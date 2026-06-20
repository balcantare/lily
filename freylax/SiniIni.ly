\version "2.24.2"
sheetName = "Sini Ini"
sheetComposer = "Eruption, BoneyM; Hank Hunter, Jack Keller"
\include "../include/book.ily"

sheetTonality = bf
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key g \minor
  \accidentalStyle modern-cautionary
  \bar ".|:"
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #4 A}}
    d8 g8 a8 bf8 a4. g8 |
d8 g8 a8 bf8 a4. g8 |
g8 c8 d8 ef8 d4. c8 |
g8 c8 d8 ef8 d4. c8 | \break
d2. a8 bf8 |
c4 d4 c8 bf8 a8 bf8 |
a2 g2 |
r1 | \break
d8 g8 a8 bf8 a4. g8 |
d8 g8 a8 bf8 a4. g8 |
g8 c8 d8 ef8 d4. c8 |
g8 c8 d8 ef8 d4. c8 |
d8 c8 a8 fs8 d4 a'8 bf8 |
c4 d4 c8 bf8 a8 bf8 |
a2 g2 |
r2 r4 ef'4 | \break
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #4 B}}
\repeat volta 2 
{
f8 f8 f8 f8 f4. ef8 |
ef8 d8 d8 d8~ d2 |
ef8 d8 c8 bf8 a4 bf8 c8 |
d1 |
c8 bf8 a8 g8 fs4. ef'8 |
d4 bf8 g8~ g2 |
a2. bf8 g8 |
a2 r2 r1 |
fs8 fs8 fs8 fs8 fs8 fs4.  }
  \break
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #4 C}}
\repeat volta 2 {
g4 g4 fs8 g8~ g4 |
g4 g4 fs8 g8~ g4 |
c4 c4 b8 c8~ c4 |
c4 c4 b8 c8~ c4 |\break
d4 d4 cs8 d8~ d4 |
a2~ a8 bf4 a8 |
g4 r4 r2 |
r1  }

%\bar "|."
}

chrdStrophe = \chordmode {
  g1:m | s | c:m | s | 
  d:7 | s | g:m | d:7 |
  g:m | s | c:m | s | 
  d:7 | s | g:m | s | 
  f:7 | bf | c2:m d:7 | g1:m | 
  c:m | g:m | a:7 | d:7 | s s  | 
  g:m | s | c:m | s | d:7 | s | 
  g:m | d:7 | 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { | A BB |: A BB CC :| }
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
