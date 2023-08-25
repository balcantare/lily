\version "2.22.2"
sheetName = "Schuka his o ziro"
sheetPoet = "Hans Lauenberger"
sheetComposer = "Sinti Swing Quartett"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  Schu -- ka his o dji -- pen ab kuja plat -- za __
  kai gi -- wal tu man -- gi mi -- ri gie -- li __
  i tu ti kal ab man -- di hos -- ki krä -- tu ko -- wa __
  tu dji -- nä doch kai me man -- gi dja -- wa
  ha schu -- ka his  doch ko -- wa zi -- ro __
  kui kai hams men -- gi lau -- ter ket -- ni __
  mej dje -- nab -- les har walz ko -- wa kor die -- wes
  ko -- wa hie doch man -- gi net so rah.
  Und tu __ ti kal ab man -- di __
  mei dje -- nam net kai me man -- gi dja. __
  Und tu __ gi -- wal mu
  gie -- li __ mej die -- num net
  hoj mej pu -- ta krah __
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key a \minor
  e8 a b c b a e c
  g' f~ f2.
  d8 g a b a g a b
  e,8 e~ e2. \break
  d8 d e f \tuplet 3/2 { a4 c b }
  b8 a e c b a4 r8
  c'8 c c c c d~ \tuplet 3/2 { d8 c d }
  b4 b2. \break
  r8 a8~ \tuplet 3/2 { a8 a bf } a8 g8~ \tuplet 3/2 { g8 f e }
  g8 f~ 4 r2
  d8 g a b \tuplet 3/2 { a4 g b }
  e,8 e~ e4 r2 \break
  r4 d8 f a8 c4 b8
  b8 a e c b a4 r8
  c'8 c c c b a gs b
  a2. a4 \break
  a1~
  a2 \tuplet 3/2 { c4 b a }
  \tuplet 3/2 { b4 g2~ } g2~
  g2 \tuplet 3/2 { e4 f g } \break
  f2. r8 e8
  e2. \tuplet 3/2 { r8 d c }
  e1~
  e2 a \break
  a1~
  a2 \tuplet 3/2 { d4 b a }
  \tuplet 3/2 { b4 g2~ } g2~
  g2 \tuplet 3/2 { e4 f g } \break
  f2. r8 f
  e2. \tuplet 3/2 { r8 gs e }
  a1~ a
  \bar "|."
}

chrdStrophe = \chordmode {
  a2:m a:7 d1:m g c2 a:7
  d1:m a:m d:m7 e:7
  a2:m a:7 d1:m g c2 a:7
  d1:m a:m d2:m7 e:7
  a:m a:7 d1:m7 g c a:7
  d:m e:7 a:m a:7 d:m7 g
  c a:7 d:m e:7 a:m
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \strophe }
      >>
    \new	Lyrics \lyricsto "Strophe" \lyrStropheA
    >>
  }
}
