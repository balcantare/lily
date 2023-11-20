\version "2.24.0"
sheetName = "Süßer die Glocken nie klingen"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
     Sü -- ßer die Glo -- cken nie klin -- gen
  \set stanza = "1. "
  als zu der Weih -- _ nachts -- zeit:
  \set stanza = "1. "
  's_ist, als ob En -- ge -- lein sin -- gen
   \set stanza = "1. "
   Wie -- der von Frie -- den und Freud'.
   \set stanza = "1. "
   Wie sie ge -- sun -- gen in se -- li -- ger Nacht.
     Glo -- cken, mit hei -- li -- gem Kla -- ng
     Klingt doch die Er -- de ent -- lang!
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = "2. "
  O, wenn die Glo -- cken er -- klin -- gen,
  \set stanza = "2. "
  schnell sie das Christ -- kind -- lein hört.
  \set stanza = "2. "
  Tut sich vom Him -- mel dann schwin -- gen
  \set stanza = "2. "
  Ei -- let her -- nie -- der zur Erd'.
  \set stanza = "2. "
  Seg -- net den Va -- ter, die Mut -- ter, das Kind.
}}


lyrStropheC = {
  \lyricmode {
    \set stanza = "3. "
    Klin -- get mit lieb -- li -- chem Schal -- le
    \set stanza = "3. "
    ü -- ber die Mee -- re noch weit,
    \set stanza = "3. "
    Daß sich er -- freu -- en doch al -- le
    \set stanza = "3. "
    se -- li -- ger Weih -- _ nachts -- zeit.
    \set stanza = "3. "
    Al -- le auf -- jauch -- zen mit ei -- nem Ge -- sang.
    %Glocken mit heiligem Klang,
    % Klingt doch die Erde entlang!
}}


strophe = \relative c' {
  \override Rest.staff-position = #0
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 3/4
  \key d \major
  fs4. fs8 fs4
  fs4 e fs
  a2. e \break
  e4. e8 e4
  e d e
  fs2.~ fs2 r4 \break
  a4. a8 a4
  a4 fs d
  d'2. b2 r4
  a4. b8 a4
  a4 g e
  d2.~ d2 r4 \break
  \repeat volta 2 {
    e4. e8 e4 fs4 fs fs
    a4. g8 e4 fs2 r4
  }
  \break
  a4. g8 fs4 fs e d
  d'2. b2 r4
  a4. b8 a4
  a g e
  d2.~ d2 r4
  \bar "|."
}


stropheAlt = \relative c' {
    }

chrdStrophe = \chordmode {
  d2. s a s a a:7 d s
  d d:7 g s d a:7 d s
  a d a d
  d d:7 g s
  d a:7 d
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
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \strophe }
        \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new	Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}
