\version "2.24.0"
sheetName = "Es führt über den Main"
sheetComposer = "Felicitas Kukuck, Magdalene Kemlein, Reinhard Simmgen"
\include "../include/book.ily"

% orig f
tran = f

dropA = {
\override LyricText.extra-offset = #'(0 . -10)
\override LyricHyphen.extra-offset = #'(0 . -10)
\override LyricExtender.extra-offset = #'(0 . -10)
\override StanzaNumber.extra-offset = #'(0 . -9)
\set stanza = \markup{ \right-brace #120 }
}

raise = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}


lyrA = {
  \lyricmode {
  \set stanza = #"1. "
  Es führt ü -- ber den Main
  ei -- ne Brü -- cke von 
  \set stanza = #"1. " Stein,
  wer da -- rü -- ber will geh'n
  muß im \set stanza = #"1. " 
  Tan -- ze sich dreh'n
  \dropA
  fa -- la -- la -- la -- la
  fa -- la -- la -- la.
  \raise
}}
lyrB = {
  \lyricmode {
  \set stanza = #"2. "
  Kommt ein Fuhr -- mann da -- her,
  hat ge -- la -- den gar 
  \set stanza = #"2. " schwer,
  sei -- ner Rös -- ser sind drei,
  und sie \set stanza = #"2. " 
  tan -- zen vor -- bei
}}
lyrC = {
  \lyricmode {
  \set stanza = #"3. "
  Und ein Bursch oh -- ne Schuh
  und in Lum -- pen da -- \set stanza = #"3. " zu,
  als die Brü -- cke er sah,
  ei wie \set stanza = #"3. " tanz -- te er da 
}}
lyrD = {
  \lyricmode {
  \set stanza = #"4. "
  Kommt ein Mäd -- chen al -- lein
  auf die Brü -- cke von \set stanza = #"4. " Stein,
  fasst ihr Röck -- chen ge -- schwind,
  und sie \set stanza = #"4. " tanzt wie der Wind
 }}
lyrE = {
  \lyricmode {
  \set stanza = #"5. "
  Und_der Kö -- nig _ in_Per -- son
  steigt he -- rab von seinem \set stanza = #"5. " Thron,
  kaum be -- tritt er das Brett,
  tanzt er \set stanza = #"5. " 
  gleich Me -- nu -- ett
}}
lyrF = {
  \lyricmode {
  \set stanza = #"6. "
  Liebe Leu -- te, _ her -- bei,
  schlagt die Brü -- cke ent -- 
  \set stanza = #"6. " zwei!
  Und sie schwan -- gen das Beil,
  und sie \set stanza = #"6. " 
  tanz -- ten der -- weil
}}
lyrG = {
  \lyricmode {
  \set stanza = #"7. "
  Alle Leu -- te _ im Land
  kom -- men ei -- lig ge -- \set stanza = #"7. " rannt.
  Bleibt der Brü -- cke doch fern,
  denn wir \set stanza = #"7. " 
  tan -- zen so gern
}}
lyrH = {
  \lyricmode {
  \set stanza = #"8. "
  Es führt ü -- ber den Main
  ei -- ne Brü -- cke von \set stanza = #"8. " Stein.
  Wir _ fas -- sen die Händ'
  und wir \set stanza = #"8. " 
  tan -- zen ohn' End
 }}

sopran = \relative c' {
  \voiceOne
  \time 3/4
  \key d \minor
  \partial 4
  %\bar "|."
  d4 
  e d8 e f4
  g2 d8 e
  f4 f g
  a2 bf8 c
  d4 d bf
  g2 a8 bf
  c4 c a
  f f8 e f g
  a4 g8 f e4
  d2 
  \bar "||" \break
  a'4 d4
  \repeat volta 2 {
    d8 c d c
    bf2 g4
    c4 c8 bf c bf
    a2 f4
    bf4 bf8 a bf a
    g4. e8
  } \alternative {
    { f8 g
      a2.~ a2 bf8[ c] d4 }
    { f,8 e 
      d2.~ d2 }
  }
  \bar "|."
}

alt = \relative c' {
  \voiceTwo
  d4 
  e d8 e f4
  g2 d8 e
  f4 d c
  f2 g8 a
  bf4 bf8( a) g( f)
  e( d c4) f8 g
  a4 a8( g) f( e)
  d4 d8 cs d bf
  a2 a'4
  d,2 
  f4
  bf4 bf8 a bf a
  g2 e4
  a4 a8 g a g
  f2 d4
  g4 g8 f g f
  e4. cs8
  d8 e
  f2.( fs2) g8[ a] bf4
  d,8 cs
  d2.~ d2
}


chrd =  \chordmode {
  s4
  d2.:m g:m d2:m c4 f2. g:m
  c f2 a4:7 d2:m g8:m c:7
  f2 a4:7 d2:m 
  s4
  d2.:m c f d:m g:m
  a2.:7 d:m d:7 g4:m
  s4 d2.:m s2
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
    \new ChordNames \transpose f \tran \chrd
    \new Staff <<
      \new Voice = "Sopran" \transpose f \tran \sopran
      \new Voice = "Alt"  \transpose f \tran  \alt 
    >>
    \new Lyrics \lyricsto "Sopran" \lyrA
    \new Lyrics \lyricsto "Sopran" \lyrB
    \new Lyrics \lyricsto "Sopran" \lyrC
    \new Lyrics \lyricsto "Sopran" \lyrD
    \new Lyrics \lyricsto "Sopran" \lyrE
    \new Lyrics \lyricsto "Sopran" \lyrF
    \new Lyrics \lyricsto "Sopran" \lyrG
    \new Lyrics \lyricsto "Sopran" \lyrH  
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
