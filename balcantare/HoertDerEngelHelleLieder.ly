\version "2.24.0"
sheetName = "Hört der Engel helle Lieder"
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

lyrStropheA = {
  \lyricmode {
  \set stanza = \stanzaA
  Hört der En -- gel _ hel -- le Lie -- der
  \set stanza = \stanzaA
  klin -- gen das wei -- te Feld ent -- lang.
  Glo __ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ ri -- a __ _
  in ex -- cel -- sis De -- o __ _ o
   }}

lyrStropheB = {
  \lyricmode {
  Und die Ber -- ge _ hal -- len wie -- der
  hoch des _ Him -- mels Lob -- ge -- sang:
  }}

lyrStropheC = {
  \lyricmode {
  \set stanza = \stanzaB
  Hir -- ten wa -- rum _ wird ge -- sun -- gen?
  \set stanza = \stanzaB
  Sagt mir doch eu -- res Ju -- bels Grund.
}}
lyrStropheD = {
  \lyricmode {
  Welch ein Sieg ward _ denn er -- run -- gen,
  den uns die Chö -- re ma -- chen kund:
}}
lyrStropheE = {
  \lyricmode {
  \set stanza = \stanzaC
  Sie ver -- kün -- den _ uns mit Schal -- le
  \set stanza = \stanzaC
  daß der Er -- lö -- ser nun er -- schien,
}}
lyrStropheF = {
  \lyricmode {
    dank -- bar sin -- gen _ sie heut al -- le
    an die -- sem Fest und grü -- ßen ihn:
}}
lyrStropheG = {
  \lyricmode {
    \repeat unfold 4 \skip 1
  Glo4 -- ri4 -- a,2
  Glo4 -- ri4 -- a,2
  Glo4 -- ri4 -- a,2
  Glo4 -- ri4 -- a
}}

stropheSopran = \relative c'' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/4
  \key g \major
  \bar ".|:"
  \repeat volta 2 {
    b4b b b8 d
    d4. c8 b4 g
    b4 b8 a b4 b8 d
    d4. c8 b2
  } \break
  \repeat volta 2 {
    d2 e8 d c b
    c2 d8 c b a
    b2 c8 b a g
    a4. d,8 d2
    g4 a b c
    b2 a
  }
  g2. r4
  \bar "|."
}

stropheAlt = \relative c'' {
  \voiceTwo
  g4 g g g8 b
  a4 a g g
  g g8 a g4 g
  fs d g2
  b2 c8 b a g
  a2 b8 a g fs
  g2 a8 g fs e
  fs4. d8 d4 c
  b4 d g a
  a4 g2 fs4
  g2. s4
}

stropheBass = \relative c' {
  \clef "bass"
  \key g \major
  g4 fs e d
  fs d g g
  g a b g
  d fs g2
  d'4 b g2
  a4 fs d2
  g4 e c2
  d4 d d c
  b d g a
  a4( g2) fs4
  g2. r4
}
chrdStrophe = \chordmode {
  g1 d2 g
  g1 d2 g2
  g2 c
  a:m d
  g e:m
  a:m d
  g4 d g c
  g2 d
  g
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
    %#(define fonts (book-font 1.2))
  }
  \bookItem
  \score {
    \layout { #(layout-set-staff-size-with-jazz 24)}
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \stropheSopran }
        \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new	Lyrics \lyricsto "StropheAlt" \lyrStropheA
    \new	Lyrics \lyricsto "StropheAlt" \lyrStropheB
    \new	Lyrics \lyricsto "StropheAlt" \lyrStropheC
    \new	Lyrics \lyricsto "StropheAlt" \lyrStropheD
    \new	Lyrics \lyricsto "StropheAlt" \lyrStropheE
    \new	Lyrics \lyricsto "StropheAlt" \lyrStropheF
    \new	Lyrics \lyrStropheG
    \new Staff <<
      \new Voice = "StropheBass" {  \stropheBass }
    >>
    >>
  }
}
