\version "2.24.0"
sheetName = "Das Lächeln"
sheetComposer = "Beate Tarrach"
\include "../include/book.ily"

lyrA = {
  \lyricmode {
  \set stanza = "1. "
  Ein Lä -- cheln zieht heut' in die Welt,
  \set stanza = "1. "
  und kei -- ner hat es je be -- stellt.
  Und trotz -- dem macht es je -- den froh,
  \set stanza = "1. "
  der es sieht, und der singt dann ein -- fach so
  ein fro -- hes Lied: la la la la la la la
  la la la la la la la la la la  la la la la la la la la la la
  la la la la
}}

lyrB = {
  \lyricmode {
  \set stanza = "2. "
  Und je -- der singt ein fro -- hes Lied,
  \set stanza = "2. "
  das mit dem Lä -- cheln wei -- ter zieht,
  und kommt das Lä -- cheln mal zu dir, 
  \set stanza = "2. " sag es mir,
  und wir sin -- gen ein -- fach
  so ein fro -- hes Lied:
}}

lyrC = {
  \lyricmode {
  \set stanza = "3. "
  Und kommt das Lä -- cheln auch zu dir,
  \set stanza = "3. "
  dann halt es fest und zeig es mir!
  Und lässt du es dann wie -- der los, 
  \set stanza = "3. " fliegt es fort
  und es klingt an je -- dem Ort
  ein fro -- hes Lied:
 }}



voice = \relative c'' {
  %\voiceOne
  \time 4/4
  \key c \major
  \partial 8
  g8 
  c g g g g a4 g8~
  g2. r8 \break g8
  d' g, g g a4 g8 g~
  g2. r8 c,
  f8 f f g a4 b8 c~
  4 b8 a g4 e8 f
  g4 g b8 c4 d8~
  4 4 e d
  c4 \break
  g8 c a4 c8 g~
  8 e4 c8 f4 g8 f
  e4 d8 c d4 b8 c~
  c4 c' a c8 g~
  g8 e4 c8 f4 g8 f
  e4 d8 c d4 b8 c~
  c2. r8
  \bar "|."
}

chrd = \chordmode {
  %\set chordBassOnly = ##t
  s8 
  c1 g s c f c s g c2 f2 c2 f c g c f c f c g c
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    %ragged-last-bottom =  ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrd }
    \new Staff <<
      \new Voice = "Strophe" { \voice }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrA
    \new Lyrics \lyricsto "Strophe" \lyrB
    \new Lyrics \lyricsto "Strophe" \lyrC
    >>
  }
}
