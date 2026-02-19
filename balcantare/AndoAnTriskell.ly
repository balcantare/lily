\version "2.22.2"
sheetName = "Ando an Triskell"
\include "../include/book.ily"

strophe = \relative c'' {
  %\voiceOne
  \time 4/4
  \partial 8
  \key g \minor
   %\mark \markup{ \box{\fontsize #4 A}}
   \bar ".|:"
   \repeat volta 2 {
     r8
     d4. ef8 d4. c8
     bf4 a g2
     c4 c8 c a4 g8 f 
     f a bf c d2
     d4. ef8 d4. c8
     bf4 a g2
     c4 c8 c a4 g8 f 
     g8 a bf a g4.
   } \break
   \repeat volta 2 {
      c8
      d4 g g,4. c8 
      d4 g a,4. a8
      c4 c a4 g8 f
      g8 a bf c d4.
      c8
      d4 g g,4. c8 
      d4 g a,4. a8
      c4 c a4 g8 f
      g8 a bf a g4.
   } \break
   \repeat volta 2 {
     r8
     g4 f8 g a4 c
     bf8 a g f g a bf a
     g4 f8 g a4 c 
     bf8 a g f g4.
   } \break
   \repeat volta 2 {
     r8
     d'4 c8 d ef4 c
     c4 bf8 c d4 bf
     g4 f8 g a4 c
     bf8 a g f g a bf c
     d4 c8 d ef4 c
     c4 bf8 c d4 bf
     g4 f8 g a4 c
     bf8 a g f g4.
   }
   %\mark \markup{ \box{\fontsize #4 B}}
   %\bar "|."
}

chrdStrophe = \chordmode {
   s8
   g1:m s f g:m
   g:m s f g:m
   g:m s2 f a:m d:m g:m d:m
   g1:m s2 f a:m d:m g1:m 
   g2:m d4:m f g1:m s2 d4:m f g1:m
   g2:m c:m f bf g:m d4:m f g2:m d4:m f
   g2:m c:m f bf g:m d4:m f f2 g:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.5))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
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
