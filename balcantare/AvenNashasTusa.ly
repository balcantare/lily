\version "2.22.2"
fileName = "AvenNashasTusa.ly"
sheetName = "Aven, nashas tusa"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Ge -- ya chai pa -- lo pa -- ny.
  A ch'a -- vo ge -- ya pa -- lai.
  \set stanza = #"1. "
  Ge -- ya chai pa -- lo pa -- ny.
  A ch'a -- vo ge -- ya pa -- lal:
  \set stanza = #"1. & 2. "
  A -- ven, na -- shas tu -- sa,
  A -- ven, na -- shas tu -- sa,
  A -- ven, na --
  \set stanza = #"1. & 2. "
  sha -- sa,
  me tu -- ke pxe -- nav!
  A -- ven, na --
  \set stanza = #"1. & 2. "
  shas tu -- sa,
  A -- ven, na -- shas tu -- sa,
  A -- ven, na --
  \set stanza = #"1. & 2. "
  sha -- sa,
  me tu -- ke pxe -- nav!
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Tu man, chá -- yo -- ri, kamé -- sa?
  Mé tut, ch'á -- vo -- ro, ka -- mám!
  \set stanza = #"2. "
  Tu man, chá -- yo -- ri, kamé -- sa?
  Mé tut, ch'á -- vo -- ro, ka -- mám!
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Syr a -- mén --  ge te na -- shás,
  Do -- gal -- yó -- na o psha -- lá!
  \set stanza = #"3. "
  Syr a -- mén --  ge te na -- shás,
  Do -- gal -- yó -- na o psha -- lá
  \set stanza = #"3. "
  Ay, tu -- ke dúkx de -- ná,
  Ay, mán -- ge dar de -- ná!
  Ay, syr a -- \set stanza = #"3. "
  mén -- ge pro své -- to te_dzhi -- vás?
  Ay, tu -- ke \set stanza = #"3. "
  dúkx de -- ná,
  Ay, mán -- ge dar de -- ná!
  Ay, syr a -- \set stanza = #"3. "
  mén -- ge pro své -- to te_dzhi -- vás?

}}

lyrStropheD = {
  \lyricmode {
    Da pro -- da -- mo, sa -- mo da i -- gra -- mo.
    Da pro -- da --  mo, Ja -- no du -- šo, sa -- mo
    da i -- gra -- ___ -- mo.
    Da pro -- da --  mo, Ja -- no du -- šo, sa -- mo
    da i -- gra -- ___ -- mo.
}}


strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle neo-modern %-voice-cautionary
  \time 4/4
  \key a \minor
  c4 r8 c c c b c |
  d1 |
  r8 d4 d8 d d c d |
  e1 | \break
  c4 r8 c c c b c |
  d1 |
  r8 d4 d8 d d c d |
  e8 r \bar "|" \break e4 f g |

  g4 f8 f r f f f |
  f4 e8 e r e e e |
  e4. d8 e d d cs |
  c2 r8 g' g g |
  \break
  g4 f8 f r f f f |
  f4 e8 e r e e e |
  e4. d8 e d d cs |
  c2 r8 g g16 g g8 |
  \break
  g8 f f f r8 f f16 f f8 |
  f8 e e e r e e16 e e8 |
  e8 d4 e8 d8 r d16 d d8 |
  c2. r4

  \bar "|."
}

chrdStrophe = \chordmode {
  a1:m
  e:7  s
  a:m  s
  e s
  a4:m a b:dim a:7
  d1:m
  a:m
  e:7
  a2:m a
  d1:m
  a:m
  e
  a2:m a
 d1:m
  a:m
  e
  a:m

}

\bookpart {
  \paper {
    page-count = #1
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 24)
  }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}
