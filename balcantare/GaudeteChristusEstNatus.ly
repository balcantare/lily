\version "2.24.0"
sheetName = "Gaudate Christus est natus"
sheetComposer = "Piae Cantiones, 1582"
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
  %\set stanza = \stanzaA
  Gau -- de -- te, gau -- de -- te!
  Chris -- tus est na -- tus
  Ex Ma -- ri -- a vir -- gi -- ne,
  gau -- de -- te!
  \set stanza = \stanzaA
  Tem -- pus a -- dest gra -- ti -- æ
  Hoc quod op -- ta -- ba -- mus,
}}
skipA = \repeat unfold 21 { \skip 8}
lyrStropheB = {
  \lyricmode {
    \skipA
    Car -- mi -- na læ -- ti -- ti -- æ
    De -- vo -- te red -- da -- mus.
  }}

lyrStropheC = {
  \lyricmode {
    \skipA
   \set stanza = \stanzaB
   De -- us ho -- mo fac -- tus est
   Na -- tu -- ra mi -- ran -- te,
}}
lyrStropheD = {
  \lyricmode {
    \skipA
    Mun -- dus re -- no -- va -- tus est
    A Chris -- to reg -- nan -- te.
}}
lyrStropheE = {
  \lyricmode {
    \skipA
   \set stanza = \stanzaC
   E -- ze -- chi -- e -- lis
   por -- ta
   Clau -- sa per -- tran -- si -- tur,

}}
lyrStropheF = {
  \lyricmode {
    \skipA
    Un -- de lux est or _ -- ta
   Sa -- lus in -- ve -- ni -- tur.
}}
lyrStropheG = {
  \lyricmode {
    \skipA
   \set stanza = \stanzaD
   Er -- go nos -- tra con -- ti -- o
   Psa -- lat iam in lus -- tro;

}}
lyrStropheH = {
  \lyricmode {
    \skipA
    Be -- ne -- di -- cat Do -- mi -- no:
    Sa -- lus Re -- gi nos -- tro.
}}

stropheSopran = \relative c'' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 6/4
  \key a \minor
  \bar ".|:"
  \repeat volta 2 {
    a2 c b
    \time 4/4
    c4 d e2
    e4 d2 c4
    b2 b
    b c
    d2. c4
    \time 8/4
    b2 c4 d r c4 b2
    a1
  } \break
  \repeat volta 2 {
  g4 g g a
  b c b2
  g4 e fs g
  e2 e
  }
  % \bar "|."
}

stropheAlt = \relative c'' {
  \voiceTwo
  a2 a gs
  a4 b c2
  c4 b2 a4
  g2 g g a
  b2. a4
  g2 a4 b r a gs2
  s1
  }

stropheBass = \relative c' {
  \clef "bass"
  \key a \minor
  a2 a e2
  a4 g c2
  c4 g2 a4
  e2 e
  e a
  g2. a4
  e2 fs4 g2 f4 e2
  a1
}
chrdStrophe = \chordmode {
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1.2))
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \transpose c bf, \stropheSopran }
        \new Voice = "StropheAlt" { \transpose c bf, \stropheAlt }
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
        \new Voice = "StropheBass" { \transpose c bf, \stropheBass }
      >>
    >>
    %\layout {
    %  \context {
    %    \Lyrics
    %    \override LyricText.font-size = #1
    %  }
    %}
  }
}
