\version "2.24.0"
sheetName = "O du stille Zeit"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
  O du stil -- le Zeit,
  kommst eh wir's ge -- dacht,
  ü -- ber die Ber -- ge weit,
  ü -- ber die Ber -- ge weit,
  gu -- te Nacht!
  ü -- ber die Ber -- ge weit,
  ü -- ber die Ber -- ge weit,
  gu -- te Nacht!

}}

lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    In der Ein -- sam -- keit
    rauscht es nun so sacht,
}}

stropheSopran = \relative c' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 3/2
  \key f \major
  c4 f f g a2
  f4( g a) c bf a
  \time 2/2
  g1 \break
  \time 3/2
    a4 bf8 c d4 c a2
    f4 g8 a bf4 a f2
    c'2( a4 f g) g
    \time 2/2
    f1 \break
  \time 3/2
    a4 bf8 c d4 c a2
    f4 g8 a bf4 a f2
    c'2( a4 f g) g
    \time 2/2
    f1
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  c4 c a c f2
  a,4( c f) a g f
  c1
  f4 g8 a bf4 a f2
  d4 e8 f g4 f d2
  a'2( f4 c d) e
  s1 % f1
  f4 g8 a bf4 a f2
  d4 e8 f g4 f d2
  a'2( f4 c d) e
  s1 % f1
}

chrdStrophe = \chordmode {
  f2 c f
  s1 bf2
  c1
  f2 bf f
  d:m g:m d:m
  f1 c2
  f1
  f2 bf f
  d:m g:m d:m
  f1 c2
  f1
  }

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1.2))
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
    >>
    %\layout {
    %  \context {
    %    \Lyrics
    %    \override LyricText.font-size = #1
    %  }
    %}
  }
}
