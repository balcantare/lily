\version "2.22.2"
sheetName = "Keine Kleider"
sheetPoet = "dt. Beate Tarrach"
\include "../include/book.ily"

lyrA = {
  \lyricmode {
  \set stanza = #"1. "
  Na -- ne tso -- cha, na -- ne gad,
  \set stanza = #"1. "
  mi ki -- nel man -- ge o dad
  \set stanza = #"1. "
  sar me dža -- va pal o rom,
  \set stanza = #"1. "
  mi ki -- nel man -- ge o rom ge o rom
}}

lyrB = {
  \lyricmode {
  \set stanza = #"2. "
  Da -- do, kin man -- ge čin -- ja!
  \set stanza = #"2. "
  O čin -- ja som -- na ku -- ne.
  \set stanza = #"2. "
  Na -- ki -- ne -- sa o čin -- ja,
  \set stanza = #"2. "
  Na -- be -- ša -- va dro ča -- ja.
  dro ča -- ja.
}}

lyrC = {
  \lyricmode {
  \set stanza = #"3. "
  Za -- ge -- jom me dre da_sa -- do,
  \set stanza = #"3. "
  Sris -- ker -- diom ___ man sve -- to.
  \set stanza = #"3. "
  Pri -- ker -- diom les ke še -- ro,
  \set stanza = #"3. "
  Te ka -- mes mi -- ro i -- lo.
  ro i -- lo.
}}

lyrD = {
  \lyricmode {
  \set stanza = #"1. "
  Kei -- ne Klei -- der, kei -- ne Schuh'!
  \set stanza = #"1. "
  Hab' nicht mal ein Ringe -- lein_da -- zu,
  \set stanza = #"1. "
  Und will doch so gern_im Tanz_mich drehen,
  \set stanza = #"1. "
  Will, daß al -- le nach mir sehen!
  nach mir sehen!
}}


lyrE = {
  \lyricmode {
  \set stanza = #"2. "  
  Lie -- ber Va -- ter, kauf' mir heut'
  \set stanza = #"2. "
  schö -- ne Rin -- ge und_ein neues Kleid!
  \set stanza = #"2. "
  A -- ber ach!  Wie wird_das Herz_mir schwer.
  \set stanza = #"2. "
  Al -- le Ta -- schen sind uns leer!
  sind uns leer!
}}

lyrF = {
  \lyricmode {
  \set stanza = #"3. "  
  Wenn die Ro -- ma wei -- ter ziehn',
  \set stanza = #"3. "
  Rings um --  her die Wie -- sen blühn'!
  \set stanza = #"3. "
  Steck' mir ei -- ne Blume wunder -- bar,
  \set stanza = #"3. "
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
    \new Lyrics \lyricsto "Strophe" \lyrE
    \new Lyrics \lyricsto "Strophe" \lyrF
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
