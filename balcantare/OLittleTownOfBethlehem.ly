\version "2.24.0"
sheetName = "O little town of Bethlehem"
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
  \set stanza = \stanzaA
  O litt -- le town of Beth -- le -- hem,
  how still we see thee here!
  \set stanza = "1. "
  Yet in thy dark streets shi -- neth,
  the e -- ver -- las -- ting light.
  \set stanza = "1. "
  the hopes and fears
  of all the years
  are met in thee to -- night.
}}

lyrStropheB = {
  \lyricmode {
  A -- bove thy deep and dream -- less
  sleep the si -- lent stars go by.
}}

lyrStropheC = {
  \lyricmode {
   \set stanza = \stanzaB
   All mor -- ning -- stars to -- ge _ -- ther
   pro -- claim the ho -- ly birth,
   \set stanza = "2. "
   for Christ is born by Ma -- ry;
   and, gathe -- red all a -- bove,
   \set stanza = "2. "
   while mor -- tals sleep the
   an -- gels keep their watch of
   won -- dering love.
}}
lyrStropheD = {
  \lyricmode {
    and prai -- ses sing 	to God the King, and peace
    to men on earth.
}}

lyrStropheE = {
  \lyricmode {
   \set stanza = \stanzaC
   O ho -- ly Child of Beth -- le -- hem,
   des -- cend to us we pray;
   \set stanza = "3. "
   We hear the Christ -- mas An -- gels
   the great glad ti -- dings tell:
   \set stanza = "3. "
   O come to us, a -- bide with us,
   our Lord Im -- ma -- nu -- el.
  }
}
lyrStropheF = {
  \lyricmode {
    cast out our sin and en -- ter in,
    be born in us to -- day!
  }
}

lyrStropheG = {
  \lyricmode {
   \set stanza = \stanzaD
   O Beth -- le -- hem, du klei -- ne Stadt,
   wie stil -- le liegst du hier,
   \set stanza = "4. "
   Doch in den dunk -- len Gas -- sen
   das ew -- ge Licht heut scheint
   \set stanza = "4. "
   für al -- le,  die da trau -- rig sind
   und die zu -- vor ge -- weint.
}}
lyrStropheH = {
  \lyricmode {
    du schläfst, und gold -- ne Ster -- ne -- lein
    ziehn lei -- se ü -- ber dir.
}}
lyrStropheI = {
  \lyricmode {
   \set stanza = \stanzaE
   Des Her -- ren hei -- li -- ge Ge -- burt
   ver -- kün -- det hell der Stern,
   \set stanza = "5. "
   denn Chris -- tus ist ge -- bo -- ren
   und En -- gel hal -- ten Wacht,
   \set stanza = "5. "
   der -- weil die Men -- schen schla _ -- fen,
   die gan -- ze dunk -- le Nacht.
}}
lyrStropheJ = {
  \lyricmode {
    ein ew -- ger Frie -- de sei be -- schert den
    Men -- schen nah und fern;
}}
lyrStropheK = {
  \lyricmode {
   \set stanza = \stanzaF
   O hei -- lig Kind von Beth -- le -- hem,
   in uns -- re Her -- zen komm,
   \set stanza = "6. "
   Die Weih -- nachts -- en -- gel
   sin -- gen die fro -- he Bot -- schaft hell:
   \set stanza = "6. "
   Komm auch zu uns und bleib bei uns,
   O Herr Im -- ma -- nu -- el.
}}
lyrStropheL = {
  \lyricmode {
    wirf al -- le uns -- re Sün -- den fort
    und mach uns frei und fromm.
}}
stropheSopran = \relative c' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/2
  \partial 2
  \key g \major
  \bar ".|:"
  \repeat volta 2 {
  d2
  g g g a
  b4( a) b( c) d2 \breathe b2
  c2 b4( g) a2 a
  g1. \breathe
  } \break
  g4( b)
  d2. e4 d( c) b( a)
  g( a b c) d2 \breathe d,
  g b a g
  d1. \breathe \break
  d2
  g g g a
  b4( a) b( c) d2 \breathe b2
  c2 b4( g) a2 a
  g1.
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  d2
  d c b d
  g fs4( e) d2 g
  e4( fs) g2 g fs
  e2( d4 c d2)
  g2
  g4 fs e2 fs g4( fs)
  e2( d) d c
  b g' d b
  a1.
  b2 b e d fs
  g g fs g
  e d4( fs) e2 d4( c)
  b2( c d)
  }

stropheBass = \relative c' {
  \clef "bass"
  \key g \major
  d4 c
  b2 a g2. fs4
  e2 d4( c) b2 \breathe e2
  a b4 b d2 d,
  e a g \breathe
  g2
  b c d e4( b)
  c2( b4 a) b2 \breathe a2
  g4( fs) e2 fs g
  g2( fs4 e d2) \breathe
  b2 e d4( c) b2 d
  g fs4( e) d2 \breathe e2
  a, b c d
  g1.
}
chrdStrophe = \chordmode {
  s4.
  }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \stropheSopran }
        \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheC
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheD
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheE
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheF
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheG
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheH
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheI
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheJ
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheK
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheL
      \new Staff <<
        \new Voice = "StropheBass" { \stropheBass }
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
