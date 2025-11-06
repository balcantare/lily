\version "2.24.2"
sheetComposer = "Wouter Kuyper"
sheetName = "Mazurka voor en (dooie) mus"
\include "../include/book.ily"

strophe = \relative c' {
  \time 3/4
  \key d \minor
  \mark \markup{ \box{\fontsize #4 A}}
    d4 f8 r4 a8 
    g4 d2
    f4 d4. f8 
    f8 e c2 \break
    d4 f8 r4 a8
    g4 d2 
    f4 d4. f8 
    g2. \break
    d4 f8 r4 a8 
    g4 d2
    f4 d4. f8 
    f8 e c2 \break
    d4 f8 r4 a8
    g4 d2 
    f2 g8 a b2. \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
    \key c \major
    c4. b4 a8
    b4 g e
    a4. b4 c8
    b c d4 g \break
    e4. d4 c8
    b4 g e
    a4. b4 c8
    d2.
  }
}

chrdStrophe = \chordmode {
  d2.:m g f a:m d:m c f g
  d2.:m g f a:m d:m c f g
  c e:m f g c e:m f g
}
\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
  }
  \bookItem
  \header{
    subtitle = "Mazurka |ABB|"
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
  