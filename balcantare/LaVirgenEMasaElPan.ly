\version "2.24.0"
sheetName = "La virgen e masa el pan"
sheetComposer = "andalusisches Roma - Lied"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  %\set stanza = "1. "
  La vir -- gen a __ ma -- sa‿el
  pan, __
  Jo -- sé ce -- pil __ la‿el
  ma -- de __ ro,
  y‿el ni -- ño jue -- ga que jue __ ga,
  muy jun -- ti -- to‿al car -- pin -- te __ ro.
  Yo se lo‿a -- se -- gu -- ro‿a‿u -- sté, __
  e sa fa -- mi -- lia‿es de
  qua -- tro:
  Je -- sús, la vir -- gen, Jo -- sé. __
  vi -- va‿el e -- spi -- ri -- tu
  san -- to. __
  Yo se lo‿a -- se -- gu -- ro‿a‿u -- sté,
  Sí, se -- ñor, qu'e -- stá mu bien
  can -- tao
  Sí, se -- ñor, qu'e -- stá mu bien
  to -- cao
  Sí, se -- ñor, qu'e -- stá mu bien
  bai -- lao
}}


lyrStropheB = {
  \lyricmode {
   %\set stanza = "2. "
   \repeat unfold 15 \skip 8
   muy jun -- ti -- to‿al car -- pin -- te __ ro,
   la __ vir -- gen a __ ma -- sa‿el pan. __
}}

stropheSopran = \relative c'' {
  \voiceOne
  \override Rest.staff-position = #0
  \accidentalStyle neo-modern-voice-cautionary
  \time 6/8
  \key d \major
  a4.~ 4 g16 fs
  a4.~ 4 g16 fs
  a4.~ a4( g16 fs
  g4) r2
  e4.~ 4 fs16 g
  a4.~ 4 e16 fs
  g4.~ 4( fs16 e)
  fs4 s8 s4 \break
  \repeat volta 2 {
    s8
    fs4.~ fs4 e16 d
    fs4.~ fs4 e16 d
    fs4.~ fs4( e16 d)
    e4 r2
    e4.~ 4 fs16 g
    a4.~ 4 e16 fs
    g4.~ 4( fs16 e)
    fs4 s8 s4
  } \break
  \key d \minor
  d8
  bf'8 a g f4 e8
  d4.~ 4 d8
  bf'8 a g f4 e8
  d8 d2 d8
  g8 fs g a \break bf4
  a8( g4)~ g4.
  a8 bf a g f e
  d8 d2 d8
  bf'8 a g f4 e8
  \time 3/8
  d8 s \break a'16 a
  a8 a a
  g g g
  a s a16 a
  a8 a a
  g g g
  a s a16 a
  a8 a a
  g g g
  a8 r4
  \bar "|."
}

stropheAlt = \relative c'' {
  \voiceTwo
  fs,4.~ 4 e16 d
  fs4.~ 4 e16 d
  fs4.~ fs4( e16 d
  e4) r2
  cs4.~ 4 d16 e
  e4.~ 4 cs16 d
  e4.~ 4( d16 cs)
  d4 r8 r4
    r8
    d4.~ d4 b16 a
    d4.~ d4 b16 a
    d4.~ d4( cs16 b)
    cs4 r2
    cs4.~ 4 d16 e
    e4.~ 4 cs16 d
    e4.~ 4( d16 cs)
    d4 r8 r4
  d8
  g8 f e d4 cs8
  d4.~ 4 d8
  g8 f e d4 cs8
  d8 d2 d8
  d8 d d f g4
  f8( e4)~ e4.
  f8 g f e d cs
  d8 d2 d8
  g8 f e d4 cs8
  \time 3/8
  d8 r \break d16 d
  d8 d d
  c c c
  d r d16 d
  d8 d d
  c c c
  d r \break d16 d
  d8 d d
  c c c
  d8 s4
}

chrdStrophe = \chordmode {
  \set chordBassOnly = ##t
  d2. s s a s s s d
  d s s a s s s d
  g4.:m a d:m d:m/a
  g4.:m a d:m d:m/a
  g:m g:m/d a:7 a:7/e a a:/e d:m d:m/a g4.:m a
  d:m d:m c d:m
  d:m c d:m d:m c d:m
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    \layout { #(layout-set-staff-size-with-jazz 21)}
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \stropheSopran }
        \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheB
    >>
  }
}
