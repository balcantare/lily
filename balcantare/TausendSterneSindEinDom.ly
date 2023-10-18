\version "2.24.0"
sheetName = "Tausend Sterne sind ein Dom"
sheetComposer = "Siegfried Köhler"
\include "../include/book.ily"


lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
  Tau -- send Ster -- ne sind ein Dom
  in stil -- ler, wel -- ten -- wei -- ter Nacht.
  Ein Licht blüht _ auf im Ker -- zen _ -- schein,
  das uns um -- fängt und glück _ -- lich macht.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = "2. "
  All dies Schwei -- gen macht uns froh,
  ein Leuch -- ten durch die Her -- zen geht.
  Und sil -- bern _ schwingt der ho -- he _ Dom,
  vom Hauch der Weih -- nacht still _ um -- weht.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = "3. "
  Al -- les Dun -- kel sinkt hin -- weg,
  wir ha -- ben un -- ser
  Licht ent -- facht. Es leuch -- tet _ uns zum
  neu -- en _ Jahr
  in tie -- fer, stern -- ver -- klär _ -- ter
  Nacht.
}}

stropheSopran = \relative c' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/4
  \key c \major
  e4 e g g
  a a e4. e8
  g4 g c c
  f f d4. d8
  e4 d8 e c4 c
  d4 c8 d b4 \breathe e,
  a4 a c c
  d8 c b4 c2
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  c4 c d b
  c d8 c b4 \breathe c
  d8 e f4 e8 f g4
  a4 a b4. b8
  b4 b a a8 g
  f4 f d c
  c d g e
  a d, e2
}

stropheBass = \relative c' {
  \clef "bass"
  c4 c b g
  f f g a
  b8 c d4 c e,
  e4 e8 d g4. g8
  c,4 e f e
  d d g a8 g
  f4 f e8 g a g
  f4 g <g c,>2
}
chrdStrophe = \chordmode {
  c2 g
  f c
  g a:m
  d:m g
  c f
  d:m6 g4 a:m
  f2 c
  d4:m g c2
}

\bookpart {
  \paper {
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
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheC
      \new Staff <<
        \new Voice = "StropheBass" {  \stropheBass }
      >>
    >>
    %\layout {
    %  \context {
    %    \Lyrics
    %    \override LyricText.font-size = #1
    %  }
    %}
  }
}
