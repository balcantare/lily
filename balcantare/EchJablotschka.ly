\version "2.24.0"
sheetName = "Ech Jablotschka"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    \set stanza = #"1. "
  Ech, ja -- blotsch -- ka, ty sa -- lo -- tis -- to -- e.
  \set stanza = #"1. "
  Ja poi -- du po -- gul -- jatch
  W‿pol -- je__ tschis -- to -- e.
  \set stanza = #"1. "
  Ja poi -- du po -- gul -- jatch
  W‿pol -- je__ tschis -- to -- e.
  Daj, daj di -- di daj__ daj__ daj__ di -- di daj
  daj daj di -- di daj,
  daj, daj daj daj daj daj da -- daj
  daj daj, di -- di daj daj daj daj daj daj daj daj!
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = #"2. "
  Ech, ja -- blotsch -- ka, ku -- da ty ka -- tischs -- ja?
  \set stanza = #"2. " 
  W‿kor -- si -- nu po -- poi -- djosch
  Nje wo -- ro -- tischs -- ja.
  \set stanza = #"2. "
  W‿kor -- si -- nu po -- poi -- djosch
  Nje wo -- ro -- tischs -- ja.
}}

alt = \relative c'' {
  \voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key a \minor
  a2^\fermata \breathe a |
  e8( f8) g2 e4 |
  f4( d) a'( f) |
  e8 d c2. | %\break
  d4 d d2 |
  a8 b c2. |
  b4( a) b( c) |
  a b c( cs) |% \break
  d4 d d2 |
  a8 b c2. |
  b4( a) b( c) |
  a a a2 \bar "||" | \break
  a'2 a |
  e8 f8 g2( e4) |
  f4( d) a'( f) |
  e8 d c2. | %\break
  d2 d |
  a8 b c2. |
  b4 a b c |
  a b c e | %\break
  d2 d
  a8 b c2.
  b4 a b c
  a a a2
\bar "|."
}

sopran = \relative c'' {
  \voiceOne
  \accidentalStyle neo-modern
  r2 a2 
  e8( f) g2 e4
  f( d) a'( b)
  c8 b a2.
  f4 f f2
  e8 d c2.
  d4( f) e( gs)
  a a a( g)
  f4 f f2
  e8 d c2.
  d4( f) e( gs)
  a4 a a2
  c2 c 
  cs cs
  d d
  c8 b a2.
  gs2 gs
  a a
  gs gs 
  a4 e' e cs
  d2 d
  c8 b a2.
  gs2 gs2
  a a
}

bass = \relative c {
  \clef "bass"
  \accidentalStyle neo-modern
  r1 r2. e4
  f2 d
  c8 b a2.
  b4 b b2
  a8 a a2.
  gs2 gs
  a4 e' e ef
  d4 d d2
  c8 b a2.
  gs2 gs
  a4 a a2
  e' a,
  cs e
  d b
  c8 b a2.
  b2 d
  c a
  gs e
  a4 g f a
  d2 b
  a8 a c2.
  d2 e
  a,2 a
  
}


chrdStrophe = \chordmode {
  a1:m a d:m a:m  d:m a:m
  e:7 a2.:m a4 d1:m a:m e:7 a:m

  a1:m a d:m a:m  d:m a:m
  e:7 a2.:m a4 d1:m a:m e:7 a:m

 }

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##f
  }
  \bookItem 
  \score {
    <<
    \new ChordNames \chrdStrophe 
    \new Staff <<
      \new Voice = "Sopran" \sopran 
      \new Voice = "Alt" \alt 
    >>
    \new	Lyrics \lyricsto "Alt" \lyrStropheA
    \new	Lyrics \lyricsto "Alt" \lyrStropheB
    \new Staff <<
       \new Voice \bass 
    >>
    >>
  }
}
