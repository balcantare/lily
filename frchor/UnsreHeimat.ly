\version "2.24.0"
sheetName = "Unsre Heimat"
sheetComposer = "Hans Naumilkat"
sheetPoet = "Herbert Keller"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    \set stanza = "1. "
   Uns -- re Hei -- mat,
   das sind nicht nur die Städ -- te
   und Dör -- fer.
   Uns -- re Hei -- mat sind auch all die Bäu -- me im Wald.
   Uns -- re Hei -- mat ist das Gras auf der Wie -- se,
   das Korn auf dem Feld und die Vö -- gel in der Luft
   und die Tie -- re der Er -- de.
   Und die Fi -- sche im Fluß sind die Hei -- mat,
   Und wir lie -- ben die Hei -- mat die schö -- ne,
   und wir schüt -- zen sie,
   weil sie dem Vol -- ke ge -- hört,
   weil sie un -- se -- rem Vol -- ke ge -- hört.
}}

strophe = \relative c'{
  \time 3/4
  \key d \major
  \partial 2
  fs4 g 
  a2. 2. 
  r4 fs g
  a b a 
  fs d e
  fs2. 2. \break
  r4 d e
  fs a fs 
  d b d 
  e d fs 
  e \break fs g 
  a2. 2.
  r4 fs g
  a d b 
  a fs gs
  a cs b 
  a \break gs a 
  fs2. 2.
  r4 a gs
  fs a gs
  fs cs' b
  a2. 2. \break
  r4 cs b
  a e' d 
  cs b cs
  a2. 2. \break
  r4 fs g
  a b a
  fs d e
  fs2. 2.
  r4 d e 
  fs a fs
  d b d 
  e d fs
  e \break fs g
  a fs g
  a d  cs
  d2.~
  d4
  \bar "|."
}
chrdStrophe = \chordmode {
  s2
  d2. s s
  s s s  
  s2. s b:m g e:m a d s s g
  d2 s4 fs2.:m  cs:7 fs2.:m s
  s s e:7
  a2. s s s e:7 a2. s
  a:7 d b:m d s s b:m g
  e:m a d a:7 d2.
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
    \new ChordNames { \transpose d c \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose d c \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    >>
  }
}
