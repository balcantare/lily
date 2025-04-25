\version "2.22.2"
sheetName = "Nga iwi e"
sheetComposer = "trad. Maori"
sheetPoet = "dt. Text Beate Tarrach"
\include "book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1m) "
  Ngá i -- wi e,
  ngá i -- wi e
  Ki -- a
  \set stanza = #"1m) "
  Ko -- ta -- hi Rá
  Te Moa -- na Nui a Ki -- wa.
  \set stanza = #"ref m) "
  E I A I E!
  E I A I E!
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2m) "
  Ki -- a mau rá,
  ki -- a mau rá,
  ki te
  \set stanza = #"2m) "
  ma -- na mo -- tu_ha -- ke
  me te a -- _ ro -- ha.
  \set stanza = #"ref d) "
  Wir sind nicht al -- lein!
  Wir sind nicht al -- lein!
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"1d) "
  Wir sind ver -- eint,
  wir sind ver -- eint,
  Wie das
  \set stanza = #"1d) "
  Meer und die Wel -- len.
  Wir sind stark und ver -- eint.
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = #"2d) "
  Wir ha -- ben Kraft, wir ha -- ben Mut,
  Denn in
  \set stanza = #"2d) "
  un -- se -- rem Her -- zen, da ist
  Feu -- er und Glut!
}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"3d) "
  Wir sind der Stein,
  wir sind der Stein!
  Lass ihn
  \set stanza = #"3d) "
  rol -- len, dann wird er
  Stein des An -- sto -- ßes sein!
}}

lyrStropheF = {
  \lyricmode {
  \set stanza = #"4d) "
  Wir sind der Wind,
  wir sind der Wind,
  Der da
  \set stanza = #"4d) "
  ü -- ber das Land zieht
  und Ver -- än -- de -- rung
  bringt.
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key c \minor
  \repeat volta 2 {
    \bar ".|:"
    c8 c bf c~ 2
    ef8 ef d ef~ 4 ef8 ef
    d8 d d d~ d d c d
    ef8 ef d c~ 2
  } \break
  \repeat volta 2 {
    <ef g>2. <g c>8 <f bf>8~
    2. <ef g>8 <g c>8~
    1~ 1
    <ef g>2. <g c>8 <f bf>8~
    2. <ef g>8 <c g'>8~
    1~ 1
  }
  % \bar "|."
}

chrdStrophe = \chordmode {
  c1:m ef bf c:m
  c:m bf c:m s
  c:m bf c:m s
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.3))
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \transpose ef g \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose ef g \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    >>
  }
}
