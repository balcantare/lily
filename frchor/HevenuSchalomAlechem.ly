\version "2.22.2"
sheetName = "Hevenu Schalom Alechem"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"hb) "
  He --  ve -- nu sha -- lom a -- le -- chem,
  He --  ve -- nu
  \set stanza = #"hb) "
  sha -- lom a -- le -- chem,
  He --  ve -- nu
  \set stanza = #"hb) "
  sha -- lom a -- le -- chem,
  He --  ve -- nu
  \set stanza = #"hb) "
  sha -- lom,
  sha -- lom, sha -- lom,
  a -- le -- chem.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"de) "
  Wir woll -- len Frie -- den für al -- le,
  Wir woll -- len
  \set stanza = #"de) "
  Frie -- den für al -- le,
  Wir woll -- len
  \set stanza = #"de) "
  Frie -- den für al -- le,
  Wir woll -- len
  \set stanza = #"de) "
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
    \set stanza = #"so) "
    Pschee -- je -- my po -- koj schim lud -- schom,
    Pschee -- je -- my
    \set stanza = #"so) "
    po -- koj schim lud -- schom,
    Pschee -- je -- my
    \set stanza = #"so) "
    po -- koj schim lud -- schom,
    Pschee -- je -- my
    \set stanza = #"so) "
    po -- koj, po -- koj, po -- koj kujsch -- de -- mu!
}}

lyrStropheE = {
  \lyricmode {
    \set stanza = #"fr) "
    Nous vous an -- non -- çons la paix, ___
    Nous vous an --
    \set stanza = #"fr) " non -- çons la paix, ___
    Nous vous an --
    \set stanza = #"fr) "
    non -- çons la paix, ___
    Nous vous an --
    \set stanza = #"fr) "
    non -- çons la paix, la paix,
    dans le monde!
}}

lyrStropheF = {
  \lyricmode {
    \set stanza = #"ru) "
    Da bud -- jet mir wsejg -- da s_wa -- mi,
    Da bud -- jet
    \set stanza = #"ru) "
    mir wsejg -- da s_wa -- mi,
    Da bud -- jet
    \set stanza = #"ru) "
    mir wsejg -- da s_wa -- mi,
    Da bud -- jet
    \set stanza = #"ru) "
    mir, mir wsejg -- da
    s_wa -- mi bud -- jet mir.
  }
}

lyrStropheG = {
  \lyricmode {
    \set stanza = #"uk) "
    Zschob na -- sawž -- dy
    myr buw s_wa -- mi,
    Zschob na -- sawž --
    \set stanza = #"uk) " dy
    myr buw s_wa -- mi,
    Zschob na -- sawž --
    \set stanza = #"uk) " dy
    myr buw s_wa -- mi,
    Pow -- ju -- dy
    \set stanza = #"uk) " myr buw s_wa -- mi,
    s_wa -- mi na -- sawž -- dy.
  }
}

lyrStropheH = {
  \lyricmode {
    \set stanza = #"sl) "
    Praj -- me si mie -- er pre_v -- schet -- kych,
    Praj -- me si
    \set stanza = #"sl) "
    mie -- er pre_v -- schet -- kych,
    Praj -- me si
    \set stanza = #"sl) "
    mie -- er pre_v -- schet -- kych,
    Praj -- me si
    \set stanza = #"sl) "
    pre -- dov -- schet -- kym,
    pre -- dov -- schet -- kym mier.
  }
}

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
  %\set chordBassOnly = ##t
  a1:m s
  a:7 d:m
  e:7 a:m
  e:7 e2:7 a8:m
}

\bookpart {
  \paper {
    #(define fonts (book-font 1.2))
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
    %\new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    \new Lyrics \lyricsto "Strophe" \lyrStropheG
    \new Lyrics \lyricsto "Strophe" \lyrStropheH
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
      #(layout-set-staff-size 20)
    }
  }
}
