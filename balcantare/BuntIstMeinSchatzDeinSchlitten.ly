\version "2.24.0"
sheetName = "Bunt ist, mein Schatz, dein Schlitten"
%#(define book-staff-size 22)
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
  "\"Bunt" ist, mein Schatz, dein Schlit -- ten,
  und Glöck -- lein lus -- tig
  klin -- gen.
  Und_wo -- hin willst du denn fah -- ren
  mein al -- ler -- liebs -- ter "Schatz?\""
  "\"Das" sag ich "nicht.\""
 }}
lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    "\"Du" wirst dich schon be -- sin -- nen,
    du wirst mir's schon er -- zäh -- len,
    wo -- hin du jetzt willst fah -- ren,
    mein al -- ler -- lies -- ter "Schatz.\""
    "\"So" hö -- re denn:
  }
}
lyrStropheC = {
  \lyricmode {
    \set stanza = "3. "
    Zur Stadt hin will ich fah -- ren,
    um Sem -- meln ein -- zu -- kau -- fen,
    für je -- des Mäd -- chen ei -- ne,
    für mei -- ne Lieb -- ste zwei,
    ja Liebs -- te "zwei!\""
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = "0. "
    "\"Ha" pi -- sa -- ne su san -- ki
    a klin -- ko -- ta -- te kon -- je.
    A hdźe -- ha ty nětk jě -- dźeš,
    ty rja -- ny lu -- by "mój?\""
    "\"Ci" nje -- po -- "wěm.\""
}}

strophe = \relative c' {
  \accidentalStyle neo-modern-voice-cautionary
  \time 2/4
  \partial 8
  \key f \major
  f8
  c' c c f
  c4 a8 a
  c bf g bf
  a4 f8 f
  c'8 c c f
  c4 a8 a
  c8 bf a g
  f4 r8 f
  g8 c, f4
  r4 r8
  \bar "|."
}

chrdStrophe = \chordmode {
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    %ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}
