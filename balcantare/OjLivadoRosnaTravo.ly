\version "2.22.2"
sheetName = "Oj livado rosna travo"
\include "../include/book.ily"

dropLyrics = {
\override LyricText.extra-offset = #'(0 . -4.5)
\override LyricHyphen.extra-offset = #'(0 . -4.5)
\override LyricExtender.extra-offset = #'(0 . -4.5)
\override StanzaNumber.extra-offset = #'(0 . -4.5)
}
raiseLyrics = {
\revert LyricText.extra-offset
\revert LyricHyphen.extra-offset
\revert LyricExtender.extra-offset
\revert StanzaNumber.extra-offset
}
skipA = \repeat unfold 6 { \skip 4 }
skipB = \repeat unfold 8 { \skip 4 }
lyrStropheA = {
  \lyricmode {
    \set stanza = #"1. "
    Oj li -- va -- do ros -- na -- tra -- vo,
    \dropLyrics
    ja -- vo -- re ja vo -- re
    \raiseLyrics
    \set stanza = #"1. "
    Koj po te -- bi ču va sta -- do,
    \dropLyrics
    zla -- to mo -- je
    \raiseLyrics
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = #"2. "
    Ču -- va -- la ga dje -- voj -- či -- ca,
    \skipA
    \set stanza = #"2. "
    Od se -- dam -- naest go -- di -- ni -- ca,
    \skipB
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Ov -- ce ču -- va pes -- mu pe -- va,
  \skipA
  \set stanza = #"3. "
  Moj dra -- ga -- ne, što te ne -- ma,
  \skipB
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = #"4. "
  Gde si dra -- gi, o -- vih da -- na,
  \skipA
  \set stanza = #"4. "
  Kad ja ov -- ce ču -- vam sa -- ma,
  \skipB
}}


strophe = \relative c' {
  \voiceTwo
  \time 4/4
  \key c \major
  \partial 4
  \repeat volta 2 {
    \bar ".|:"
    c4 |
   d4 d8 d~ 4 c |
   d4 d8 d~ 2 |
   d4 d8( e) f2 |
   e8([ g)] f([ e)] d4 } s4 \break
  \repeat volta 2 {
    a'4. g8 a8([ g)] f[( e]) |
    f8 f4( e8) f([ e)] d4 |
    f4.( e8) f[( g)] e([ d)]
    d1
  }
}

stropheAlt = \relative c'' {
  \voiceOne
   c4 |
   b4 b8 b~ 4 c |
   b4 b8 b~ 2 |
   b4 b8( c) d2 |
   c4 a b r4  |
   f'4. e8 f8([ e)] d[( c]) |
   d8 d4( c8) d([ c)] b4 |
   d2 c4 c
    b1
}

stropheBass = \relative c' {
  \key c \major
  \clef bass
  g4 |
  4 8 8~ 4 4 |
  4 8 8~ 2 |
  4 4 2 |
  c,4 d g r4 |
  c,4. 8 4 4 |
  g'8 4. 4 4 |
  c,2 d4 4 |
  g1
}

chrdStrophe = \chordmode {
  s4 g1 s s c4 d:m g2
  f1 g c2 d:m g1
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
  }
  \bookItem
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
    <<
    \new ChordNames { \transpose g f {\chrdStrophe }}
    \new ChoirStaff
      <<
      \new Staff <<
        \new Voice = "Strophe" { \transpose g f {\strophe }}
        \new Voice = "StropheAlt" { \transpose g f {\stropheAlt }}
        >>
      \new Lyrics \lyricsto "Strophe" \lyrStropheA
      \new Lyrics \lyricsto "Strophe" \lyrStropheB
      \new Lyrics \lyricsto "Strophe" \lyrStropheC
      \new Lyrics \lyricsto "Strophe" \lyrStropheD
      \new Staff <<
        \new Voice = "Basso" { \transpose g f {\stropheBass }}
        >>
      >>
    >>
  }
}
