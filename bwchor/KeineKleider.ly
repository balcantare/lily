\version "2.22.2"
sheetName = "Keine Kleider"
sheetPoet = "dt. Beate Tarrach"
\include "../include/book.ily"

lyrA = {
  \lyricmode {
  Na -- ne tso -- cha, na -- ne gad,
  mi ki -- nel man -- ge o dad
  sar me dža -- va pal o rom,
  mi ki -- nel man -- ge o rom ge o rom
}}

lyrB = {
  \lyricmode {
  Kei -- ne Klei -- der, kei -- ne Schuh'!
  Hab' nicht mal ein Ringe -- lein_da -- zu,
  Und will doch so gern_im Tanz_mich drehen,
  Will, daß al -- le
  nach mir sehen!
  nach mir sehen!
}}


lyrC = {
  \lyricmode {
    Lie -- ber Va -- ter, kauf' mir heut'
    schö -- ne Rin -- ge und_ein neues Kleid!
    A -- ber ach!  Wie wird_das Herz_mir schwer.
    Al -- le Ta -- schen sind uns leer!
    sind uns leer!
}}

lyrD = {
  \lyricmode {
    Wenn die Ro -- ma wei -- ter ziehn',
    Rings um --  her die Wie -- sen blühn'!
    Steck' mir ei -- ne Blume wunder -- bar,
    für den Lieb -- sten in das Haar.
    in das Haar.
}}

strophe = \relative c' {
  \accidentalStyle neo-modern 
  \time 4/4
  \key a \minor
  a4. b8 c( b) c4
  e4 d8( b) c2
  r4 a'8 a a4. 8
  a8( g) g( fs) g4( a4) \break
  \repeat volta 2 {
  r4 f8 f g4. f8
  e8( f) e( ds) e4( c)
  r4 d8 f e4 d }
  \alternative {
    { a4 a a'( g) }
    { a,4 gs a r }
  } \bar "||" \break
}

chrdStrophe = \chordmode {
  a1:m g2:7 c
  f1 c2 a:7
  d1:m a:m
  d2:m e:7 a:m a:7
  a4:m e:7 a2:m
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.5))
  }
  \header {
    subtitle = "Nane Tsocha"
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrA
    \new Lyrics \lyricsto "Strophe" \lyrB
    \new Lyrics \lyricsto "Strophe" \lyrC
    \new Lyrics \lyricsto "Strophe" \lyrD
    >>
  }
}
