\version "2.22.2"
sheetName = "Tourdion"
sheetComposer = "Pierre Attaingnant, 1530"
#(define book-staff-size 16)
\include "../include/book.ily"

lyrStropheSopranA = {
  \lyricmode {
  \set stanza = #"1."
  Quand je bois du vin clai -- ret,
  a -- mi tout  tour -- ne, tour -- ne, tour -- ne,
  tour -- ne,
  aus -- si dé -- sor -- mais je bois
  An -- jou ou Ar -- bois,
  chan -- tons et bu -- vouns,
  à ce fla -- con fai -- sons la guer -- re,
  chan -- tons et bu -- vouns,
  mes a -- mis, bu -- vons donc!
}}

lyrStropheSopranB = {
  \lyricmode {

  \set stanza = #"2. "
  Hei, der gu -- te küh -- le Wein macht al -- les
  kun -- ter -- kun -- ter -- bunt sich dre -- hen,
  trinkt mit uns, wir schen -- ken ein
  An -- jou und Ar -- bois.

  Vi -- vat, singt und trinkt und leert
  die Fla -- sche bis zum Grun -- de,
  singt und trinkt mit uns den _ Wein,
  schen -- ket ein!
}}

lyrStropheAltA = {
  \lyricmode {
  \set stanza = #"1."
  Le bon vin nous a ren -- du gais,
  chan -- tons, ou -- bli -- ons nos pei -- nes,
  chan -- tons! \skip 2
  En man -- geant d'un gras jam -- bon,
  à ce fla -- con fai -- sons la guer -- re!
}}

lyrStropheAltB = {
  \lyricmode {
  \set stanza = #"5. "
  Hei, der gu -- te küh -- le Wein!
  Schenkt ein und leert __ _ _ _ ihn bis zum Grun -- de!

  Hat man auch ein Schin -- ken -- bein,
  wie schmeckt der Wein in gu -- ter Run -- de!
}}

lyrStropheBass = {
  \lyricmode {
  \set stanza = #"5. "
  Bu -- vons bien, bu -- von mes a -- mis,
  trin -- quons, bu -- vons, gai -- ment chan -- tons!
}}

stropheSopran = \relative c' {
  \time 3/2
  \key d \major
  \bar ".|:"
  \repeat volta 2 {
  e4 fs g a g fs
  e2. fs4 g a
  b a g g a fs
  g2( fs4 e) d2
  e4 fs g a g fs
  e2 g fs
  e1 d2
  e1.
  }
  \break
  \repeat volta 2 {
   b'2. a4 b cs
   b1 b2
   d4 cs b a g fs
   g2.( fs4) e2
   b'2. a4 b cs
   b2 a4\( g\) fs2
   e1 d2
   e1.
  }
  %\bar "|."
}

stropheAlt = \relative c' {
  \key d \major
  b1 b2
  e1 e2
  d1 e2
  e2 a1
  g1 e2
  b4\( a b cs\) d2
  b2 b1
  b1\( b2\)
  g'1 g2
  g1 g2
  fs1 fs2
  e1 e2
  d1 d2
  d1 d2
  b2 b1
  b1 b2
}

stropheTenor = \relative c' {
  \clef "bass"
  \key d \major
  \voiceOne
  g1 e2
  b'1 b2
  b2 b c
  b1 a2
  b1 b2
  g1 a2
  g2 fs4 e fs2
  s1. % e1.^\fermata
  e'1 e2
  d1 d2
  d1 d2
  b1 b2
  b1 b2
  b1 a2
  g2 fs1
  s1 e2
}

stropheBass = \relative c {
  %\clef "bass"
  %\key d \major
  \voiceTwo
  e1 e2
  e1 e2
  g2 b2 a
  e fs1
  e1 e2
  e1 d2
  e2 b1
  e1.
  e1 e2
  g1 g2
  d1 d2
  e1 e2
  g1 g2
  g1 d2
  e2 b1
  e1 e2
}

chrdStrophe =  \chordmode {
 e1.:m s
 s s s

 e1:m d2
 e1:m d2
 e1.:m
 g  s d e:m
 g s2 d s e:m s d e:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = #f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "StropheSopran" { \stropheSopran }
      >>
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheSopranA
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheSopranB
    \new Staff <<
      \new Voice = "StropheAlt" { \stropheAlt }
    >>
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheAltA
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheAltB
    \new Staff <<
      \new Voice = "Tenor" { \stropheTenor }
      \new Voice = "Basso" { \stropheBass }
    >>
    \new Lyrics \lyricsto "Basso" \lyrStropheBass
    >>
    \layout {
      \context {
        \Lyrics
        \override LyricText #'font-size = #1
      }
    }
  }
}
