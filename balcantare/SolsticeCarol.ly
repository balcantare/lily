\version "2.24.0"
sheetName = "Solstice Carol"
sheetComposer = "Nickomo"
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
stanzaE = \markup {
  \column { \vspace #.4 "5. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaF = \markup {
  \column { \vspace #.4 "6. "}
  \column { \vspace #.2 \leftbrace }
}
lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
  From the dar -- kest night
  is born the child of Light.
  \set stanza = "1. "
  Hail the Sol -- stice Dawn,
  Lord Ma -- bon is born!
  La "..."
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = "2. "
  Aus der tief -- sten Nacht
  ist heut das Licht er -- wacht.
  \set stanza = "2. "
  Wir sind aus -- er -- korn,
  wir sind aus Licht_ge -- bor'n.
  }}

stropheSopran = \relative c' {
  \voiceOne
  \override Rest.staff-position = #0
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/4
  \partial 4
  \key f \major
  \bar ".|:"
  \repeat volta 2 {
    f8 e
    d2 e
    f2. c'8( bf)
    a( g) f4 f e
    f2.
  } \break
  \repeat volta 2 {
    s4
    g4 s8 g8 f4 g
    a2 r4 a8( g)
    \time 3/4 f8( e) d4 c
    \time 4/4 d2.
  } \break
  \repeat volta 2 {
   s4
   e8. f16 g16 f g8 a8 g16 f e8 d
   e8. f16 g16 f g8 a4 a
   \break
   e8. f16 g16 f g8 a8 g16 f e8 d
   e8. f16 g16 f e8 d4 d4~-\fermata
   d2.
  }
}

stropheAlt = \relative c' {
  \voiceTwo
  \override Rest.staff-position = #0
  c8 c
  d2 c
  d2. d4
  c4 a8( bf) c4 c
  c2.
  r4 c4 r8 c8 d4 e
  f2. f8( e)
  d4 bf bf
  a2.
  r4
  c4 c8 c d4 d8 d
  c4 c8 c f4 f
  c4 c8 c d4 d8 d
  c4 c8 c d4 d4~
  d2.
  }

stropheTenor = \relative c' {
  \voiceOne
  a8 g
  a2 g
  a2. g4
  f4 f g g
  a2.
  s4
  g4 s8 g a4 c
  c2. bf4
  bf8( a) g4 g
  a2.
  s4
  g4 g8 g a4 a8 a
  g4 g8 g c4 c
  g4 g8 g a4 a8 a
  g4 g8 g a4 a~
  a2.
}

stropheBass = \relative c {
  \override Rest.staff-position = #0
  \clef "bass"
  \key f \major
  \voiceTwo
  f8 c
  d2 c
  d2. bf4
  c4 d c c
  <f f,>2.
  r4
  e4 r8 e d4 c
  f2. d4
  d d c
  d2.
  r4
  c4 c8 c d4 d8 d
  c4 c8 c8 f4 f
  c4 c8 c d4 d8 d
  c4 c8 c8 d4 d-\fermata~
  d2.
}
chrdStrophe = \chordmode {
  s4
  d2:m c d2.:m s4
  f2 g4:m7 c4 f2. s4
  c1 f1
  bf2. d:m
  s4
  c2 d:m c f
  c d:m c d:m
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
        \new Voice = "StropheSopran" { \stropheSopran }
        \new Voice = "StropheAlt" { \stropheAlt }
      >>
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheA
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheB
      \new Staff <<
        \new Voice = "StropheTenor" { \stropheTenor }
        \new Voice = "StropheBass" { \stropheBass }
      >>
    >>
  }
}
