\version "2.22.2"
fileName = "HinehMatov.ly"
sheetName = "Hineh Matov"
\include "book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"h) "
  Hi -- neh ma -- tov u -- ma -- na -- him,
  \set stanza = #"h) "
  she -- vet a -- chim gam -- ja -- chad.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"h) "
  Hi -- neh ma -- tov,
  \set stanza = #"h) "
  she -- vet a -- chim gam -- ja -- chad.
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"d) "
  Tromm -- le mein Herz für das Le -- ben,
  \set stanza = #"d) "
  sin -- ge mein Mund dem Frie -- den,
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = #"d) "
  Daß die Er -- de
  \set stanza = #"d) "
  hel -- ler und wär -- mer wer -- de!
}}

strophe = \relative c' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 3/4
  \key d \minor
  d4 d d
  d d d
  g2.
  f
  e4 d e
  f2 e4
  d2. d
  % \bar "|."
}

stropheAlt = \relative c'' {
  %\voiceTwo
  \key d \minor
  a2. d
  c2( bf4)
  a2.
  g4 f a
  c2 d4
  a2. a
}

chrdStrophe = \chordmode {
  d2.:m s
  g:m d:m c s d:m
}

\bookpart {
  \paper {
    %ragged-right = ##f
    page-count = #1
    #(define fonts (book-font 1.6))
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Staff <<
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheB
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheD
    >>
  }
}
