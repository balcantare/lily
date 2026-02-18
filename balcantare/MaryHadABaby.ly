\version "2.24.0"
sheetName = "Mary had a Baby"
sheetComposer = "trad, Satz Christoph Kapfhammer"
#(define book-staff-size 20)
\include "../include/book.ily"

trans = d

rightbrace = \markup {
  \rotate #180 {
    \override #'(font-encoding . fetaBraces)
    \lookup "brace200"
  }
}

stanzaR = \markup { \column { \vspace #-.2 \rightbrace} }

skipA = \repeat unfold 2 \skip 4

lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
  Ma -- ry had a ba -- by,
  \skipA
  \set stanza = "1. "
  Ma -- ry had a ba -- by,
  \skipA
  \set stanza = "1. "
  Ma -- ry had a ba -- by,
  Ma -- ry had a ba -- by,
  \set stanza = "1. "
  Ma -- ry had a ba -- by,

}}



lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    Where _ was he __ _ born, \skipA
    \set stanza = "2. "
    Where _ was he __ _ born, \skipA
    \set stanza = "2. "
    Where _ was he __ _ born,
    where _ was he __ _ born,
    \set stanza = "2. "
    where _ was he __ _ born,
}}

lyrStropheC = {
  \lyricmode {
    \set stanza = "3. "
    Born _ in a stab -- le, \skipA
    \set stanza = "3. "
    Born _ in a stab -- le, \skipA
    \set stanza = "3. "
    Born _ in a stab -- le,
    born _ in a stab -- le,
    \set stanza = "3. "
    born _ in a stab -- le,
}}
lyrStropheD = {
  \lyricmode {
  \set stanza = "4. "
  Where _ did she lay him,
  \set stanza = \stanzaR oh __ Lord.
  \set stanza = "4. "
  Where _ did she lay him,
  \set stanza = \stanzaR oh __ Lord.
  \set stanza = "4. "
  Where _ did she lay him,
  where _ did she lay him,
  \set stanza = "4. "
  where _ did she lay him,
  \set stanza = \stanzaR oh __ Lord.
}}
lyrStropheE = {
  \lyricmode {
    \set stanza = "5. "
    Laid him in a Man -- ger, \skipA
    \set stanza = "5. "
    Laid him in a Man -- ger, \skipA
    \set stanza = "5. "
    Laid him in a Man -- ger,
    laid him in a Man -- ger,
    \set stanza = "5. "
    laid him in a Man -- ger,
}}
lyrStropheF = {
  \lyricmode {
    \set stanza = "6. "
    What _ did she name him, \skipA
    \set stanza = "6. "
    What _ did she name him, \skipA
    \set stanza = "6. "
    What _ did she name him,
    what _ did she name him,
    \set stanza = "6. "
    what _ did she name him,
}}
lyrStropheG = {
  \lyricmode {
    \set stanza = "7. "
    Named _ him King Je -- sus, \skipA
    \set stanza = "7. "
    Named _ him King Je -- sus, \skipA
    \set stanza = "7. "
    Named _ him King Je -- sus,
    named _ him King Je -- sus,
    \set stanza = "7. "
    named _ him King Je -- sus,
}}

stropheSopran = \relative c' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/4
  \key c \major
  \override Rest.staff-position = #0
  c4 c c c8 e~
  e2 c
  r4 a2( c4)
  c1 \break
  g'4 g g g8 a~
  a4. g8~ g2
  r4 e2( g4)
  g1 \break
  c4 c c a8 g~
  g2 e
  r4 g8 g g4 e8 c~
  c4 a2. \break
  c4 c c c8 e~
  e2 c
  r4 a2( c4)
  c1
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  s1*4
  e4 e d e8 e~
  e4. e8~ e2
  s4 e2( c4)
  d1
  f4 f f f8 e~
  e2 c
  s4 e8 e e4 e8 e~
  e4 e2.
  c4 c c c8 c~
  c2 c
  s4 a2.
  a1
}

stropheBass = \relative c {
  \voiceTwo
  \clef "bass"
  \key c \major
  \override Rest.staff-position = #0
  c4 c c c8 e~
  e2 c
  r4 a2( c4)
  c1
  c4 c c c8 c~
  c4. c8~ c2
  c2( f)
  g1
  f4 f f f8 c~
  c2 c2
  r4 g'8 g g4 e8 c~
  c4 a2.
  c4 c c c8 c~
  c2 c2
  a2. c4 c1
 }

stropheTenor = \relative c' {
  \voiceOne
  s1*4
  c4 c c c8 c~
  c4. c8~ c2
  r4 c2( a4)
  b1
  a4 a a c8 c~
  c2 g
  s4 b8 b b4 g8 a~
  a4 e2.
  g4 g g g8 a~
  a2 g
  r4 e2 g4
  g1
}

chrdStrophe = \chordmode {
  c1 s f c s s s g
  f c e:m a:m c s f c
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \transpose c \trans \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \transpose c \trans \stropheSopran }
        \new Voice = "StropheAlt" { \transpose c \trans \stropheAlt }
      >>
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheC
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheD
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheE
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheF
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheG
    \new Staff <<
        \new Voice = "StropheTenor" { \transpose c \trans \stropheTenor }
        \new Voice = "StropheBass" { \transpose c \trans \stropheBass }
      >>
    >>
    \layout {
      \context {
        \Lyrics
        \override LyricText.font-size = #1
      }
    }
  }
}
