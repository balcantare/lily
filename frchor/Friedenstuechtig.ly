\version "2.24.0"
sheetName = "Friedenstüchtig"
sheetComposer = "Beate Tarrach"
%#(define book-staff-size 20)
\include "../include/book.ily"

lyrA = {
  \lyricmode {
  \set stanza = "1. "
  Ist das der Weg in die Kriegs -- tüch -- tig -- keit
  \set stanza = "1. "
  fort von je -- der Ver -- nunft.
  Ist das die Wen -- de, die 
  \set stanza = "1. "
  ihr pro -- phe -- zeit,
  dann sa -- gen wir euch nicht mit uns!
  Wir wol -- len Frie -- dens -- tüch -- tig 
  wer -- den nein wir ma -- chen den Kriegs -- kurs nicht mit!
  wo -- nach wir uns seh -- nen ist Frie -- den auf 
  Er -- den und das ist ein ur -- al -- tes Lied.
  wo -- nach wir uns seh -- nen  ist Frie -- den 
  auf Er -- den und das ist ein ur -- al -- tes
  Lied.
  
}}

lyrB = {
  \lyricmode {
  \set stanza = "2. "
  Wird das Wa -- gon -- werk zur Pan -- zer -- fa -- brik
  \set stanza = "2. "
  wohin führt uns die -- ser Plan.
  Schritt _ für Schritt rüs -- tet 
  \set stanza = "2. "
  ihr für den Krieg,
  doch wir sa -- gen stoppt die -- sen Wahn!
}}

lyrC = {
  \lyricmode {
  \set stanza = "3. "
  Ist euch der Wil -- le der Men -- schen 
  e -- gal, 
  \set stanza = "3. "
  die_die -- sen Krieg nie -- mals
  woll'n.
  Gabt ihr uns nicht eu -- er 
  \set stanza = "3. "
  Wort vor der Wahl
  Re -- spekt eu -- ren Freun -- den zu zoll'n.
 }}

lyrD = {
  \lyricmode {
  \set stanza = "4. "
  Wollt ihr das einst all die Men -- schen im Land,
  \set stanza = "4. "
  fried -- liches Le -- ben ver -- lier'n.
  Droht uns -- rer Er -- de ein 
  \set stanza = "4. "
  rie -- si -- ger
  Brand, wir wol -- len _ das nicht ris -- kier'n.
}}

lyrE = {
  \lyricmode {
    \set stanza = "5. "
    Frie -- den das ist _ der ein -- zi -- ge Weg
    \set stanza = "5. "
    Frieden ist al -- les was zählt.
    Krieg und Zer -- stö -- rung ver -- 
    \set stanza = "5. " feh -- len den
    Zweck, _ 
    Blü -- hen soll un -- se -- re Welt.
}}

lyrF = {
  \lyricmode {
  \set stanza = "6. "
}}

lyrG = {
  \lyricmode {
    \set stanza = "7. "
}}

voice = \relative c' {
  \time 4/4
  \key b \minor
  r1 r1 \break
  b8 b4 d8 fs4 fs8 g 
  fs4 d8 cs b2 
  cs4. d8 cs8 b4 a8
  b2 r2
  b8 b4 d8 fs8 fs4 g8
  fs4 d8 cs b4. fs'8
  fs8 e4 d8 cs4 d8 e
  fs2 r8 \break d8 d d
  g4 g g4. fs8 
  fs4 e r4 g8 g
  fs8 e4 d8 d d4 e8 
  fs2. r8 fs8
  g8 g4 a8 b8 a4 g8
  g8 fs4 e8 d8 b4 e8
  fs4 e8 d fs4 e8 d
  fs2. r8 fs
  g8 g4 a8 b8 a4 g8 
  g8 fs4 e8 d8 b4 d8
  fs8 e4 d8 fs8 e4 d8
  b2. r4
}

chrd = \chordmode {
  %\set chordBassOnly = ##t
  b1:m s b1:m s a b:m b:m s a d
  g s d s e:m d fs:7 b:m
  g b:m fs:7 b:m
  
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    %ragged-last-bottom =  ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrd }
    \new Staff <<
      \new Voice = "Strophe" { \voice }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrA
    \new Lyrics \lyricsto "Strophe" \lyrB
    \new Lyrics \lyricsto "Strophe" \lyrC
    \new Lyrics \lyricsto "Strophe" \lyrD
    \new Lyrics \lyricsto "Strophe" \lyrE
    \new Lyrics \lyricsto "Strophe" \lyrF
    \new Lyrics \lyricsto "Strophe" \lyrG 
    >>
  }
}
