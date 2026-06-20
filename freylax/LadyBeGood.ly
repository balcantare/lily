\version "2.24.2"
sheetName = "Lady be good!"
sheetComposer = "George and Ira Gershwin"
\include "../include/book.ily"

sheetTonality = g
octaveBf = 0

strophe = \relative c'' {
  \time 4/4
  \key g \major
 \accidentalStyle modern-cautionary
  \partial 2.
 
    \once\override Score.RehearsalMark.self-alignment-X = #2
\mark \markup{ \box{\fontsize #4 A}}
b4 c4 cs4 |
d2 c4 b | d2 d
  \tuplet 3/2 {d4 b4 g4} d2~ |
d2 e'2 | \break
  \tuplet 3/2 {d4 c4 a4} d,2~ |
d2 b'2 |
g1 |
r1 \bar "||" |\break
    \once\override Score.RehearsalMark.self-alignment-X = #2
\mark \markup{ \box{\fontsize #4 A}}
d'2 c4 b | d2 d
  \tuplet 3/2 {d4 b4 g4} d2~ |
d2 e'2 |
\break
  \tuplet 3/2 {d4 c4 a4} d,2~ |
d2 b'2 |
g1~ |
g1 |
\bar "||" \break
    \once\override Score.RehearsalMark.self-alignment-X = #2
\mark \markup{ \box{\fontsize #4 B}}
e'1
r4 e4 e e
e4. d8~ d2~
d1 \break
r4 b b b
b b b b
b4. a8~ a2 
r4 b8 b c c cs4 \bar "||"
\break 
    \once\override Score.RehearsalMark.self-alignment-X = #2
\mark \markup{ \box{\fontsize #4 A}}
d2 c4 b | d2 d
  \tuplet 3/2 {d4 b4 g4} d2~ |
d2 e'2 |\break
  \tuplet 3/2 {d4 c4 a4} d,2~ |
d2 b'2 |
g2 r2 |
r1
\bar "|."
}

chrdStrophe = \chordmode {
s2.
g1:6 | c1:7 | g1:6 | g2:/b bf:dim |
a1:m7 | d1:7 | g2:6 e:7 | a:m7 d:7 |
g1:6 | c1:7 | g1:6 | g2:/b bf:dim |
a1:m7 | d1:7 | g1:6  | d2:m7 g:7 |
c1 | cs:dim | g s
a:7 | s | d:7 | s
g1:6 | c1:7 | g1:6 | g2:/b bf:dim |
a1:m7 | d1:7 | g2:6 gs:dim | a:m7 d:7 |

}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Swing | A A B A | }
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
