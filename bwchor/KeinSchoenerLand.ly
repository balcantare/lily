\version "2.24.2"
sheetName = "Kein schöner Land in dieser Zeit"
sheetComposer = "Anton Wilhelm von Zuccalmaglio"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    \set stanza = #"1. "
  Kein schö -- ner Land in die -- ser Zeit,
  als hier das uns -- re weit und breit,
  wo wir uns fin -- den
  wohl un -- ter Lin -- den
  zur A -- bend -- zeit, 
  wo wir uns fin -- den
  wohl un -- ter Lin -- den
  zur A -- bend -- zeit. 
  
}}


lyrStropheB = {
  \lyricmode {
    \set stanza = #"2. "
    Da ha -- ben wir so man -- che Stund'
    ge -- ses -- sen wohl in fro -- her Rund'
    und ta -- ten sin -- gen
    die Lie -- der klin -- gen
    im Ei -- chen -- grund,
    und ta -- ten sin -- gen
    die Lie -- der klin -- gen
    im Ei -- chen -- grund.
}}

lyrStropheC = {
  \lyricmode { 
  \set stanza = #"3. "
  Daß wir uns hier in die -- sem Tal
  noch tref -- fen so viel hun -- dert -- mal,
  Gott mag es schen -- ken,
  Gott mag es len -- ken,
  er hat die Gnad',
  Gott mag es schen -- ken,
  Gott mag es len -- ken,
  er hat die Gnad'.
}}

lyrStropheD = {
  \lyricmode { 
    \set stanza = #"4. "
  Nun, Brü -- der, ei -- ne gu -- te Nacht,
  der Herr im ho -- hen Him -- mel wacht!
  In sei -- ner Gü -- ten
  uns zu be -- hü -- ten
  ist er be -- dacht,
  In sei -- ner Gü -- ten
  uns zu be -- hü -- ten
  ist er be -- dacht.
}}

lyrStropheE = {
  \lyricmode { 
  \set stanza = #"5. "
  Ihr Brü -- der wißt, was uns ver -- eint,
  ein' an -- dre Son -- ne hell uns scheint.
  In ihr wir le -- ben,
  zu ihr wir stre -- ben
  als die Ge -- meind',
  In ihr wir le -- ben,
  zu ihr wir stre -- ben
  als die Ge -- meind'.
}}



strophe = \relative c'' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 3/4
  \key g \major
  \partial 4.
  d,8 d[ d] 
  g4 b a8 g
  a4. \break d,8 d[ d]
  g4 b a8 g
  a4. \break  b8 g[ a]
  b8( d) c[ b] a g
  \time 2/4
  a( c) b a
  g4 a
  \time 3/4
  b4 r8 \break  b g[ a]
  b8( d) c[ b] a g
  \time 2/4
  a( c) b a
  g4 fs
  \time 3/4
  g4 r8
  \bar "|."
}

chrdStrophe = \chordmode {
  d4.:7
  g2. d g d g
  d2 e4:m d g2. g
  d4:7 g c:6 d g
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
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Lyrics \lyricsto "Strophe" \lyrStropheE
    >>
  }
}
