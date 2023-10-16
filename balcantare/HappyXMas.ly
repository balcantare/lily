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
  So this is Chrit -- mas
  and what have you done?
  An -- o -- ther year o -- ver
  a new one just be -- gun.
  And so this is Christ -- mas.
  I/we hope you have fun,
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
  the rich and the poor ones,
  the road is so _ long.
  And so hap -- py Christ -- mas,
  for black and for white,
  for yel -- low and red  ones
  let's stop all the fights.
}}


lyrStropheC = {
  \lyricmode {
    %\set stanza = "3. "
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
  g2.
  r4 g8 e' e e
  \bar "||"
  \key c \major
  d8 c4 r4.
  r4 g8 c d e
  d4. r4.
  r4 a8 d e f
  e8 d4 r4.
  r4 g,8 e' g e
  c2.
  r4 c,8 a' a a16 a
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

stropheAlt = \relative c'' {
  \voiceOne
  s4.
  b4. a c b
  c b d c
  b a g a
  b a c b
  e d f e
  f e g f
  e d c d
  c b d c
  }

stropheBass = \relative c' {
  \clef "bass"
  \key g \major
  s4.
  g fs a g
  a gs b a
  g fs e fs
  g fs a g
  \key c \major
  c, b d c
  d cs e d
  c b a b
  c b d c
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
    #(define fonts (book-font 1.1))
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \strophe }
        \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new	Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyrStropheC
      \new Staff <<
        \new Voice = "StropheBass" { \stropheBass }
      >>
    >>
  }
}
