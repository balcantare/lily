\version "2.24.2"
sheetComposer = "Wouter Kuyper"
sheetName = "Scottish Vreeswijk"
\include "../include/book.ily"

strophe = \relative c' {
  \time 4/4
  \key a \minor
  \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
    e4 e8 a~ a e4 e8
    c' b a4 c2
    b4 b8 d8~ d c4 b8
    a4 e g a
    e4 e8 a~ a e4 e8
    c' b a4 c2
    b4 d8 c8~ c b8 a g
    a4 a2.
  }
  \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
    d4. d8~ d c4 b8
    c8 b a2.
    b4. b8~ b c4 d8
    e4. 8~ 4 e4
    f4. d8~ d c4 b8
    c8 b a2.
    b4. b8~ b c4 gs8
  } 
  \alternative {
    {a2 \tuplet 3/2 {a4 b c}}
    {a1}
  }
  \bar "|."
}

chrdStrophe = \chordmode {
  a1:m f g a:m
  a:m f g a:m
  g a:m g  e f a:m e a:m a:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
  }
  \bookItem
  \header{
    subtitle = "Scottish |AABB|"
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
  
