\version "2.24.0"
sheetName = "Still senkt sich die Nacht hernieder"
sheetComposer = "Gerhard Wohlgemuth"
sheetPoet = "Hermann Heinz Wille"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
  Still senkt sich die Nacht her -- nie -- der.
  \set stanza = "1. " Rings das Land liegt 
  tief ver -- schneit.
  \set stanza = "1. " Und es klin -- gen al -- te Lie -- der,
  \set stanza = "1. " oh du schö -- ne Weih -- nachts -- zeit!
  \set stanza = "1. " Oh du schö -- ne Weih -- nachts -- zeit!
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = "2. "
  Steht in -- mit -- ten wei -- ßer Wäl -- der
  \set stanza = "2. " licht -- ge -- schmückt ein 
   grü -- ner Baum.
  \set stanza = "2. " Lich -- ter -- baum der fer -- nen Wäl -- der,
  \set stanza = "2. "
  oh du schö -- ner Frie -- dens -- traum!
  \set stanza = "2. "
  Oh du schö -- ner Frie -- dens -- traum!
}}

lyrStropheC = {
  \lyricmode {
  \set stanza = "3. "
  Stil -- le Nacht, die Ster -- ne kün -- den,
  \set stanza = "3. " Frie -- den ü -- ber 
   
  Flur und Feld,
  \set stanza = "3. " Auch der Mensch soll Frie -- den fin -- den.
  \set stanza = "3. " 
  Frie -- den, Frie -- den al -- ler Welt!
  \set stanza = "3. "
  Frie -- den, Frie -- den al -- ler Welt!
}}
lyrStropheD = {
  \lyricmode {
  \set stanza = "4. "
  Lan -- ge Nacht, nun tagt es wie -- der.
  \set stanza = "4. "
  Frie -- dens -- traum wird Wirk -- lich -- keit!
  \set stanza = "4. "
  Zu -- kunfts -- froh er -- klin -- gen Lie -- der,
  \set stanza = "4. " 
  oh du schö -- ne Weih -- nachts -- zeit!
  \set stanza = "4. "
  Oh du schö -- ne Weih -- nachts -- zeit!
}}

stropheSopran = \relative c'' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
  \time 4/4
  \key g \major
  b4 b d b
  a g8( a) b4 d \break
  b4 b d b
  a g8( e) d2 \break
  e4 fs g b
  c4. d8 b4 g \break
  e' g d b
  c e d2
  g4 fs8( e) d4 g,
  a4 b g2
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  d4 d fs g8( fs) 
  e4 d8( fs) g4 a
  g fs g g
  d e8( cs) d2
  c4 d d f 
  e4( fs) g d
  g2 b4( g)
  g( a) b2
  g2 fs4 d
  e( fs g2)
   }

stropheBass = \relative c' {
  \voiceTwo
  \clef "bass"
  \key g \major
  g4 c b e,
  c' r e,, fs 
  e r b' e,
  fs a d,2
  c'2 b4 g
  a d, g b
  c e, g2
  c4 d, g r
  c2 b4 e,
  a d, g2
}

stropheTenor = \relative c' {
  \voiceOne
  g4 c b e,
  c' b8( d) e4 fs
  e d8( c) b4 e,
  fs a
  d,2
  c2 b4 g
  a d g, b
  c e g2
  e4 fs g b8( d)
  e4 d8( c) b4 e,
  c d g( g,)

}

chrdStrophe = \chordmode {
  \set chordBassOnly = ##f
  g1 d2 g s1
  a2 d c g d:7 g
  c g a:m d c g d g
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
      \new ChordNames { \transpose g c \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \transpose g c \stropheSopran }
  %      \new Voice = "StropheAlt" { \transpose g c \stropheAlt }
      >>
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheC
    \new	Lyrics \lyricsto "StropheSopran" \lyrStropheD
 %     \new Staff <<
 %       \new Voice = "StropheTenor" { \transpose g c \stropheTenor }
 %       \new Voice = "StropheBass" { \transpose g c \stropheBass }
 %     >>
    >>
    \layout {
     \context {
       %\Lyrics
       %\override LyricText.font-size = #1
     }
   }
  }
}
