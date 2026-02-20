\version "2.24.0"
sheetName = "Hark! The herald angels sing"
sheetComposer = "Brahms, Schubert, Mendelsohn"
sheetPoet = "Charls Wesley, dt. Beate Tarrach"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  %\set stanza = \stanzaA
  Hark! the he -- rald an -- gels
  sing, Glo -- ry to the new born King,
  Peace on earth and mer -- cy mild,
  God and sin -- ners re -- con -- cil'd.
  Joy -- ful all the na -- cions
  rise,
  Join the tri -- umph of the skies,
  With th'an -- ge -- lic host pro -- claim:
  Christ is
  born in Beth -- le -- hem.
  Hark! the he -- rald an -- gels sing,
  Glo -- ry to the new born King!
}}

lyrStropheB = {
  \lyricmode {
    Lieb -- lich klin -- gen En -- gels
    Chöre: Je -- sus Chris -- tus ward ge -- born.
    Singt mit Ju -- bel ihm zur Ehre, der als Hei -- land
    aus -- er -- korn.
    Stimmt nun ein mit fro -- hem
    Schalle. Hell er -- strahlt der Ster -- ne Schein.
    Völ -- ker, singt es ü -- ber -- all:
    Christ soll
    un -- ser Kö -- nig sein.
    Völ -- ker, singt es ü -- ber -- all:
    Christ soll
    un -- ser Kö -- nig sein!
}}


stropheSopran = \relative c' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/4
  \partial 2
  \key g \major
  d4 g
  g4. fs8 g4 b
  b( a) d d
  d4. c8 b4 a
  b2 \break d,4 g
  g4. fs8 g4 b
  b( a) d a
  a4. fs8 fs4 e
  d2 \break d'4 d
  d g, c b
  b( a) d d
  d g, c b
  a2 \break e'4 e
  e d c b
  c2 a4 b8_( c)
  d4 g, g a
  b2 \break e4. e8
  e4 d c b
  c2 a4 b8_( c)
  d4. g,8 g4 a
  g2
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  d4 d
  d4.d8 d4 g
  g( fs) g fs
  e4. e8 d4 d
  d2 d4 d
  d4. d8 b4 d
  e4 e d e
  fs4. d8 d4 cs
  d2 d4 d
  d g a g
  g( fs) d d
  d g a g
  fs2 g4 g
  e e e e
  e2 fs4 fs
  g d d fs
  g2 g4.g8
  e4 e e e
  e2 fs4 fs
  g4. g8 g4 fs
  d2
  }

stropheBass = \relative c' {
  \voiceTwo
  \clef "bass"
  \key g \major
  g4 g
  g4. d8 b4 g
  d'2 b4 b
  c4. c8 d4 d
  g,2 g'4 g
  g4. d8 e4 d
  cs( a) b cs
  d4. fs8 g4 a8( a,)
  d2 d'4 d
  d b fs g
  d2 d'4 d
  d b fs g
  d2 c4 c
  c c c e
  a,2 d4 c
  b g d' d
  g2 c4. c8
  c4 b a gs
  a2 d,4 c
  b4 g d' d
  <g, g'>2
 }

stropheTenor = \relative c' {
  \voiceOne
  b4 b
  b4. a8 g4 d'
  d2 g,4 g
  g4. a8 b4 c
  b2 b4b
  b4. a8 g4 g
  g2 fs4 a
  a4. a8 b4 a8_( g)
  fs2 d'4 d
  d4 d  d d
  d2 d4 d
  d4 d d d
  d2 \break e4 e
  c b a gs
  a2 a4 d
  d b b d
  d2 e4. e8
  c4 d e b
  a2 a4 d
  d4. b8 b4 c
  b2
}

chrdStrophe = \chordmode {
  s2
  g1 d c2 d2 g1
  g a d2 a d1
  s2 c4 g d1
  s2 c4 g d2
  c2 s2. e4
  a2:m d4 \set chordBassOnly = ##t d:/c
  \set chordBassOnly = ##f g:/b g d
  \set chordBassOnly = ##t d:/fs
  g2 c
  s2 a4:m e
  a2:m d4 d:/c \set chordBassOnly = ##f
  g:/b g d2
  g
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
  }
  \bookItem
  \score {
    \layout {#(layout-set-staff-size-with-jazz 20)}
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \transpose g g \stropheSopran }
        \new Voice = "StropheAlt" { \transpose g g \stropheAlt }
      >>
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheA
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheB
      \new Staff <<
        \new Voice = "StropheTenor" { \transpose g g \stropheTenor }
        \new Voice = "StropheBass" { \transpose g g \stropheBass }
      >>
    >>
  }
}
