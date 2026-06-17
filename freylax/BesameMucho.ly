\version "2.24.2"
sheetName = "Besame Mucho"
sheetComposer = "Consuelo Velazquez"
\include "../include/book.ily"

sheetTonality = ef
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key c \minor
\language "english"
  \partial 1
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
c4. c8 c2~ |
c2   \tuplet 3/2 {c4 d4 ef4} |
g2 f2~ |
f2. r4 |
  \tuplet 3/2 {f4 f4 f4}   \tuplet 3/2 {g4 g4 g4} |
  \tuplet 3/2 {af4 af4 af4}   \tuplet 3/2 {bf4 c4 d4} |
g,1~ |
g2. r4 |
c4. c8 c2~ |
c2   \tuplet 3/2 {c4 bf4 af4} |
g2 f2~ |
f2. g4 |
  \tuplet 3/2 {c4 g4 ef4}   \tuplet 3/2 {g4 ef4 c4} |
  \tuplet 3/2 {ef4 d4 c4}   \tuplet 3/2 {d4 c4 b4} |
c1~ |
c2. r4  }|
s2 |
c2.~ r4 |
  \mark \markup{ \box{\fontsize #4 B}}
  \tuplet 3/2 {f4 f4 f4}   \tuplet 3/2 {f4 ef4 d4} |
  \tuplet 3/2 {ef4 ef4 ef4}   \tuplet 3/2 {ef4 d4 c4} |
  \tuplet 3/2 {d4 d4~ d4} ef2 f2 |
g2. r4 |
  \tuplet 3/2 {f4 f4 f4}   \tuplet 3/2 {f4 ef4 d4} |
  \tuplet 3/2 {ef4 ef4 ef4}   \tuplet 3/2 {ef4 d4 c4} |
  \tuplet 3/2 {d4 d4 d4}   \tuplet 3/2 {d4 f4 ef4} |
d2. r4 |
  \mark \markup{ \box{\fontsize #4 A}}
r1 bf1 |
%\bar "|."
}

chrdStrophe = \chordmode {
  c1:m6 | s1 | f1:m7 | s2. | f1:m6 f1m7/Ef | f1m6/D g1:7 | c1:m6 | g1:7 | c1:7 | s1 | f1:m6 | s2. | c1:m6 | f1m6/Af g1:7 | c1:m6 | s4 | s2 | s2. | f1:m6 | c1:m6 | g1:7 | c1:7 | f1:m6 | c1:m6 | d1:7 | g1:7 | s1 | 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Besame Mucho }
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
