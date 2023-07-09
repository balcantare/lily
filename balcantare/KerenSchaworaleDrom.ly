\version "2.22.2"
sheetName = "Keren, Schaworale, Drom"
\include "book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Kē -- ren, ša -- vo -- ra -- le drom,
  te khē -- lel o pu -- ro rom,
  %\set stanza = #"1. & 3."
  aj la la la la la la la la laj laj laj
  \set stanza = #"1. "
  o_pu -- ro rom te khe -- le -- la
  a -- ma -- ri vo -- ja ker -- la.
  %\set stanza = #"1. - 4. "
  aj la la la la la la la laj laj laj

}}

skipA = \repeat unfold 12 { \skip 2 }

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Du -- j du -- j de -- šu -- duj,
  cšu -- mi -- dav -- me la -- ko muj,
  \skipA
  \set stanza = #"2. "
  la -- ko  muj szi ru -- pu -- no,
  taj o ša -- vo szom -- na -- kuno.
}}

skipA = \repeat unfold 12 { \skip 2 }

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  A -- ma -- ri szi, a -- ma -- ri,
  A -- ma -- ri ci -- ni bó -- ri,
  \skipA
  \set stanza = #"3. "
  A -- lo ma -- lo ma -- lo ma
  A -- lo ma -- lo ma -- lo ma
}}

lyrStropheD = {
  \lyricmode {
   \set stanza = #"4. "
   tai na na na_na tai na na
   tai le le ti tai  na na_na
   \skipA
   \set stanza = #"4. "
   Hoi, te -- mē -- rau, te mē -- rau
   te nā tscha -- tschi -- po pe -- nau!
}}

strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key a \minor
  c8 c c c |
  e8 e c4 |
  e8 e e c |
  a a f4 | \break
  r8 f8 f16 e f a |
  a8 a c a |
  e8 e4. |
  e4 r | \break
  c'8 c d c |
  a8 a f4 |
  a8 a b a |
  e e c4 | \break
  d4 d16 e f8 |
  g8 e  c[ b] |
  a8 a4. |
  a4 r |
  \bar "|."
}

chrdStrophe = \chordmode {
  a2:m s s s4 d:m
  d2:m s e s
  a:m s4 d:m s2 a:m
  d:m s4 e:7 a2:m s
}

\bookpart {
  \paper {
    #(define fonts (book-font 1.4))
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
