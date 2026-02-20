\version "2.24.0"
sheetName = "Evening rise - Abendlied"
sheetComposer = "Satz Ch. Bollmann"
\include "../include/book.ily"

lyrA = {
  \lyricmode {
  Eve -- ning rise, spi -- rit come,
  sun goes down when the day is done.
  Mo -- ther earth a -- wa -- kens me
  with the heart -- beat of the sea.
}}

lyrB = {
  \lyricmode {
  Sanf -- te Brise, A -- bend -- wind,
  still mein Herz, die _ Nacht be -- ginnt.
  Ne -- bel legt sich ü -- ber's Feld
  und zur Ru -- he geht die Welt.

}}


sopran = \relative c' {
  \time 4/4
  \key a \minor
  a4 e' e2
  d4 e a,2
  c4 c b c8 b
  a4 e' e2
  a,4 e' e4. e8
  d4 e a, a8 b
  c4 c b c8( b)
  a1
  \bar "|."
}

alt = \relative c' {
  a4. a8 b2
  c8( b) c( d) e2
  a4. e8 d4 g8 f
  f8( e) d( c) d2
  %\override Rest.staff-position = #-7
  r4 \tuplet 3/2 {a8( b c)} b4~ \tuplet 3/2 {b8 c( d)}
  c8( b) c( d) e2
  a4 e8( d) g4 e8( d)
  <b e>1
}

tenor = \relative c' {
  \key a \minor
  \clef "bass"
  \voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  a4 a gs2
  g4 g fs2
  f4 f g e8 g
  a4 a b2
  a4 a gs4. gs8
  g4 g fs fs8 fs
  f4 f g e8( g)
  a1
}

bass = \relative c {
  \voiceTwo
  a1~ a~ a~ a~ a~ a~ a~ a
}

chrdStrophe = \chordmode {
  a2:m e
  g a:m6 
  f g
  a:m e
  a:m e
  g a:m6
  f g
  a:m9
  
}

\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \score {
    \layout {#(layout-set-staff-size-with-jazz 20)}
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Sopran" { \sopran }
    >>
    \new Lyrics \lyricsto "Sopran" \lyrA
    \new Lyrics \lyricsto "Sopran" \lyrB
    \new Staff <<
      \new Voice = "Alt" { \alt }
      >>
    \new Staff <<
      \new Voice = "Tenor" { \tenor }
      \new Voice = "Basso" { \bass }
      >>
    >>
  }
}
