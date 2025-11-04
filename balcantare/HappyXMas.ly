\version "2.24.0"
sheetName = "Happy XMas"
sheetComposer = "John Lennon, Yoko Ono"
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
  \column { \vspace #.4 "2. "}
  \column { \vspace #.2 \leftbrace }
}

lyrStropheA = {
  \lyricmode {
  \set stanza = "1&3. "
  So this is Christ -- mas
  and what have you/we done?
  \set stanza = "1&3. "
  An -- o -- ther year o -- ver
  a new one just be -- gun.
  \set stanza = "1&3. "
  And so this is Christ -- mas.
  I/We hope you have fun,
  \set stanza = "1&3. "
  the near and the dear ones,
  the old and the young.
  A mer -- ry, mer -- ry
  Christ -- mas and a hap -- py New Year,
  let's hope it's a good one
  with -- out a -- ny fear.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  So this is Christ -- mas
  for weak and for strong,
  \set stanza = #"2. "
  the rich and the poor ones,
  the road is so _ long.
  \set stanza = #"2. "
  And so hap -- py Christ -- mas,
  for black and for white,
  \set stanza = #"2. "
  for yel -- low and red  ones
  let's stop all the fights.
}}


lyrStropheC = {
  \lyricmode {
   \set stanza = "Chor: "
   _4.
   War4. is o -- ver
   if you want it,
   war is o -- ver now._ _ _ _
   War is o -- ver
   if you want it,
   war is o -- ver now._ _ _ _

}}


strophe = \relative c'' {
  \voiceTwo
  \accidentalStyle neo-modern-voice-cautionary
  \time 6/8
  \partial 4.
  \key g \major
  g8 a b
  g d4 r4.
  r4 d8 g a b
  a4. r4.
  r4 e8 a b c
  b8 a4 r4.
  r4 d,8 b' d b16 a
  g2. \break
  \repeat volta 2 {
  r4 g8 e' e e
  \bar "||"
  \key c \major
  d8 c4 r4.
  r4 g8 c d e
  d4. r4.
  r4 a8 d e f
  e8 d4 r4.
  r4 g,8 e' g e
  c2. } \break
  r4 c8 a' a a16 a
  g8 f4~ f4.
  r4 f16 f f8 g a
  g2.
  r4 g8 g f e
  d8 d4~ d4.
  r4 d8 d c a
  c2.
  r4.
  %\bar ".|:"
  \bar "|."
}

stropheTenor = \relative c'' {
  \clef "treble"
  \key g \major
  s4.
  <g b> <fs a> <a c> <g b>
  <a c> <gs b> <b d> <a c>
  <g b> <fs a> <e g> <fs a>
  <g b> <fs a> <a c> <g b>
  \key c \major
  <c e> <b d> <d f> <c e>
  <d f> <cs e> <e g> <d f>
  <c e> <b d> <a c> <b d>
  <c e> <b d>
}
chrdStrophe = \chordmode {
  s4.
  g2. s
  a:m s
  d s g s
  c s d:m s g s c s
  f s g s d:m f c d4.
  }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \transpose g d \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \transpose g d \strophe }
      >>
    \new	Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyrStropheC
      \new Staff <<
        \new Voice = "StropheTenor" { \transpose g d \stropheTenor }
      >>
    >>
  }
}
