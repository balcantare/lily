\version "2.22.2"
sheetName = "We shall overcome"
\include "book.ily"


lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
  We shall o -- ver -- come,
  we shall o -- ver --
  \set stanza = "1. "
  come,
  we shall o -- ver -- come,
  some day. __
  Oh deep in my heart,
  I do be -- lieve,
  we shall o -- ver -- come,
  some day.
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
  We'll walk hand in hand,
  we'll walk hand in
    \set stanza = "2. "
  hand,
  we'll walk hand in hand,
  some day. __
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = "3. "
  Truth will make us free,
  truth will make us
    \set stanza = "3. "
  free,
  truth will make us free,
  some day. __
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = "4. "
  We are not a -- fraid,
  we are not a --
    \set stanza = "4. "
  fraid,
  we are not a -- fraid,
  to -- day. __
}}

lyrStropheE = {
  \lyricmode {
    \set stanza = "5. "
  We shall live in peace,
  we shall live in
    \set stanza = "5. "
  peace,
  we shall live in peace,
  some day. __
}}


strophe = \relative c'' {
  %\voiceOne
  \time 2/2
  \key c \major
  \bar "|."
  g4 g a a
  g4.( f8 e2)
  g4 g a a
  g4.( f8 e2)
  g4 g a b
  c2 d
  b( \tuplet 3/2 { a4 b a}
  g2) \bar "" \break a4( b)
  c2 b4 a
  g2. r4
  a2 g4 f
  e2. r4
  g g c, f
  e2 d
  c1
  \bar "|."
}

chrdStrophe = \chordmode {
  %\set chordBassOnly = ##t
  c2 f
  c1
  c2 f
  c1
  c2 g:/b
  a:m d
  g d
  g1
  f c
  f
  a1:m

  c2 f
  c g c
}

\bookpart {
  \paper {
    page-count = #1
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
  }
}
