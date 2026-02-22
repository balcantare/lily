\version "2.24.2"
sheetComposer = "Wouter Kuyper"
sheetName = "De tweede Koepel"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 6/8
  \key a \minor
  \bar ".|:"
  \mark \markup{ \box{\fontsize #4 A}}
    c4. c8 b c
    a4. a8 b c
    d4 e8 d8 a b~
    b4.  b8 a b \break
    c8 r c~ c b c
    a4. a8 b c
    d8 r e4 d8 c
    b~ b4. r4 \break
    c4. c8 b c
    a4. a8 b c
    d4 e8 d8 a b~
    b4.  b8 a b \break
    c8 r c~ c b c
    a4. a8 b c
    e4 d e
    b4. b8 c d 
 \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
  e8 r e e d e
  f4. f8 e d
  b4. b8 c d
  e8 r g e d c
  a4. a8 b c
  d8 r d e d a
  b4. b8 c d
  } 
  \alternative {
      { b4 c d}
      { a2. }
  }
  \bar "|."
}

chrdStrophe = \chordmode {
  a2.:m f d:m g a:m f d:m e 
  a2.:m f d:m g a:m f d:m e 
  a:m d:m g c f d:m g e a:m
}

\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \header{
    subtitle = "Rondeau en couple |ABB|"
  }
  \score {
    \layout {#(layout-set-staff-size-with-jazz 24)}
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
  
