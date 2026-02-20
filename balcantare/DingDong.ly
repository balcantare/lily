\version "2.24.0"
sheetName = "Ding Dong! Merily on high"
sheetPoet = "Branle de l'Officiel"
sheetComposer = "aus Toinet Arbeau's Orchesographie, 1588"
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

lyrStropheSopranA = {
  \lyricmode {
  \set stanza = \stanzaA
  Ding dong!
  mer -- ri -- ly on high in heav'n the bells are 
  ring -- ing:
  Glo -- ri -- a, Ho -- san -- na in ex -- cel -- sis!
}}

lyrStropheSopranB = {
  \lyricmode {
  Ding dong!
  ve -- ri -- ly the sky is riv'n with An -- gel sing -- ing.
}}
lyrStropheSopranC = {
  \lyricmode {
  \set stanza = \stanzaB
  Ding dong!
  tönt es ü -- ber -- all,
  hört wie die Glo -- cken klin -- gen.
}}

lyrStropheSopranD = {
  \lyricmode {
  Ding dong!
  und mit fro -- hem Schall die En -- gels -- chö -- re sin -- gen.
}}

lyrStropheAltA = {
  \lyricmode {
  \set stanza = \stanzaA
  Ding dong! high bells are ring -- ing:
  Glo -- ri -- a, Ho -- san -- na!
}}

lyrStropheAltB = {
  \lyricmode {
  Ding dong! sky An -- gel sing -- ing.
}}
lyrStropheAltC = {
  \lyricmode {
  \set stanza = \stanzaB
  Ding dong! all, Glo -- cken -- klin -- gen.
}}

lyrStropheAltD = {
  \lyricmode {
  Ding dong! Schall Chö -- re sin -- gen.
}}

lyrStropheBaritonA = {
  \lyricmode {
  \set stanza = \stanzaA
  mer -- ri -- ly high in heav'n the bells are ring -- ing:
  Glo -- ri -- a, Glo -- ri -- a, Glo -- ri -- a, 
  Ho -- san -- na in ex -- cel -- sis!
}}

lyrStropheBaritonB = {
  \lyricmode {
    ve -- ri -- ly sky is riv'n with An -- gel sing -- ing.  
}}
lyrStropheBaritonC = {
  \lyricmode {
  \set stanza = \stanzaB
  ü -- ber _ -- all,
  hört wie die Glo -- cken klin -- gen.
}}

lyrStropheBaritonD = {
  \lyricmode {
  mit fro -- hem Schall die En -- gels -- chö -- re sin -- gen.
}}
stropheSopran = \relative c'' {
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/4
  \key g \major
  \repeat volta 2 {
  g4 g a8 g fs e 
  d2. d4
  e g g fs g2 g4 r}
  \break
  \repeat volta 2 {
  d'4.( c8 b c d b
  a1
  b4. a8 g a b g
  fs1
  g4. fs8 e fs g) e
  d2. d4
  e g g fs 
  g2 g
  }
}

stropheAlt = \relative c'' {
  \key g \major
  <b d>2 c
  b2. r4
  a2 b
  g2 g4 r
  b1(
  c4. b8 a b c a
  g1
  a4. g8 fs g a fs
  e1
  fs4.) e8 d4 d4
  c1
  b
}

stropheBariton = \relative c {
  \clef "bass"
  \key g \major
  b2 c4 d
  b2 b
  c4 e d c
  d( c) b r
  g'( fs e g
  fs) e d r
  e( d e g
  a ) b  c r
  c( b c2
  d4) c b g
  c b a fs
  g2 g
}

chrdStrophe = \chordmode {
  g2 c4 d
  g1
  c2 d
  g1
  g1 d e:m d c d2 g c d g1
}

intro = \relative c'' {
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/4
  \key g \major
  b2 c 
  b4. a8 g4 b
  a4 g2 fs4
  g2 g \bar "||"
}

chrdIntro = \chordmode {
  g2 c4 d
  g1
  c2 d
  g1
}


\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
    ragged-last = ##f
  }
  \bookItem
  \score {
    <<
     \new ChordNames { \chrdIntro }
     \new Staff <<
       \new Voice = "Intro" { \intro}
     >>
    >>
  }
  \score {
    \layout { #(layout-set-staff-size-with-jazz 20) }    
    <<
      \new ChordNames { \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \stropheSopran }
      >>
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheSopranA
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheSopranB
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheSopranC
      \new Lyrics \lyricsto "StropheSopran" \lyrStropheSopranD
      \new Staff <<
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheAltA
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheAltB
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheAltC
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheAltD
    \new Staff <<
      \new Voice = "StropheBariton" {  \stropheBariton }
      >>
    \new Lyrics \lyricsto "StropheBariton" \lyrStropheBaritonA
    \new Lyrics \lyricsto "StropheBariton" \lyrStropheBaritonB
    \new Lyrics \lyricsto "StropheBariton" \lyrStropheBaritonC
    \new Lyrics \lyricsto "StropheBariton" \lyrStropheBaritonD
    >>
  }
}
