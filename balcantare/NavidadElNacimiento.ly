\version "2.24.0"
sheetName = "Nuestra Navidad - 3 - El Nacimiento"
sheetComposer = "Ariel Ramierez"
#(define book-staff-size 22)
\include "../include/book.ily"


lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
   No -- che‿a -- nun -- cia -- da,
   No -- che de‿a -- mor,
   \set stanza = "1. "
   Dios ha na -- ci -- do pé -- ta -- lo‿y flor.
   \set stanza = "1. "
   To -- dos si -- len -- cid‿y se -- re -- ni -- dad,
   \set stanza = "1. "
   Pay a los hom -- bres,
   Es na -- vi -- dad.

   An -- ge -- les can -- ten so -- bre‿el por -- tal,
   Dios, ha na -- ci -- do
   es na -- vi -- dad.
}}
lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    En el pe -- se -- bre,
   Mi re -- den -- tor,
   \set stanza = "2. "
   Es men -- sa -- je -- ro de paz y‿a -- mor.
   \set stanza = "2. "
   Cuan -- do son -- ri -- e, Se‿ha -- ce la luz,
   \set stanza = "2. "
   Y‿en sus bra -- ci -- tos,
   Cre -- ce‿u -- na cruz.
  }
}
lyrStropheC = {
  \lyricmode {
    \set stanza = "3. "
   Es -- ta‿es la no -- che Que pro -- me -- tio
    \set stanza = "3. "
    Dios a los hom -- bres y ya lle -- gó.
    \set stanza = "3. "
    Es no -- che bue -- na no‿hay que dor -- mir,
    \set stanza = "3. "
    Dios ha na -- ci -- do, Dios es -- ta‿a -- qui.
}}

strophe = \relative c'' {
  \accidentalStyle neo-modern-voice-cautionary
  \time 6/8
  \key g \major
  b4. b8 c4
  d2 g,4
  g'4. e8 g4
  d2. \break
  c4. d8 c4
  b2 b4
  g4. g8 b4
  a2. \break
  b4. b8 c4
  d2 g,4
  g4. g8 g'4
  g2 r4 \break
  e4. d8 c4
  b2 g4
  g4. g8 a4
  g2. \break \bar "||"
  a'4. d,8 d4
  d2 b4
  b4. c8 d4
  e2. \break
  fs,4. g8 a4
  b2 b4
  b cs d
  e2 a,4
  \bar "|."
}

chrdStrophe = \chordmode {
  g2 a4:m
  g2.:/b
  c g
  d:7/a
  g2 \set chordBassOnly = ##t
  g4:/fs
  g2:/e a4:7
  d2.:7
  g2 a4:m
  \set chordBassOnly = ##f
  g2.:/b
  g c2 e4
  a2.:m
  g2:/d ef4:7
  d2. g
  d2 \set chordBassOnly = ##t
  d4:/fs
  g2.
  \set chordBassOnly = ##f
  f4:dim a:m/e e:m7
  c4:/b
  \set chordBassOnly = ##t
  c:/a c:/g
  \set chordBassOnly = ##f
  b4.:7/a g:6
  e2.:m
  e4:m a:7/e e:m
  a2:7 d4:7
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
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    >>
  }
}
