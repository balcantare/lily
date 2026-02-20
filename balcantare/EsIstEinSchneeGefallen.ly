\version "2.24.0"
sheetName = "Es ist ein Schnee gefallen"
\include "../include/book.ily"

skipA = \repeat unfold 15 \skip 8
lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = "1. "
  Es ist ein Schnee ge -- fal -- len, wann es
  ist noch nit Zeit.
  \set stanza = "1. "
  Ich wollt zu mei -- nem Buh -- len gahn,
  \set stanza = "1. "
  der Weg ist mir ver -- schneit.
  \set stanza = "1. "
  Ich wollt zu mei -- nem Buh -- len gahn,
  \set stanza = "1. "
  der Weg ist mir ver -- schneit.
 }}
lyrStropheB = {
  \lyricmode {
    \skipA
    \set stanza = "2. "
    Mein Haus hat kei -- nen Gie -- bel,
    es ist mir wor -- den alt.
    \set stanza = "2. "
    Zer -- bro -- chen sind die Rie _ -- gel,
    \set stanza = "2. "
    mein Stüb -- lein ist mir kalt.
    \set stanza = "2. "
    Zer -- bro -- chen sind die Rie _ -- gel,
    \set stanza = "2. "
    mein Stüb -- lein ist mir kalt.
  }
}
lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = "3. "
    Hier dro -- ben, auf der Hö -- he,
    da geht ein kal -- ter Wind.
    \set stanza = "3. "
    Wie ich mich nach Dir seh -- _ ne,
    \set stanza = "3. "
    daß wir bei -- sam -- men sind.
    \set stanza = "3. "
    Wie ich mich nach Dir seh -- _ ne,
    \set stanza = "3. "
    daß wir bei -- sam -- men sind.
}}

lyrStropheD = {
  \lyricmode {
    \skipA
    \set stanza = "4. "
    Ach Lieb' lass dich's er -- bar -- men
    wann ich so e -- lend bin,
    \set stanza = "4. "
    Nimm mich in dei -- ne Ar _ -- me,
    \set stanza = "4. "
    so fährt der Win -- ter hin.
    \set stanza = "4. "
    Nimm mich in dei -- ne Ar _ -- me,
    \set stanza = "4. "
    so fährt der Win -- ter hin.
}}

strophe = \relative c' {
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/4
  \partial 4
  \key d \major
  fs8 g
  a4. a8 a4 fs
  e4. e8 e4 fs
  e4. d8 d4 cs
  d2. \break
  a4
  d4. e8 fs4 g
  a4 a2 fs4
  e4. fs8 g4 a
  fs2. \break fs4
  e4. e8 e4 fs
  g4. g8 g4. \break fs8
  e4. d8 d4 cs
  d2. \break fs4
  e4. e8 e4 fs
  g4. g8 g4. \break fs8
  e4. d8 d4 cs
  d2.
  \bar "|."
}

chrdStrophe = \chordmode {
  s4 d1 e:m g2 a d1
  d s e2:m a d1
  e:m g e2:m a
  d1
  e:m g e2:m a
  d2
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
  \layout {#(layout-set-staff-size-with-jazz 24)}
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}
