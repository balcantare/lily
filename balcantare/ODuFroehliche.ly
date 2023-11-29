\version "2.24.0"
sheetName = "O du fröhliche"
sheetPoet = "Johannes Falk / Heinrich Holzschuher"
sheetComposer = "Sizilianische Schifferlied"
\include "../include/book.ily"


lyrStropheA = {
  \lyricmode {
  \set stanza = "1-3. "
  O du fröh -- li -- che, __
  o du se -- li -- ge, __
  \set stanza = "1-3. "
  gna -- den -- brin -- gen -- de
  Weih -- nachts -- zeit.
  \set stanza = "1. "
  Welt ging ver -- lo -- ren,
  Christ ist ge -- bo -- ren.
  \set stanza = "1-3. "
  Freu -- e, __ freu -- e dich,
  o Chris -- ten -- heit!
}}

skipA= \repeat unfold 18 \skip 4
lyrStropheB = {
  \lyricmode {
    \skipA
    \set stanza = "2. "
    Christ ist er -- schie -- nen,
    uns __ zu ver -- süh -- nen.
}}

lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = "3. "
    Himm -- li -- sche Hee -- re
    jauch -- zen dir Eh -- re.
}}

lyrStropheD = {
  \lyricmode {
    \set stanza = "lat: "
    O san -- ctis -- si -- ma, __
    o pi -- is  -- si -- ma, __
    \set stanza = "lat: "
    dul -- cis Vir -- go Ma -- ri _ -- a.
    \set stanza = "lat: "
    Ma -- ter a -- ma -- ta,
    in -- te -- me -- ra -- ta,
    \set stanza = "lat: "
    o -- ra, __ o _ -- ra pro no _ -- bis.
}}

stropheSopran = \relative c'' {
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/4
  \key f \major
  \voiceOne
  c2 d
  c4. bf8 a4( bf)
  c2 d
  c4. bf8 a4( bf) \break
  c2 c
  d e4 f
  e2 d
  c2. r4 \break
  g4.( a8) g4 a
  bf4.( c8) bf2
  a4.( bf8) a4 bf
  c4( d) c2 \breathe \break
  f4( e) d( c)
  f d c bf
  a2 g
  f2. r4
  \bar "|."
}

stropheAlt = \relative c'' {
  \voiceTwo
\language "english"
  a2 bf
  a4. g8 f4( g)
  a2 bf
  a4. g8 f4( g)
  a2 g
  a a4 a
  g4( c2) b4
  c2. s4
  e,4. f8 e4 f
  g4. a8 g2
  f4. g8 f4 g
  a4( bf) a2 \breathe
  a4( c) bf( a)
  d bf a g
  c,4( f2) e4
  f2. s4
}

stropheTenor = \relative c' {
  \key f \major
  f2 f
  f4 c f2
  f2 f
  f4 c f2
  f e
  f e4 d
  g2( <g, g'>)
  c2. r4
  c4 c2 c4
  c2 c
  f4 f2 f4
  f2 f2 \breathe
  f2. f4
  f4 f f bf,
  c2 c
  a2. r4
}

stropheBass = \relative c, {
  \clef "bass"
  \key f \major
  r4 f' bf, d
  f f c bf
  r4 f' bf, d
  f f c bf
  a4 f'2 e4~
  e d2 f4
  g e f d
  e d c c
  c4 c8 d e4 f
  g4 f g c,
  f e8 d c4 bf
  a4 bf a f'
  a, bf2 c4
  d2. e4
  f2 c
  f2. r4
}


chrdStrophe = \chordmode {
  f2 bf
  f1
  f2 bf
  f1
  f2 c:/e
  d:m c4 f
  c2 g
  c1
  c1 s
  f1 s
  f4 c bf f
  bf1
  f2 c
  f1
  }
\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \transpose f d \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \transpose f d \stropheSopran }
        \new Voice = "StropheAlt" { \transpose f d \stropheAlt }
              >>
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheC
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheD
    \new Staff <<
      \new Voice = "StropheTenor" { \transpose f d \stropheTenor }
      >>
      \new Staff <<
        \new Voice = "StropheBass" { \transpose f d \stropheBass }
      >>
    >>
   %  \layout {
%       \context {
%         \Lyrics
%         \override LyricText.font-size = #1
%       }
%     }
  }
}
