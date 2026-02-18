\version "2.24.2"
sheetName = "Faules Burschenpack"
sheetComposer = "trad. tschechisch"
\include "../include/book.ily"

skipA=\repeat unfold 16 \skip 8

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  

}}

lyrStropheB = {
  \lyricmode {

}}


lyrStropheC = {
  \lyricmode {

}}

lyrStropheD = {
  \lyricmode {

}}

lyrStropheE = {
  \lyricmode {

}}

strophe = \relative c' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key a \major
  cs8 e e e
  cs e e e
  cs'4 b a gs
  d8 fs fs fs
  d fs fs fs
  a4 gs fs e
  \repeat volta 2 {
    cs8 e e e
    e e e e
    d fs fs fs
    fs fs fs fs
    d'4 cs b a
    gs8 fs gs4
    a4 r
  }
 \bar "|."
}


chrdStrophe = \chordmode {
  a2 s s s b:m s s e a s d s e:7 s s a
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##t
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

    \layout {
      #(layout-set-staff-size 20)
    }
  }
}
