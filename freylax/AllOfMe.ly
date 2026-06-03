\version "2.24.2"
sheetName = "All Of Me"
sheetComposer = "Seymour Simons Gerald Marks"
\include "../include/book.ily"

sheetTonality = d
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key d \major
  \language "english"
d'4. a8 fs2~ |
fs2   \tuplet 3/2 {d'4 e4 d4} |
cs4. as8 fs2~ |
fs1 |
b4. a8 fs2~ |
fs4 es4   \tuplet 3/2 {fs4 c'4 b4} |
a2 g2~ |
g1 |
fs4. f8 e2~ |
e2   \tuplet 3/2 {fs4 as4 cs4} |
e2 d2~ |
d1 |
cs4. c8 b2~ |
b2   \tuplet 3/2 {b4 e4 cs4} |
b1 |
cs1 |
d4. a8 fs2~ |
fs2   \tuplet 3/2 {d'4 e4 d4} |
cs4. as8 fs2~ |
fs1 |
b4. a8 fs2~ |
fs4 es4   \tuplet 3/2 {fs4 c'4 b4} |
a2 g2~ |
g1 |
e'2 d4 cs4 |
e2. d4 |
cs2 fs,4 a4 |
cs2. b4 |
d2 b4 d4 |
fs2 fs2 |
d1 |
r1 |
%\bar "|."
}

chrdStrophe = \chordmode {
  d1 | s1 | fs1:7 | s1 | b1:7 | s1 | e1:m7 | s1 | fs1:7 | s1 | b1:m7 | s1 | e1:7 | s1 | e1:m7 | a1:7 | d1 | s1 | fs1:7 | s1 | b1:7 | s1 | e1:m7 | s1 | e1:m7 | f1:d | fs1:m7 | b1:7 | e1:dim | a1:7 | d1 | e1:m7 a1:7 | 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { All Of Me }
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
