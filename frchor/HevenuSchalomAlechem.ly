\version "2.22.2"
sheetName = "Hevenu Schalom Alechem"
\include "book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"h) "
  He --  ve -- nu sha -- lom a -- le -- chem,
  He --  ve -- nu
  \set stanza = #"h) "
  sha -- lom a -- le -- chem,
  He --  ve -- nu
  \set stanza = #"h) "
  sha -- lom a -- le -- chem,
  He --  ve -- nu
  \set stanza = #"h) "
  sha -- lom,
  sha -- lom, sha -- lom,
  a -- le -- chem
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"d) "
  Wir woll -- len Frie -- den für al -- le,
  Wir woll -- len
  \set stanza = #"d) "
  Frie -- den für al -- le,
  Wir woll -- len
  \set stanza = #"d) "
  Frie -- den für al -- le,
  Wir woll -- len
  \set stanza = #"d) "
  Frie -- den, Frie -- den, Frie -- den für die Welt!
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"s) "
  Pře -- je -- my po -- koj  wšĕm lud -- źom,
  Pře -- je -- my
  \set stanza = #"s) "
  po -- koj  wšĕm lud -- źom,
  Pře -- je -- my
  \set stanza = #"s) "
  po -- koj  wšĕm lud -- źom,
  Pře -- je -- my
  \set stanza = #"s) "
  po -- koj, po -- koj, po -- koj kóž -- de -- mu!
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = #"su) "
    Pschee -- je -- my po -- koj schim lud -- schom,
    Pschee -- je -- my
    \set stanza = #"su) "
    po -- koj schim lud -- schom,
    Pschee -- je -- my
    \set stanza = #"su) "
    po -- koj schim lud -- schom,
    Pschee -- je -- my
    \set stanza = #"su) "
    po -- koj, po -- koj, po -- koj kujsch -- de -- mu!
}}

lyrStropheE = {
  \lyricmode {
    \set stanza = #"f) "
    Nous vous an -- non -- çons la paix, ___
    Nous vous an --
    \set stanza = #"f) " non -- çons la paix, ___
    Nous vous an --
    \set stanza = #"f) "
    non -- çons la paix, ___
    Nous vous an --
    \set stanza = #"f) "
    non -- çons la paix, la paix,
    dans le monde!
}}

strophe = \transpose a d \relative c' {
  %\voiceOne
  \time 2/2
  \key a \minor
   \partial 4.
  e8 a c
  e2 c4. b8
  b8 a4. r8 a c e
  a2 f4. e8
  e8 d4. r8 d e f
  e2 d4. d8
  d8 c4. r8 c b a
  e'4 e e e
  e8 d c b
  a8
  \bar "|."
}

chrdStrophe = \transpose a d \chordmode {
  s4.
  \set chordBassOnly = ##t
  a2:m a:m/e a:m/a a:m/e
  a:7 a:7/cs d:m d:m/f
  e:7 e:7/b a:m a:m/e
  e:7 e:7/b e:7/e a8:m
}

\bookpart {
  \paper {
    #(define fonts (book-font 1.35))
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
  }
}
