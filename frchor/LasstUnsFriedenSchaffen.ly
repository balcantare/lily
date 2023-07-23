\version "2.22.2"
sheetName = "Lasst uns Frieden schaffen"
\include "book.ily"

skipA = \repeat unfold 21 {\skip 8}

lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = #"1. "
  Ach, ich wünscht', ich könn -- te flie -- gen,
  \set stanza = #"1. "
  fort von all dem Hass, de Krie -- gen,
  \set stanza = #"1. "
  fort von all dem
  Wahn -- sin,
  der uns in die En -- ge
  treibt.

  \set stanza = #"1. "
  in den Näch -- ten, die ich wa -- che,
  weil ich mir nur
  Sor -- gen ma -- che,
  \set stanza = #"1. "
  wird mir klar das
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
    \skipA
  \set stanza = #"2. "
  Stoppt die Macht der Rüs -- tungs -- bos -- se
  \set stanza = #"2. "
  und die We -- ge der Ge -- schos -- se,
  \set stanza = #"2. "
  die sie oh -- ne Skru -- pel
  ü -- ber -- allhin ex -- por -- tie -- rn'!
  \set stanza = #"2. "
  Und Mil -- liar -- den Gel -- der flie -- ßen,
  da -- mit Men -- schen
  sich er -- schie -- ßen
  \set stanza = #"2. "
  und im Kampf der
  Mäch -- ti -- gen doch im -- mer
  nur ver -- liern'.
}}

lyrStropheC = {
  \lyricmode {
   \skipA
  \set stanza = #"3. "
  Völ -- ker, lasst Euch nicht ver -- blen -- den,
  \set stanza = #"3. "
  Men -- schen nehmt Euch bei den Hän -- den!
  \set stanza = #"3. "
  Lasst nicht zu, dass
  sie uns auf -- ein -- an -- der
  het -- zen wolln'!
  \set stanza = #"3. "
  Denn in al -- len ih -- ren Krie -- gen
  wer -- den stets die
  Rei -- chen sie -- gen.
  \set stanza = #"3. "
  Müt -- ter, leis -- tet
  Wi -- der -- stand,
  bevor_sie Eu -- re Söh -- ne holn'!
}}

strophe = \relative c' {
  %\voiceOne
  \time 4/4
  \key d \minor
  \partial 4
  f8 g
  a4. c8 c8 g4 g8
  bf4.  g8
  a4. a16 g
  f4. f8 a8 e4 f16 e
  d4. d8 e2 \break
  \bar ".|:"
  a8 a8 a8 bf a8 bf
  a8 f
  g8 g g8 g8
  g8 g8 a g
  bf8 bf bf bf bf8 bf
  a8 g
  g8 g8 g8 f8
  g2 %\break
  d8 d8 d8 e
  d e8 f d
  f8 f8 f  g
  f g a  f
  g8 g8 g g
  a8 g8 g g
  e8 e8 e f
  e2~ \time 2/4
  e8 r8
  \break
  \repeat volta 2 {
    f8 e
    \time 4/4
  d4 d
  d8 d f g
  a4 a a8 a
   g8 f g4 g
   g8 g f e
   \set Score.measureLength = #(ly:make-moment 3/4)
   e8 d8~  d2 }
  %\bar "|."
}

chrdStrophe = \chordmode {
  s4
  f2 c2 g:m a
  f a bf a
  d1:m
  c
  g:m
  a:7
  d:m
  f
  g:m
  a:7
  s2
  d1:m
  f
  c
  d2:m
  \parenthesize a4:7
}

\bookpart {
  \paper {
    %ragged-right = ##f
    page-count = #1
    #(define fonts (book-font 1))
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
