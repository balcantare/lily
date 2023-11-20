\version "2.24.0"
sheetName = "Veseli se Majko Božja"
sheetComposer = "kroatisch"
\include "../include/book.ily"

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace75"
}
stanzaA = \markup {
  \column { \vspace #.4 "1. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaB = \markup {
  \column { \vspace #.4 "2. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaC = \markup {
  \column { \vspace #.4 "3. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaD = \markup {
  \column { \vspace #.4 "4. "}
  \column { \vspace #.2 \leftbrace }
}

lyrStropheA = {
  \lyricmode {
  \set stanza = \stanzaA
  Ve -- se -- li se Maj -- ko
  Bož -- ja pu -- na mi -- lo -- sti
  \set stanza = "1. "
  Jer si no -- ćas po -- ro -- di -- la
  svo -- jim mlje -- kom
  \set stanza = "1. "
  za -- do -- ji -- la
  Bo -- ga ma -- la -- na,
  Bo -- ga ma -- la -- na.
}}

lyrStropheB = {
  \lyricmode {
    Ve -- se -- li se i ra -- duj -- se
    raj -- ska svjet -- lo -- sti.
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = \stanzaB
    Ve -- se -- li se jer ka -- ko
    si vaz -- da že -- lje -- la
    \set stanza = "2. "
    Dje -- vi -- com si vaz -- da bi -- la,
    Dje -- vi -- com si,
    \set stanza = "2. "
    po -- ro -- di -- la
    Bo -- ga na -- še -- ga,
    Bo -- ga na -- še -- ga.
}}

lyrStropheD = {
  \lyricmode {
    Ra -- di če -- sa sva -- ga
    Bo -- ga sved si mo -- li -- la.
}}

lyrStropheE = {
  \lyricmode {
    \set stanza = \stanzaC
    Ve -- sel -- mo se i mi
    bra -- zo ov -- dje za -- jed -- no.
    \set stanza = "3. "
    Svi se grije -- ha
    o -- dre -- ci -- mo,
    I sr -- dač -- no
    \set stanza = "3. " u -- te -- ci -- mo,
    Bo -- gu ro -- de -- nom,
    Bo -- gu ro -- de -- nom.
}}
lyrStropheF = {
  \lyricmode {
    Al ve -- sel -- je ne -- ka na -- še bu -- de pra -- ved -- no.
}}
lyrStropheG = {
  \lyricmode {
  \set stanza = \stanzaD
  On svim da -- o, da bu -- de -- ma,
  Bo -- žic Pro -- ve -- sti.
  \set stanza = "4. "
  A po smr -- ti pak svim da -- o
  ka -- ko nam  je,
  \set stanza = "4. "
  o -- be -- ća -- o
  Vje -- ćne ra -- do -- sti,
  vje -- ćne ra -- do -- sti.
}}
lyrStropheH = {
  \lyricmode {
  Bez du -- hov -- ne, i tje -- les -- ne
  kak -- ve bo -- le -- sti.
}}


stropheSopran = \relative c' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 6/8
  \key c \major
  \bar ".|:"
  \repeat volta 2 {
    e4 f8 g4 a8
    g4 f8 e4 d8
    e4 f8 g4 f8
    e4. s4.
  } \break
  \repeat volta 2 {
    a8. a16 b8 a4.
    g4 f8 a8 g4
    a8. a16 b8 a4.
    g4 f8 a8 g4
    g8( f) e f( e) d
    e4( g8) g8( f) e
    f( e) d e4.
  }
}

stropheAlt = \relative c' {
  \voiceTwo
  c4 d8 e4 f8
  e4 d8 c4 b8
  c4 d8 e4 d8
  c4. r4.
  f8. f16 g8 f4.
  e4 d8 f8 e4
  f8. f16 g8 f4.
  e4 d8 f8 e8( f)
  e8( d) c d( c) b
  c4( e8) e( d) c
  d( c) b c4.
  }

stropheBass = \relative c {
  \clef "bass"
  \key c \major
  c4 c8 4 8
  4 8 4 8
  4 8 g4 g8
  c4. r4.
  f8. f16 8 f4.
  c4 8 8 4
  f8. 16 8 4.
  c4 c8 c c4
  4 8 g4 8
  c4. 4 8
  g4 8 c4.
 }


chrdStrophe = \chordmode {
  c2. s s4. g
  c2.
  f c f c
  c4. g
  c2.
  g4. c
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \transpose c d \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \transpose c d \stropheSopran }
        \new Voice = "StropheAlt" { \transpose c d \stropheAlt }
      >>
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheC
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheD
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheE
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheF
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheG
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheH
      \new Staff <<
        \new Voice = "StropheBass" { \transpose c d \stropheBass }
      >>
    >>
    %\layout {
    % \context {
    %   \Lyrics
    %   \override LyricText.font-size = #1
    % }
   %}
  }
}
