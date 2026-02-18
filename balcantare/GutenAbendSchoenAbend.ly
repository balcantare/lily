\version "2.24.0"
sheetName = "Guten Abend, schön Abend"
sheetComposer = "trad. Kärnten, Satz: Magdalene Kemlein"
sheetPoet = "2&3.: Ilse Naumilkar"
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
  \column { \vspace #.4 "3. "}
  \column { \vspace #.2 \leftbrace }
}

lyrStropheA = {
  \lyricmode {
  \set stanza = "1-3. " %\stanzaA
  Gu -- ten A -- bend schön A -- bend
  es weih -- nach -- tet schon.
  \set stanza = "1. "
  Am Kran -- ze die Lich -- ter, die
  leuch -- ten so fein,
  \set stanza = "1. "
  sie ge -- ben der
  Hei -- mat ei -- nen hell -- lich -- ten
  Schein.
}}

skipA = \repeat unfold 12 \skip 4
lyrStropheB = {
  \lyricmode {
    \skipA
  \set stanza = "2. "
  Der Schnee fällt in Flo -- cken und weiß steht
  der Wald.
  \set stanza = "2. "
  Nun freu -- et euch al -- le,
  die _ Weih -- nacht kommt bald.
}}


lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = "3. "
    Nun singt es und klingt es so lieb -- lich und fein.
    \set stanza = "3. "
    Wir sin -- gen die fröh -- li -- che _
    Weih -- nachts -- zeit ein.
}}

lyrStropheD = {
  \lyricmode {
    %\set stanza = #"4. "

}}


strophe = \relative c' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 3/4
  \partial 4
  \key a \major
  \bar ".|:"
  \repeat volta 2 {
    e8 e
    a4 gs fs
    e a cs,
    e b' gs
    a2
  } \break
  \repeat volta 2 {
    b4
  cs a cs
  b e, b'
  cs a fs
  e2 \break e4
  a gs fs
  e a cs,8 cs
  e4 b' gs
  a2}
  %\bar "|."
}


stropheAlt = \relative c' {
  \voiceTwo
  e8 e
  cs4 e d
  cs cs cs
  e e d
  cs2
  e4
  a a a
  e e e
  a cs, ds
  e2 e4
  cs e d
  cs4 cs cs8 cs
  e4 e d
  cs2
  }

chrdStrophe = \chordmode {
  s4
  a2 d4 a2. e:7 a2 e4
  a2. e a2 e4:7
  e2 e4:7
  a2 d4
  a2. e:7 a2
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    %ragged-last-bottom = ##f
  }
  \bookItem
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "Strophe" { \strophe }
        \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new	Lyrics \lyricsto "Strophe" \lyrStropheA
    \new	Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}
