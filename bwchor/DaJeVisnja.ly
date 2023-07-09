\version "2.22.2"
fileName = "DaJeVisnja.ly"
sheetName = "Da je višnja"
\include "book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Da je viš -- nja ko treš -- nja.
  Ja bi' bi -- la naj -- lep -- ša.
  A -- li viš -- nja ma -- lo ki -- si,
  slat -- ko la -- ne di si?
  A -- li viš -- nja ma -- lo ki -- si,
  slat -- ko la -- ne di si?
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Slat -- ko la -- ne di si ti?
  Vo -- le -- la -- b'te
  vi -- de -- ti.
  Vo -- le -- la -- b'te
  vi -- det' di -- ko,
  al' da ne zna ni -- ko.
  Vo -- le -- la -- b'te
  vi -- det' di -- ko,
  al' da ne zna ni -- ko.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Dve ja -- bu -- ke tri du -- nje.
  Na or -- ma -- nu i -- stru -- le.
  I -- stru -- le su
  sta -- ja -- ju -- či,
  di -- ku če -- ka -- ju -- či.
  I -- stru -- le su
  sta -- ja -- ju -- či,
  di -- ku če -- ka -- ju -- či.
}}

strophe = \relative c'' {
  \voiceOne
  \time 3/2
  \key c \major
  \partial 2
  g4 g8( a)
  f4.( e8) d2 e8 c4.
  d1 g4 g8( a)
  f4.( e8) d2 e8 c4.
  d1 f4. g8
  a2 a g4 g8( a)
  f4.( e8) d2 e4 c
  g'2 f4( g) e4( d8 c)
  d1 f4. g8 a2 a g4 g8( a)
  f4.( e8) d2 e4 c
  g'2 f4( g) e( d8 c)
  d1
  \bar "|."
}

stropheAlt = \relative c'' {
  \voiceTwo
  e,4 e8( f)
  d4.( c8) b2 c8 c4.
  b1 e4 e8( f)
  d4.( c8) b2 c8 c4.
  b1 c4. e8
  f2 f e4 e8( f)
  d4.( c8) b2 c4 c
  e2 d4( e) c2
  b1
  c4. e8 f2 f e4 e8( f)
  d4.( c8) b2 c4 c
  e2 d4( e) c2
  b1
}

stropheBass = \relative c' {
  \clef "treble_8"
  c4 c
  g2 g c8 c4.
  g1 c4 c
  g2 g c8 c4.
  g1 c4. c8
  c2 c c4 c4
  g2 g g4 g4
  c2 g a
  g1 c4. 8
  c2 c c4 c4
  g2 g2 g4 g4
  c2 g a
  g1
}

chrdStrophe =  \chordmode {
  c2
  g1 c2
  g1 c2
  g1 c2
  g1 f2
  f1 c2
  g1 c2
  c2 g c
  g1 f2
  f1 c2
  g1 c2
  c2 g c g1
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
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
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Staff <<
      \new Voice = "Basso" { \stropheBass }
      >>
    >>
  }
}
