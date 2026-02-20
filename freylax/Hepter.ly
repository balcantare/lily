\version "2.24.2"
sheetComposer = "Wouter Kuyper"
sheetName = "Hepter"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 11/4
  \key a \minor
    \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
  e4 c a f' d a g' d e2 e4
  c4. b8[ a b] c2 c4 d c b2.
  e4 c a f' d a g' d e2 e4
  c4. b8[ a b] c2 d4 b c a2.
}
  \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
  c4. b8[ a b] c4. a8[ b c] d4 b e2.
  c4. b8[ a b] c2 c4 d c b2.
  c4. b8[ a b] c2 c4 d f e2.
  c4. b8[ a b] c2 d4 b c a2.
  } 
}

chrdStrophe = \chordmode {
    a2.:m d g2 c2.
    f2. s g2 e2.
    a2.:m d g2 c2.
    d2. s e2 a2.:m
    f1. g2 c2.
    f1. g2 e2.
    f1. g2 c2.
    f1. g2 a2.:m
    
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
  }
  \bookItem
  \header{
    subtitle = "Wals in 11 |AABB|"
  }
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
    }
  }
}
  
