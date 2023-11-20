\version "2.24.0"
sheetName = "Die Schneekönigin"
sheetComposer = "Reinhard Simmgen, Beate Tarrach"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
  Wenn die Ta -- ge käl -- ter
  wer -- den und die Näch -- te lang,
  hört man manch -- mal \set stanza = "1. "
  auf der Er -- den
  ei -- nen hel -- len Klang.
  Still, hört mal
  hin, \set stanza = "1. "  s'ist die Schnee --
  kö -- ni -- gin!
  was will sie uns lei -- se sa -- gen:
  \set stanza = "1. " 'Kin -- der, seid nicht bang.'
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = "2. "
  Sieh, die ers -- ten Flo -- cken
  schwe -- ben auf den Tan -- nen -- baum.
  Ha -- ben ihm ein \set stanza = "2. "
  Kleid ge -- ge -- ben_aus
  wei -- chem, zar -- tem Flaum
  'Still, schaut mal hin!',
  \set stanza = "2. "
  sagt die Schnee -- kö -- ni -- gin.
  'Hab' ver -- zau -- bert eu -- re
  Welt in \set stanza = "2. "
  ei -- nen Win -- ter -- traum.'
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = "3. "
  Bäu -- me, Wie -- sen und die He -- cke:
  Al -- les liegt ver -- schneit.
  Un -- ter ei -- ner \set stanza = "3. "
  wei -- ßen
  De -- cke_ver -- schla -- fen sie die Zeit.
  'Still, fühl mal hin!'
  \set stanza = "3. "
  sagt die Schnee -- kö -- ni -- gin.
  'Kalt und ei -- sig ist der Win -- ter_doch
  \set stanza = "3. "
  weich sein Glit -- zer -- kleid.'
}}

stropheSopran = \relative c'' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/4
  \key d \minor
  a4 a a a
  g8( a) g( f) e4 d
  f4 f g g
  a2( g)
  a4 a a a
  g8( a) g( f) e4 d
  f4 f e8( f) e4
  d1
  f2 g4 4
  a1 \break
  f4 f g f8 g
  a2( g)
  a4 a a a
  g8( a) g( f) e4 d
  f4 f e8( f) e4
  d1
  \bar "||"
  a'4. bf8 c4 bf8 a
  g4. a8 bf4 a8 g
  f4 d8 f a g f e
  s1 %d1
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  d4 d d d
  e8( f) e( d) d4 bf
  d d e c
  f2( e)
  f4 f f f
  e8( f) e( d) d4 d
  d d cs cs
  s1 %d1
  f2 e4 d d1
  f4 f e d8 e
  f2( e)
  f4 f f f
  e8( f) e( d) d4 d
  d4 d cs cs s1
  f1 d d2 cs d1
  }

stropheBass = \relative c {
  \voiceTwo
  \clef "bass"
  \key d \minor
  d4 d d d
  bf4. a8 g4 g
  d'4 d c8 d e4
  f2( e)
  d4 d d d
  bf4. a8 g4 bf
  a a cs a d1
  s1 s1
  d4 d c bf8 a
  c2( cs)
  d4 d d d
  bf4. a8 g4 bf
  a4 a cs a
  d1
  d1 bf a2 f'4 e d1
}

stropheTenor = \relative c' {
  \voiceOne
  f2 f
  d bf
  d c
  c cs
  d2 f
  g1
  a2 g
  f1
  d2 e
  a1
  d,2 e
  f2. e4
  d2 f g1 a2 g f1
  d2. a4 c2 bf a a a1
}

chrdStrophe = \chordmode {
  \set chordBassOnly = ##f
  d1:m g:m d2:m c f a:7
  d1:m g:m d2:m a:7 d1:m
  d2:m g:m d1:m bf2 c f a:7
  d1:m g:m d2:m a:7 d1:m
  d1:m g:m d2:m a d1:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
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
      \new Staff <<
        \new Voice = "StropheTenor" { \stropheTenor }
        \new Voice = "StropheBass" { \stropheBass }
      >>
    >>
    \layout {
     \context {
       \Lyrics
       \override LyricText.font-size = #1
     }
   }
  }
}
