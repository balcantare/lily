\version "2.24.0"
sheetName = "Unser Kreis, der sei offen"
sheetComposer = "trad. Wicca-Kult, UK"
sheetPoet = "dt. Unmada Manfred Kindel"
\include "../include/book.ily"


lyrStropheA = {
  \lyricmode {
  Un -- ser Kreis, der sei of -- fen,
  a -- ber un -- ge -- bro -- chen.
  Lasst den Frie -- den der Er -- de
  in uns -- ren Her -- zen sein.
  Fröh -- lich kommt und fröh -- lich geht!
  Freut euch auf's Wie -- der -- seh'n.
}}
lyrStropheB = {
  \lyricmode {
    May the circ -- le be o -- pen,
    but _ un -- _ bro -- ken.
    May the peace of the god -- dess be_for -- e -- ver in your heart.
    Mer -- ry meet and mer -- ry part.
    _ Mer -- ry meet a -- gain.
}}

strophe = \relative c'{
  \time 4/4
  \key d \minor
  \partial 4
  d8 c
  d4 d8 c d( f) f4
  e8 d c e d[ a] \break a a
  d4 d8 c d( f) f g16( f)
  e8 d c e d2
  f4 g a r8 \break a
  g( f) e( g) f4 r8 f8
  f4 a g8( f) e4
  d2.
  \bar "|."
}

chrdStrophe = \chordmode {
  s4
  d1:m c2 d:m d:m bf c d:m
  f4 c f s
  a2:m d:m bf c d:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.6))
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
    >>
    \layout {
      \context {
        \Lyrics
        \override LyricText.font-size = #+1
      }
    }
    %\midi {}
  }
}
