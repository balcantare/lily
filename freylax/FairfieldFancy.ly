\version "2.24.2"
sheetName = "Fairfield Fancy"
\include "../include/book.ily"

sheetTonality = c

strophe = \relative c' {
  \time 2/4
  \key a \minor
  \bar ".|:"
  \mark \markup{ \box{\fontsize #4 A}}
  \repeat volta 2 {
     \ifTransposeFor #'bf {e'8}{e8} a a gs 
     a4 a8 b
     c a e' a, f' a, e' a,
     d, g g fs
     g4 g8 a 
     b g d' g, e' g, d' g,
     e8 a a gs 
     a4 a8 b
     c b a b
     c d e4
     g8 a g e
     d c a b 
     c a b g
     a2   
  } \break  
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
    \ifTransposeFor #'bf {e8}{e'8} a a gs 
    a4 a8 b
    c a b a 
    c a b a
    d, g g fs
    g4 g8 a
    b8 g a g
    b g a g
    e8 a a gs 
    a4 a8 b
    c b a b
    c4 r
    g8 a g e
     d c a b 
     c a b g
     a2
  }
}

chrdStrophe = \chordmode {
  a2:m s s s g s s s 
  a:m s s s c f g a:m
  a2:m s s s g s s s 
  a:m s s s c f g a:m
   
}

\bookpart {
  \paper {
    page-count = #1
    system-system-spacing.padding = #8
  }
  \bookItem
  \header {
    subtitle = "Reel |AABB|"
  }
  \score {
    <<
    \new ChordNames \doTranspose \chrdStrophe 
    \new Staff <<
      \new Voice = "Strophe" \doTranspose \strophe 
      >>
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
    }
  }
}

