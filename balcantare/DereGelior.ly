\version "2.22.2"
sheetName = "Dere Gelior"
\include "../include/book.ily"

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace70"
}
stanzaA = \markup {
  \column { \vspace #.33 "1. "}
  \leftbrace
}
stanzaB = \markup {
  \column { \vspace #.33 "2. "}
  \leftbrace
}
stanzaC = \markup {
  \column { \vspace #.33 "3. "}
  \leftbrace
}

dropLyrics = {
\override LyricText.extra-offset = #'(0 . -9)
\override LyricHyphen.extra-offset = #'(0 . -9)
\override LyricExtender.extra-offset = #'(0 . -9)
\override StanzaNumber.extra-offset = #'(0 . -9)
}

raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}

lyrStropheA = {
  \lyricmode {
  \set stanza = \stanzaA
  De -- re ge -- li -- or de -- re
  \dropLyrics
  ya -- le -- le ya -- le -- le
  \raiseLyrics
  \set stanza = \stanzaA
  Ku -- mu -- nu se -- re se -- re
  \dropLyrics
  ya -- le -- le -- lim.
  \raiseLyrics
  A -- man a -- man a -- man
  sa -- ma -- nin sa -- man sa -- man
  ya -- rin ol -- du -- ğu de -- re
  ya -- le -- le -- lim.
  }}

lyrStropheB = {
  \lyricmode {
  %\set stanza = \stanza
  Al be -- ni gö -- tür de -- re
  \repeat unfold 6 {\skip 8}
  ya -- rin ol -- du -- ğu
  de -- re
}}


lyrStropheC = {
  \lyricmode {
    \set stanza = \stanzaB
    Ben ar -- mu -- du dis -- le -- dim
    \repeat unfold 6 {\skip 8}
    \set stanza = \stanzaB
    Sa -- pi -- nı gü -- müs -- le -- dim
}}

lyrStropheD = {
  \lyricmode {
    Ben ya -- rı -- mın is -- mi -- ni
    \repeat unfold 6 {\skip 8}
    Men -- di -- li -- me
    is -- le -- dim
  }
}
lyrStropheE = {
  \lyricmode {
    \set stanza = \stanzaC
    Ar -- mut dal -- da
    bir i -- ki
    \repeat unfold 6 {\skip 8}
    \set stanza = \stanzaC
    sa -- yın ba -- kın
    a -- ni -- ki
    }}

lyrStropheF = {
  \lyricmode {
    Gü -- zel -- le -- rim
    i -- çin -- de
    \repeat unfold 6 {\skip 8}
    Be -- nim ya -- rım
    gü -- li -- ç

}}

strophe = \relative c'' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 9/8
  \key e \minor
  \repeat volta 2 {
  a8[ a] b[ b] b4 a8 g4
  b8[ a] a[( fs]) g4 fs8 e4
  e8[ fs] g[ a] a4 fs8 g4
  fs8 e e4 e4. r4 }
  \repeat volta 2 {
    a8 b4. b8 b a8 g4
    b8[ a] a[( fs]) g[ g] fs e4
    d8[ fs] g[ a] a4 fs8 g4
    fs8 e e4 e4. r4 }
   \bar "|."
}

chrdStrophe = \chordmode {
  e1:m s8
  d2.. c4
  s2 d2 s8
  c1 s8
  e1:m s8
  d2.. c4
  s2 d2 s8
  c1 s8

 }

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1.7))
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \strophe }
      >>
    \new	Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    >>
  }
}
