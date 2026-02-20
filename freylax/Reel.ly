\version "2.24.2"
sheetName = "Reel"
\include "../include/book.ily"

strophe = \relative c' {
  \time 2/4
  \key g \major
  \partial 8
  \bar ".|:"
  \mark \markup{ \box{\fontsize #4 A}}
  \repeat volta 2 {
     e8
     a8 a16 b a g e fs
     g d g d b' d, g b
     a8 a16 b a g e fs
     g d b g a8
  } r8 \break
  
    
  \mark \markup{ \box{\fontsize #4 B}}
    
    a8 c16 a e' a, c a
    g8 b16 g d' g, b g
    a8 c16 a e' a, c a 
    g d' b g a4
    a8 c16 a e' a, c a
    g8 b16 g d' g, b g
    a8 c16 a e' a, c a 
    g d' b g a8
    \bar "|."
}

chrdStrophe = \chordmode {
   s8
   a2:m g  a:m g4 a:m
   a2:m g a:m g4 a:m
   a2:m g f e4:m a8:m
}

\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \header {
    subtitle = "Reel |AABB|"
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

