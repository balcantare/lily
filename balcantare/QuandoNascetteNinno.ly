\version "2.24.0"
sheetName = "Quando nascette Ninno"
sheetComposer = "trad. Neapel"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
  Quan -- do nas -- ce -- te Nin -- no‿a
  Bet -- te -- lem -- me,
  \set stanza = "1. "
  E -- ra not -- te‿e pa -- re __ a __ mmie -- zo
  ju -- or -- no!
  \set stanza = "1. "
  Ma -- je le stel -- le
  Lu -- ste -- re bel -- le
  Se ve --
  \set stanza = "1. "
  det -- te -- ro ac -- cus -- si!
  La chiú lu -- cen -- te:
  \set stanza = "1. "
  Jet -- te‿a chiam -- mà
  li Ma -- gi in O -- ri -- en -- te.

}}

lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    Zu Beth -- le -- hem
    ge -- bo -- ren
    war das Kinde -- lein,
    \set stanza = "2. "
    da glänzt in tie -- fer Nacht
    ein hel -- ler Ta -- ges -- schein.
    \set stanza = "2. "
    Sol -- cher -- lei Schim -- mer
    sah __ _ man nim -- mer
    an den \set stanza = "2. "
    Ster -- nen wie da -- zu -- mal.
    Der schöns -- te hellste Stern,
    \set stanza = "2. "
    der rief die wei -- sen Könige
    im __ _ Mor -- gen -- lande fern.
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = "3. "
    No‿n'ce -- ra -- no
    ne -- mi -- ce p -- pe la ter -- ra,
    \set stanza = "3. "
    La pe -- co -- ra pas -- ci -- a
    co lo li -- o -- ne,
    \set stanza = "3. "
    Co -- le cra -- pet -- te
    se ve __ _ det -- te
    Lo li -- \set stanza = "3. "
    o -- par -- do
    paz -- zi -- a:
    L'ur -- zo e‿o vitiel -- lo,
    \set stanza = "3. "
    E co lu lu -- po
    'pace u __ _ pe -- co -- riel -- lo.
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = "4. "
    Gu -- ar -- da -- va -- no le pe -- co -- re
    lu_pastu -- re.
    \set stanza = "4. "
    E‿l -- 'An -- ge -- lo, sbren -- nente
    chi -- ù de lu su -- le,
    \set stanza = "4. "
    Com -- pa -- ret -- te,
    E le di _ -- cet -- te:
    Nò ve \set stanza = "4. "
    spa -- ven -- ta _ -- te,
    nò!
    Con -- ten -- to e_ri -- so:
    \set stanza = "4. "
    La ter -- ra è ar -- renventa -- ta __ _
    Pa -- ra -- di -- so!
}}
stropheSopran = \relative c'' {
  \voiceOne
  \override Rest.staff-position = #0
  \accidentalStyle neo-modern-voice-cautionary
  \time 6/8
  \key f \major
  \partial 8
  \bar ".|:"
  \repeat volta 2 {
    c8 c4 bf8 a4 g8
    f4.~ f4 g8
    a4 bf8 c8.( bf16 a8)
    g4.~ g8 r \break a
    g4 a8 g4 a8
    bf8( c d4) c8( bf)
    a4 bf8 a4 g8
    f4. r4
   }
   \repeat volta 2 {
     r8
     \time 3/8 a8 bf c \time 6/8 bf( a) bf
     g8 a bf a( g) a
     a8( bf) c bf( a) bf
     g8 a bf a4 g8
     a4 bf8 \time 3/8 c8.( bf16 a8)
     \time 6/8 g4.~ g8 r \break a
     g4 a8 g4 a8
     bf8( c d4) c8 bf
     a4 bf8 a4( g8)
     f4. r4
   }
}

stropheAlt = \relative c'' {
  \voiceTwo
  a8 a4 g8 f4 c8
  a4.~ a4 c8
  f4 g8 a8.( g16 f8)
  c4.~ c8 r c
  c4 c8 c4 c8
  g'8( a bf4) a8( g)
  f4 f8 c4 c8
  f4. s4
  s8
  f8 g a g( f) g
  e8 f g f4 f8
  f8 g a g( f) g
  e8 f g f4 e8
  f4 g8 a8.( g16 f8)
  c4.~ c8 s c
  c4 c8 c4 c8
  g'8( a bf4) a8 g
  f4 f8 c4.
  f s4
}

chrdStrophe = \chordmode {
  s8
  f2. s s
  c s s4. c:7 f c f2.
  s4. c2. f c f s4.
  c2. s s4. c:7 f c f
  }

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1.2))
  }
  \header {
    subtitle = "Canzone dei zampognari/pifferari"
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \stropheSopran }
        \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheC
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheD
    >>
    %\layout {
    %  \context {
    %    \Lyrics
    %    \override LyricText.font-size = #1
    %  }
    %}
  }
}
