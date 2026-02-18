\version "2.24.0"
sheetName = "Las gallinas van a Belén"
sheetComposer = "trad. Spanien"
\include "../include/book.ily"

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace75"
}
stanzaA = \markup {
  \column { \vspace #.4 "1. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaB = \markup {
  \column { \vspace #.4 "3. "}
  \column { \vspace #.2 \leftbrace }
}

lyrStropheA = {
  \lyricmode {
  \set stanza = "1. " %\stanzaA
  Las gal -- li -- nas va a Be -- lén _
  \set stanza = "1. " %\stanzaA
  y el gal -- lo can -- ta muy bien. _
  \set stanza = "1. " %\stanzaA
  Bai -- lan un mi -- nu -- e -- ti -- ño
  a -- le --
  \set stanza = "1. " %\stanzaA
  gran -- do‿a Je -- sùs ni -- ño
  y gi -- ran al -- re -- de --
  \set stanza = "1. " %\stanzaA
  dor
  de -- lei -- tan -- do‿al Re -- den -- tor.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = "2. "
  Por la no -- che, no por el di -- a,
  \set stanza = "2. "
  pre -- sen -- ta‿a la Vir -- gen
  Ma -- ri -- a.
  \set stanza = "2. "
  u -- na tar -- ta el co -- ne -- jo
  que‿ha tra --
  \set stanza = "2. "
  i -- do de muy le -- jos.
  Lo me -- jor de lo me --
  \set stanza = "2. "
  jor pa -- ra nues -- tro Re -- den -- tor.
}}


lyrStropheC = {
  \lyricmode {
    \set stanza = \stanzaB
    Seht die Hüh -- ner, wie sie da sprin -- gen
    \set stanza = \stanzaB
    auf dem Weg zu beth -- le -- hems Stall. _
    \set stanza = "3. "
    Wa -- ckeln lus -- tig mit dem Schwänz -- chen
    und ver --
    \set stanza = "3. "
    su -- chen gar ein Tänz -- chen,
    und der Hahn kräht laut: "\"Hur" --
    \set stanza = "3. " ra!
    Un -- ser Je -- sus -- kind ist "da!\""
}}

lyrStropheD = {
  \lyricmode {
    %\set stanza = #"4. "
    Wolln dem Kind ein Lied -- chen dar -- brin -- gen,
    ga -- ckern hier und ü -- _ ber -- all.
}}


strophe = \relative c'' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 6/8
  \partial 4.
  \key c \major
  \bar ".|:"
  \repeat volta 2 {
  c4 g8 e4 c8
  g'8 a b
  c4 g8
  \break
  c4 g8 e4 e8
  d8 e d
  c4 c8
  } \break
  \repeat volta 2 {
   e4 f8
   %\time 6/8
   g4 g8 g4 bf8
   a4 a8 a4 c8
   b4 g8 a4 b8
   a4 g8 e4 f8
   g4 g8 g4 bf8
   a4. c4 d8
   e4 c8 d4 b8
   c4.
  }
  %\bar "|."
}


stropheAlt = \relative c' {
  \voiceTwo
  e4 c8 c4 c8
  b8 b b c4 e8
  e4 c8 c4 c8
  b8 b b c4 c8
  c4 d8 e4 e8 e4 g8 f4 f8
  f4 f8 g4 g8 g4 f8 f4 e8
  c4 d8 e4 e8 e4 g8 f4. f4 f8 g4 g8
  f4 f8 e4.
}

chrdStrophe = \chordmode {
  c4. c4. g c s c g c
  s
  c2. f g c s f c4. g c
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \strophe }
        \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new	Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}
