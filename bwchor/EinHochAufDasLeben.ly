\version "2.24.2"
sheetName = "Ein Hoch auf das Leben"
sheetComposer = "Beate Tarrach"
\include "../include/book.ily"

tran = #(if (and (defined? 'book)
                 (string? book)
                 (equal? book "balcantare"))
           #{d#}
           #{f,#}
           )

lyrStropheA = {
  \lyricmode {
  %\set stanza = #"1. "
  Ein Hoch auf das Le -- ben,
  hier und ü -- ber -- all!
  Wie herr -- lich ist das Da -- sein
  auf dem Er -- den -- ball!
  So wie ein je -- des We -- sen,
  das rings um -- her ge -- deiht,
  so sind wir hier ge -- mein -- sam zu Gast
  auf Le -- bens -- zeit.
  \set stanza = #"1. "
  _ Wenn am Mor -- gen der ers -- te Vo -- gel singt,
  wenn am 
  \set stanza = #"1. "
  A -- bend vom Teich das Frosch -- kon -- zert
  er -- klingt, 
  \set stanza = #"1-3. "
  dann sa -- gen die Men -- schen:
  Nichts kann schö -- ner sein!
  \set stanza = #"1. "
  Das wah -- re Lied der Freu -- de singt das Le -- ben
  ganz al -- lein.
}}

skipA=\repeat unfold 49 \skip 8
skipB=\repeat unfold 11 \skip 8
lyrStropheB = {
  \lyricmode {
    \skipA
  \set stanza = #"2. "
  _ Wenn die Blü -- te im Mor -- gen -- tau
  sich reckt, wenn der 
  \set stanza = #"2. "
  Baum sei -- ne Äs -- te
  in den Him -- mel streckt,
  \skipB
  \set stanza = #"2. "
  Das wah -- re Bild der Freu -- de malt das Le -- ben
  ganz al -- lein.
}}

lyrStropheC = {
  \lyricmode {
    \skipA
  \set stanza = #"3. "
  _ Wenn ein Mensch sei -- nen Weg voll Lie -- be geht,
  wenn im 
  \set stanza = #"3. "
  Glau -- ben da -- ran, ein
  Wun -- der -- werk ent -- steht,
  \skipB
  \set stanza = #"3. "
  Den wah -- ren Weg der Freu -- de zeigt das Herz uns ganz
  al -- lein.
}}

lyrStropheD = {
  \lyricmode {
    \skipA
  \set stanza = #"4. "
  Wenn wir auf Er -- den den Weg der Lie -- be gehn',
  al -- le 
  \set stanza = #"4. " 
  We -- sen um uns mit off -- nem Her -- zen
  sehn',
  \set stanza = #"4. "
  dann wer -- den wir sa -- gen: 
  Nichts kann schö -- ner sein!
  \set stanza = #"4. "
  Wir le -- ben hier ge -- mein -- sam,
  nicht mehr nur für uns al -- lein!
}}

stropheSopran = \relative c'' {
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/4
  \key b \minor
  \partial 8
  \voiceOne
  fs8 
  fs4 fs8 e
  d8 b4.
  a8 a d cs
  b4. \break fs'8
  fs8. g16 fs8 e
  d8 b4.
 
  a8 a d cs
  b4. \break \repeat volta 2 {
    fs'8
    a8 a a g
    fs8 e4 e8
    d8. e16 fs8 d 
    cs4. \break cs8
    d8 b cs d
    fs4 e8 fs
    d8 b d cs 
    b4.
  }
  \oneVoice
  r8 r2 r2 r4. \break
  %\clef "treble^8"
  fs'8
  fs4 b 
  a fs8 e
  d e fs d
  e4 d8 e
  fs4 e8 d
  b4 a
  d8 e fs a
  e4. \break fs8 
  fs4 b8 a
  fs4 e
  d8 e fs d
  e4. \break e8 
  fs8 fs as as
  b fs fs e
  d e d cs
  b4.
  \bar "|."
}

stropheAlt = \relative c' {
   \voiceTwo
   fs8 
   b4 b8 cs
   b8 b4.
   fs8 fs a a
   b4. fs8 
   b8. b16 8 cs
   b8 b4.
   fs8 fs a a
   b4. b8
   d d d d
   a8 a4 a8
   b8. b16 b8 b
   fs4. fs8
   fs8 fs fs fs
   a4 a8 a 
   fs fs a a 
   b4. s8
}

chrdStrophe = \chordmode {
  s8
  b2:m s a b:m s s
   \once \override ChordName.X-offset = #-1
   a b:m 
   \once \override ChordName.X-offset = #-1
   d 
   \once \override ChordName.X-offset = #-1   
   a b:m fs:m7 b:m
  a b4:m fs:m7 b2:m s s s
  \once \override ChordName.X-offset = #1
  b:m s s 
  \once \override ChordName.Y-offset = #0.5
  a 
  \once \override ChordName.X-offset = #1
  b:m s s 
  \once \override ChordName.Y-offset = #0.5
  fs:m7 
  \once \override ChordName.X-offset = #1
  b:m s s
  \once \override ChordName.Y-offset = #0.75
  a b4:m fs 
  \once \override ChordName.X-offset = #1
  
  b2:m b4:m fs b4.:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem
             
  \score {
    <<
    \new ChordNames \transpose d \tran \chrdStrophe 
    \new Staff \with {\accepts ChordNames}
    <<
      \context Voice = "StropheSopran" { \transpose d \tran \stropheSopran }
      \context Voice = "StropheAlt" { \transpose d \tran \stropheAlt }
      >>
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheA
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheB
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheC
    \new Lyrics \lyricsto "StropheSopran" \lyrStropheD
    >>
  }
}
