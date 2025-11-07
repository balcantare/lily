\version "2.24.2"
sheetComposer = "ry"
sheetName = "Cerclevolu"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 6/8
  \key c \major
  \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
    e8 f g f4-\prall e8
    d4 g8~ 4 d8
    c8 d e d4-\prall c8
    b8 c d b a g
    e'8 f g f4-\prall e8
    d4 g8~ 4 d8
    c8 d e d8 c b
    c2.
  }
 \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
  e,8 a b c d e
  e4 b8~ b8 d8 c
  a b c d e f 
  g f-\prall e d c b \break
  e,8 a b c d e
  e4 b8~ b8 d8 c
  a b c d c b
  a2.
  }\break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 C}}
  c4 c8 c d e
  g4 g,8 g a b
  c4 a8 a b c
  d8 c b a g b \break
  c4 c8 c d e
  g4 g,8 g a b
  c b c d c b
  c2.
  }
  \break
    \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 D}}
  e8 d c b c d
  c4 a8 a b c
  d8 c b a b c
  d4 d8 d e f \break
  e8 d c b c d
  c4 a8 a b c
  d c b a b g
  a2.
  }
  \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 E}}
  e'4 e8 e d c
  c4 a8 a b c
  d c b a b c
  d4 d8 d e f \break
  e4 e8 e d c
  c4 a8 a b c
  d c d e d-\prall c
  c2.
  }
  \break
\repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 F}}
  c8 b a a b c
  d4 b8 b c d
  e8 d c b c e
  a4 e8 e f g
  a8 g f f g a
  g4 d8 d e f
  e d c b c d
  c4 b8~ 8 a4
  }
}

chrdStrophe = \chordmode {
  c2. g f g 
  c g f4. g c2.
  a:m e:m f g
  a:m e:m f4. g a2.:m
  c2. e:m f g c e:m f4. g c2.
  e:m a:m f g e:m a:m f4. g a2.:m
  c2. a:m f g  c2. a:m f4. g c2.
  f g e:m a:m f g e:m f 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = "Cercle circassien |AABBCCDDEEFF|"
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
  