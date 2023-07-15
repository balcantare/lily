\version "2.22.2"
sheetName = "Lasst uns Frieden schaffen"
\include "book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Ach, ich wünscht', ich könn -- te flie -- gen,
  \set stanza = #"1. "
  fort von all dem Hass, de Krie -- gen,
  fort von all dem
  \set stanza = #"1. "
  Wahn -- sin,
  der uns in die En -- ge
  treibt.

  \set stanza = #"1. "
  in den Näch -- ten, die ich wa -- che,
  weil ich mir nur
  \set stanza = #"1. "
  Sor -- gen ma -- che,
  wird mir klar das
  \set stanza = #"1. "
  für uns
  Men -- schen doch nur ei -- nes
  bleibt:

  Lasst uns Frie -- den schaf -- fen,
  Lasst uns Frie -- den schaf -- fen,
  Lasst uns Frie -- den schaf -- fen,
  oh -- ne Waf -- fen!
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Stoppt die Macht der Rüs -- tungs -- bos -- se
  \set stanza = #"2. "
  und die We -- ge der Ge -- schos -- se,
  die sie oh -- ne
  \set stanza = #"2. "
  Skru -- pel
  ü -- ber -- allhin ex -- por -- tie -- rn'!
  \set stanza = #"2. "
  Und Mil -- liar -- den Gel -- der flie -- ßen,
  da -- mit Men -- schen
  \set stanza = #"2. "
  sich er -- schie -- ßen
  und im Kampf der
  \set stanza = #"2. "
  Mäch -- ti -- gen doch im -- mer
  nur ver -- liern'.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Völ -- ker, lasst Euch nicht ver -- blen -- den,
  \set stanza = #"3. "
  Men -- schen nehmt Euch bei den Hän -- den!
  Lasst nicht zu, dass
  \set stanza = #"3. "
  sie uns auf -- ein -- an -- der
  het -- zen wolln'!
  \set stanza = #"3. "
  Denn in al -- len ih -- ren Krie -- gen
  wer -- den stets die
  \set stanza = #"3. "  Rei -- chen sie -- gen.
  Müt -- ter, leis -- tet
  \set stanza = #"3. "  Wi -- der -- stand,
  bevor_sie Eu -- re Söh -- ne holn'!
}}

strophe = \relative c'' {
  %\voiceOne
  \time 4/4
  \key d \minor
  %\partial 4
  a4 a8 a8~ a4 bf
  a4 bf8 a8~ a4 f
  g4 8 8~ 4 a
  g4 a8 g~ 4 e
  bf'4 bf8 8~ 4 4
  bf4 bf8 a8~ a4 g4
  e4 e8 e~ e4 f
  e1 \break
  d4 d8 d8~ d4 e
  d4 e8 f~ 4 g
  f4 f8 f~ 4 g
  f4 g8 a~ 4 a
  g4 g8 g~ 4 g
  g4 g8 a~ 4 g
  e4 e8 e~ 4 f
  e1
  r2 \break
  \repeat volta 2 {
    f4 e
  d2 d
  d4 d d e
  f2 f
  f4 f g f
  e2 e
  e4 e d c
  d4 d2. ~
  4 r }
  %\bar "|."
}

chrdStrophe = \chordmode {
  d1:m s
  c s
  g:m s
  a:7 s
  d:m s
  f s
  g:m s
  a:7 s
  s
  d:m s
  f s
  c s
  d:m
  \parenthesize a2:7
}

\bookpart {
  \paper {
    %ragged-right = ##f
    page-count = #1
    #(define fonts (book-font 1.2))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
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
