\version "2.22.2"
sheetName = "Wer möchte nicht im Leben bleiben"
\include "book.ily"

skipA = \repeat unfold 24 { \skip 2 }

lyrStropheA = {
  \lyricmode {
   \skipA
  \set stanza = #"1. "
  We -- r möch -- te nicht im Le -- ben
  blei -- ben, die
  \set stanza = #"1. "
  Son -- ne und den Mond
  be -- sehn,
  mit
  \set stanza = #"1. "
  Win -- den sich um -- her zu
  trei -- ben ___ und an
  \set stanza = #"1. "
  Was -- sern still zu stehn.
mit Win -- den sich um -- her zu
  \set stanza = #"1. "
  trei -- ben ___ und an Was -- sern still zu stehn.
}}

lyrStropheB = {
  \lyricmode {
    \skipA
    \set stanza = #"2. "
    We -- r möch -- te nicht im Le -- ben
  blei -- ben,
  den
    \set stanza = #"2. "
  Mensch' und Tie -- ren zu -- ge -- sellt.
  Wer
    \set stanza = #"2. "
    lie -- ße sich denn gern ver -- trei -- ben,
  von die -- ser
    \set stanza = #"2. "
    rei -- chen bun -- ten Welt.
  Wer lie -- ße sich denn gern ver --
    \set stanza = #"2. " trei -- ben,
  von die -- ser rei -- chen bun -- ten Welt.
}}

lyrStropheC = {
  \lyricmode {
    \skipA
  \set stanza = #"3. "
  O -- ___ las -- set uns im Le -- ben
  blei -- ben, weil
  \set stanza = #"3. "
  je -- den Tag ein
  Tag be -- ginnt.
  O
  \set stanza = #"3. "
  wollt sie nicht zu früh ver -- trei -- ben,
  ___ al -- le
  \set stanza = #"3. "
  die le -- ben -- dig sind.
O wollt sie nicht zu früh ver --
\set stanza = #"3. "
trei -- ben,
  ___ al -- le die le -- ben -- dig sind.
  }}

strophe = \relative c' {
  %\voiceOne
  \time 4/4
  \key c \major
  %\partial 4
  c8 e g e c e g4
  c2~ 8 b a g
  a e c a f' d a d
  b g b d c4^\markup{fine}_\fermata
  \bar "||" \break

  c8 e
  g4. g8 g a f d
  c4 e r4 e
  d8 c b c d4 g
  e2 r4 e4
  f8 f f e d4 c
  b4 d r8 d d c
  b4 g' e d
  c2 r4 e
  f8 f f e d4 c
  b4 d r8 d d c
  b4 g' e d
  \set Score.measureLength = #(ly:make-moment 2/4)
  c2 %s2
  \bar "|."
}

chrdStrophe = \chordmode {
  \set chordBassOnly = ##t
  a2:m f
  d:m e:m
  a2:m
  f2 g
  c
  e2:m f
  a:m c g1
  c2 a:m d:m f
  g1
  g1
  c2 a:m
  f d:m
  g1 g1
  c2
}

\bookpart {
  \paper {
    page-count = #1
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}
