\version "2.22.2"
fileName = "EchJablotschka.ly"
sheetName = "Ech Jablotschka"
\include "book.ily"

lyrStropheA = {
  \lyricmode {
  Ech, ja -- blotsch -- ka, ty sa -- lo -- tis -- to -- e.
  Ja poi -- du po -- gul -- jatch
  W__pol -- je__ tschis -- to -- e.
  Ja poi -- du po -- gul -- jatch
  W__pol -- je__ tschis -- to -- e.
  Daj, daj di -- di daj__ daj__ daj__ di -- di daj
  daj daj di -- di daj,
  daj, daj daj daj daj daj da -- daj
  daj daj, di -- di daj daj daj daj daj daj daj daj!
}}

lyrStropheB = {
  \lyricmode {
  Ech, ja -- blotsch -- ka, ku -- da ty ka -- tischs -- ja?
  W__kor -- si -- nu po -- poi -- djosch
  Nje wo -- ro -- tischs -- ja.
  W__kor -- si -- nu po -- poi -- djosch
  Nje wo -- ro -- tischs -- ja.
}}

strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key a \minor
  a2^\fermata \breathe a |
  e8( f8) g2 e4 |
  f4( d) a'( f) |
  e8 d c2. | \break
  d4 d d2 |
  a8 b c2. |
  b4( a) b( c) |
  a b c( cs) | \break
  d4 d d2 |
  a8 b c2. |
  b4( a) b( c) |
  a a a2 | \break

  a'2 a |
  e8 f8 g2( e4) |
  f4( d) a'( f) |
  e8 d c2. | \break
  d2 d |
  a8 b c2. |
  b4 a b c |
  a b c e | \break
  d2 d
  a8 b c2.
  b4 a b c
  a a a2

\bar "|."
}

chrdStrophe = \chordmode {
  a1:m a d:m a:m  d:m a:m
  e:7 a:m d:m a:m e:7 a:m

  a1:m a d:m a:m  d:m a:m
  e:7 a:m d:m a:m e:7 a:m

 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.35))
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
      >>
    \new	Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    >>
  }
}
