\version "2.24.2"
sheetName = "Lieb' ein Mädchen"
sheetComposer = "Karusell"
\include "../include/book.ily"

skipA = \repeat unfold 10 {\skip 8}

lyrStropheA = {
  \lyricmode {
    #skipA
  \set stanza = #"1. "
  Lieb' ein Mäd -- chen mit Son -- ne im Ge -- sicht,
  \set stanza = #"1. "
  steht am Fließ -- band die gan -- ze lan -- ge Schicht
  \set stanza = #"1. "
  steht sie am Fließ -- band und macht den ei -- nen Griff,
  \set stanza = #"1. "
  bis ihn be -- en -- det _ der Si -- re -- ne Pfiff.
  
  Doch mit dem Kopf kann sie ma -- chen was sie will,
  denn der Kopf hat im -- mer frei da -- bei.
  Der baut Ge -- schich -- ten und Schlös -- ser in der Still'.
  Und die zeigt sie mir am A -- bend, wenn sie will.
  Und hat dann auch die Hän -- de wie -- der frei.

}}


lyrStropheB = {
  \lyricmode {
    \skipA
    \set stanza = #"2. "
    Hat zwei Hän -- de, die wis -- sen was sie soll'n,
    \set stanza = #"2. "
    manch -- mal mü -- de und manch -- mal an -- ge -- schwoll'n.
    \set stanza = #"2. "
    An die acht Stun -- den, _ hat man die pas -- siert,
    \set stanza = #"2. "
    weiß man kaum, wie man noch sei -- ne Ga -- bel führt.
}}


lyrStropheC = {
  \lyricmode { \skipA
  \set stanza = #"3. "
  Lieb' ein Mäd -- chen, das bes -- te was ich krieg'.
  \set stanza = #"3. "
  Geht nicht gern, doch sie geht in die Fa -- brik.
  \set stanza = #"3. "
  Und ih -- re war -- me, er -- fin -- de -- ri -- sche Hand
  \set stanza = #"3. "
  wird zur Ma -- schi -- ne acht Stun -- den lang am Band. 
}}




strophe = \relative c' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key b \minor
  \bar ".|:"
  \repeat volta 2 {
  %\mark \markup{\fontsize #4 *}
  r8 <d g b d>~ 16 8. 
  \override Stem.details.beamed-lengths = #0
  <d fs a cs>8. 16~ 8 8
  \revert Stem.details.beamed-lengths
  r8 <d e g b>~ 16 8. <d fs a>8. 16~ 8 8 }
  \break
  r8 b'~ 16 8. a4 g8 fs
  e8 d16 e~ e d fs8~ 2
  r8 b~ 16 8. a4 g8 fs
  e8 d16 e~ e d d8~ 2
  r8 b' b b a4 g8 fs 
  e8 d16 e~ e d fs8~ 2 
  r8 b b b a4 g8 fs 
  e8 d16 e~ e d d8~ 2
  \break
  r8 b'8 16 8. a4 fs8 e
  d8 b16 d~ d b fs'8~ 2
  r4 fs8 16 16~ 8 e8 d16 e8.
  fs8 g16 fs~ fs2.
  r8 d d b' a4 fs8 e
  d8 b16 d~ d b fs'8~ 2
  r4 b8 b b b16 cs16~ 8 d8
  cs8 a a fs16 a16~ 4 fs8 a
  a4( g16 fs g fs~) fs2
  r4 d8 fs16 g16~ 8 fs8 e d~
  %\mark \markup{\fontsize #4 *}
  <<
    { \voiceTwo d8 d4. r2 r1 }
    \new Voice {
      \voiceOne  
      r8 b'~ 16 b8. a8. a16~ a8 a
      r8 g~ 16 8. fs8. 16~ 8 8
    }
  >>
  \bar "|."
}

chrdStrophe = \chordmode {
  g2:/d fs:m/d e:m/d d
  g fs:m e:m  d  g fs:m  e:m d
  g fs:m e:m  d  g fs:m  e:m d
  b2:m fs:m g d4 a b1:m d2 g4 d8 a
  b2:m fs:m g d2 b1:m fs:m
  d1 g2 a g
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
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
