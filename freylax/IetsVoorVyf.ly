\version "2.24.2"
sheetComposer = "Wouter Kuyper"
sheetName = "Iets voor vÿf"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 5/4
  \key a \minor
  c2. b4 c 
  a2. c4 d
  e2 d4 e d~
  d c b a g \break
  c2. b4 c 
  a2. c4 d
  e2 d4 e g
  \time 3/4
  d2. \break
  \time 5/4
  c2. b4 c
  a2. c4 d
  e2 d4~ d e
  d2 c4 b g \break
  c2. b4 c
  a2. c4 d
  e2 d4~ d e
  \time 2/4
  d2 \break
  
  \time 5/4
  a2 e4 d e
  d2 c4~c2
  f2 e4 d c
  d2 e4~ e g \break
  a2 e4 d e
  d2 c4 f e
  b2.~ b4 c
  d2 e4 g e \break
  a2 e4 d e
  d2 c4~c2
  f2 e4 d c
  b2 c4 d8 e g4 \break
  a2 e4 d e
  d2 c4 d e
  d2.~ 2~
  2.~ 2
  \bar "|."
}

chrdStrophe = \chordmode {
  a2.:m s2 f2. s2 c2. s2 g2. s2 a2.:m s2 f2. s2 c2.:s2 g2.
  a2.:m s2 f2. s2 c2. s2 g2. s2 a2.:m s2 f2. s2 c2.:s2 g2
  a2.:m s2 f2. s2  d2.:m s2 e2.:m s2 a2.:m s2 f2. s2 e2.:m s2 e2.:m s2
  a2.:m s2 f2. s2  d2.:m s2 e2.:m s2 a2.:m s2 f2. s2 g2. s2 
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = "Waltz in 5"
  }
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
  