\version "2.24.0"
sheetName = "Ein Tännlein schlief zur Winternacht"
sheetComposer = "Maria-Anita Görischk"
\include "book.ily"

lyrStropheA = {
  \lyricmode {
    \set stanza = "1. "
    Ein Tänn -- lein schlief zur Win -- ter -- nacht
    \set stanza = "1. "
    tief in des Wal -- des Ruh!
    \set stanza = "1. "
    Die wei -- ßen Flo -- cken fie -- len sacht 
    \set stanza = "1. "
    und deck -- ten _ al -- les zu.
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    Im Zwei -- ge fing ein Vö -- ge -- lein 
    \set stanza = "2. "
    so lieb -- lich an zu singen,
    \set stanza = "2. "
    und sei -- ne sü -- ße Me -- lo -- dei
    \set stanza = "2. "
    tat sich gar _ weit -- hin schwingen. 
 }}


lyrStropheC = {
  \lyricmode {
  \set stanza = "3. "
  Das Vög -- lein sang die hal -- be Nacht
  \set stanza = "3. "
  auf sei -- nem Äs -- te -- lein,
  \set stanza = "3. "
  da ist die Er -- de auf -- ge -- wacht 
  \set stanza = "3. "
  und trug ei -- nen hel -- len Schein.
}}

strophe = \relative c' {
  \time 4/4
  \partial 4
  \key g \major
  d4 
  b' b g g
  a a d, \break d'
  c c b g
  a2. \break 
 \repeat volta 2 {
  d4 |
  b d e d
  c b a \break d
  b a8 g a4 a
  g2.
 }
 %\bar "|."
}

chrdStrophe = \chordmode {
  s4
  g1 d a2:m g
  d1 g2 a:m c d e:m c4 d
  g2.
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
  }
  \bookItem
  \score {
    <<
    \new ChordNames \transpose g d \chrdStrophe 
    \new Staff <<
      \new Voice = "Strophe" \transpose g d \strophe
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}