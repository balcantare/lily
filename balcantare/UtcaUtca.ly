\version "2.22.2"
sheetName = "Utca Utca"
\include "book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Ut -- ca, ut -- ca ég az ut -- ca,
  mesz -- sze vi -- rít
  a láng -- ja,
  \set stanza = #"1. "
  De csak pi -- ros
  de csak pi -- ros
  a két or -- cád,
  le -- ány -- ka;
  \set stanza = #"1. "
  Nem ti -- tok,
  ki -- mon -- dom
  Ös -- sze -- ö -- lelt,
  ös -- sze -- csó -- kolt
  \set stanza = #"1. "
  az én
  ked -- ves ga -- lam -- bom.
  ked -- ves ga -- lam -- bom.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Az ö -- le -- lés meg az a csók,
  ki -- csi lány, még
  ko -- rán van.
  \set stanza = #"2. "
  Kárt te -- het án kárt te -- het ám
  a sok cupp, cupp a lány -- ban.
  \set stanza = #"2. "
  De -- hogy van,
  de -- hogy tesz.
  Ez a so -- ra a vi -- lá -- gon
  \set stanza = #"2. "
  va -- la -- míg egy le -- ány lesz.
  -- míg egy le -- ány lesz.

}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
    Brennt hier ei -- ne gan -- ze Gas -- se,
    Ist's ein Feu -- er, das hier flammt?
    \set stanza = #"3. "
    Nein, es sind nur
    dei -- ne Wan -- gen, Mäd -- chen, die in
    Glut ent -- brannt.
    \set stanza = #"3. "
    Sag' es mir, was es ist!
    Kein Ge -- heim -- nis, mein Ge -- lieb -- ter
    \set stanza = #"3. "
    Ist's, der im -- mer mich so küsst!
    im -- mer mich so küsst!
}}

lyrStropheD = {
  \lyricmode {
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle modern %-voice-cautionary
  \time 2/4
  \key d \minor
  d8 f d f d f d f
  g4 f a a
  d,8 d4 d8 \break
  a'8 c a c a c a c
  d4 c  e e a,8 a4 a8 \break
  \repeat volta 2 {
    d4 d c r
    bf bf a r
    d,8 f d f d f d f \break
    g4 f
  } \alternative {
    { a4 a d,8 d4 d8 }
    { a'4 cs d8 d4 d8 }
  }
  \bar "|."
}

chrdStrophe = \chordmode {
  d2:m s g:m a d:m a:m s
  d:m e a:m
  d:m c g:m a
  d:m s g:m
  a d:m
  a d:m
}

\bookpart {
  \paper {
    #(define fonts (book-font 1.1))
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}
