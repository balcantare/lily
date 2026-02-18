\version "2.22.2"
fileName = "AmaniLeo.ly"
sheetName = "Amani Leo"
\include "../include/book.ily"

dropLyricsA = {
\override LyricText.extra-offset = #'(0 . -3)
\override LyricHyphen.extra-offset = #'(0 . -3)
\override LyricExtender.extra-offset = #'(0 . -3)
\override StanzaNumber.extra-offset = #'(0 . -2.5)
\set stanza = \markup{ \right-brace #50 }
}

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  A -- ma -- ni le -- o,
  a -- ma -- ni le -- o,
  a --
  \set stanza = #"1. "
  ma -- ni le -- o,
  \dropLyricsA
  tu -- me -- kom -- bo -- le -- wa.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Fu -- ra -- ha le -- o,
  fu -- ra -- ha le -- o,
  fu --
  \set stanza = #"2. "
  ra -- ha le -- o,

}}


lyrStropheC = {
  \lyricmode {
    \set stanza = #"3. "
   U -- pen -- do le -- o,
   u -- pen -- do le -- o,
   u --
   \set stanza = #"3. "
   pen -- do le -- o,
}}


strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key d \major
  \partial 8
  a8
  a8. fs16~ 8 d8
  g4 r8 a8
  a8. fs16~ 8 d8
  e4 r8 fs8
  fs8. e16~ 8 d
  g4 r8 g8
  fs8 fs e e
  d4 r8
  \bar "|."
}


stropheAlt = \relative c' {
  %\voiceTwo
  \key d \major
  fs8
  fs8. d16~ d8 a
  d4 r8 fs8
  fs8. d16~ d8 a
  cs4 r8 d8
  d8. cs16~ cs8 d
  d4 r8 d8
  d8 d cs cs
  d4 r8
}

chrdStrophe = \chordmode {
   s8
   d2 g d a d g d4 a d4
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC

    \new Staff <<
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    >>
    \layout {
      #(layout-set-staff-size 20)
    }
  }
}
