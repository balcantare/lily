\version "2.24.2"
sheetName = "Bunt sind schon die Wälder"
sheetComposer = "Johann Friedrich Reichart 1799"
sheetPoet = "Johann Gaudenz von Salis-Seewis 1793"
\include "book.ily"


lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Bunt sind schon die Wäl -- der,
  gelb die Stop -- pel --
  \set stanza = #"1. " fel -- der,
  und der Herbst be -- ginnt.
  \set stanza = #"1. "
  Ro -- te Blät -- ter fal -- len,
  grau -- e Ne -- bel
  \set stanza = #"1. " wal -- len,
  küh -- ler weht der Wind.
}}

lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Wie die vol -- le Trau  -- be
  aus dem Re -- ben --
  \set stanza = #"2. " lau -- be
  pur -- pur -- far -- big strahlt!
  \set stanza = #"2. "
  Am Ge -- län -- der rei -- fen
  Pfir -- sich -- e, mit
  \set stanza = #"2. "
  Strei -- fen
  rot und weiß be -- malt.
}}


lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  Sieh, wie hier die Dir -- ne
  em -- sig Pflaum und
  \set stanza = #"3. "
  Bir -- ne
  in ihr Körb -- chen legt,
  \set stanza = #"3. "
  dort mit leich -- ten Schrit -- ten
  je -- ne gold -- nen
  \set stanza = #"3. "
  Quit -- ten
  in den Land -- hof trägt.
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = #"4. "
  Flin -- ke Trä -- ger sprin -- gen,
  und die Mäd -- chen
  \set stanza = #"4. " sin -- gen,
  al -- les ju -- belt froh!
  \set stanza = #"4. "
  Bun -- te Bän -- der schwe -- ben
  zwi -- schen ho -- hen
  \set stanza = #"4. "
  Re -- ben
  auf dem Hut von Stroh.
}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "
  Gei -- ge tönt und Flö -- te
  bei der A -- bend --
  \set stanza = #"5. " rö -- te
  und im Mon -- des -- glanz;
  \set stanza = #"5. "
  jun -- ge Win -- ze -- rin -- nen
  win -- ken und be --
  \set stanza = #"5. "
  gin -- nen
  fro -- hen Ern -- te -- tanz.
}}

strophe = \relative c'' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 6/8
  \key g \major
  g4 g8
  g8( fs) g
  a4. g
  b4 b8
  b( a) b
  c4. b
  a4 a8
  g( b) cs,
  d4.~ d4 r8
  b'4 a8
  g4 fs8
  e4. e4.
  c'4 b8
  a4 g8
  fs4. fs
  g8( b) d
  d,8( e) fs
  g4.~ g4 r8
  \bar "|."
}

chrdStrophe = \chordmode {
  g2. d4.:7 g s2.
  d4.:7 g
  c:6 a:7
  d d:7
  g e:m
  c s
  a:m s
  d d:7
  g d:7
  g s
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
