\version "2.22.2"
sheetName = "Sag mir wo die Blumen sind, Hdźe te kwětki su, praj hdźe"
sheetComposer = "Pete Seeger"
sheetPoet = "dt Max Colpet, sb Tomasz Nawka"
\include "../include/book.ily"

skipA = \repeat unfold 13 { \skip 2 }

lyrStropheA = {
  \skipA
  \lyricmode {
  \set stanza = "1. "
  Sag mir wo die Blu -- men sind,
  wo sind sie ge -- blie _ -- ben?
  \set stanza = "1. "
  Sag mir, wo die Blu -- men sind,
  was ist ge -- scheh'n?
  \set stanza = "1. "
  Sag mir, wo die Blu -- men sind,
  Mäd -- chen pflück -- ten sie ge -- schwind.
  Wann wird man je ver -- stehn,
  wann wird man je ver -- stehn.
}}

lyrStropheB = {
  \lyricmode {
  \skipA
  \set stanza = "2. "
  Hdźe te hol -- cy su, praj hdźe,
  hdźe su wo -- ne wo -- sta -- łe?
  \set stanza = "2. "
  Hdźe te hol -- cy su, praj hdźe,
  što z‿ni -- mi je?
  \set stanza = "2. "
  Hdźe te hol -- cy su, praj hdźe,
  mu -- žo -- jo sej wza -- chu je.
  Hdy swět to zro -- zu -- mi,
  hdy swět to zro -- zu -- mi.
 }}

lyrStropheC = {
  \lyricmode {
   \skipA
   \set stanza = "3. "
   Sag mir wo die Män -- ner sind,
   wo sind sie ge -- blie _ -- ben?
   \set stanza = "3. "
   Sag mir, wo die Män -- ner sind,
   was ist ge -- scheh'n?
   \set stanza = "3. "
   Sag mir, wo die Män -- ner sind,
   Zo -- gen fort, der Krieg be -- ginnt.
}}
skipE = \repeat unfold 7 { \skip 2 }
skipF = \repeat unfold 5 { \skip 2 }
lyrStropheD = {
  \lyricmode {
  \skipA
  \set stanza = "4. "
  Hdźe su wo -- ja -- cy, 
  praj mi, hdźe su wo -- ni wo -- sta -- li?
  \set stanza = "4. "
  Hdźe su wo -- ja -- cy, 
  praj mi, do -- kal su šli?
  \set stanza = "4. "
  Hdźe su wo -- ja -- cy, 
  praj mi, wě -- tr nad jich ro -- wa -- mi.
  
}}

lyrStropheE = {
  \lyricmode {
    \skipA
    \set stanza = "5. "
    Sag mir wo die Grä -- ber
    sind, wo sind sie ge -- blie _ -- ben?
    \set stanza = "5. "
    Sag mir wo die Grä -- ber
    sind, was ist ge -- scheh'n?
   \set stanza = "5. "
   Sag mir wo die Grä -- ber sind,
   Blu -- men blüh'n im Som -- mer -- wind.
}}

lyrStropheF = {
  \lyricmode {
    \skipA
    \set stanza = "6. "
    Hdźe te kwět -- ki su, praj hdźe,  
    hdźe su wo -- ne wo -- sta -- łe?
    \set stanza = "6. "
    Hdźe te kwět -- ki su, praj hdźe,  
    što z‿ni -- mi je?
    \set stanza = "6. "
    Hdźe te kwět -- ki su, praj hdźe,  
    hol -- cy zeš -- ći -- pa -- chu  je.
}}



strophe = \relative c'' {
  %\voiceOne
  \time 2/2
  \key c \major
  %\partial 2.
  \mark \markup{ \fontsize #4 *}
  c2~  c8 b c b
  a2~ a8 b8 c e
  d2~ 8 e f a
  g1
  \bar "||" \break
  r4 g,8 a g4. f8
  e8 d4 c8~ 2
  r4 c'8 c c4. d8
  b8 a4 g8~ g2
  r4 g8 a g4. f8
  e8 d4 c8~ 2
  r4 f f4. e8
  d1
  r4 g8 a g4. f8
  e8 d4 c8~ 2
  r4 c'8 c c4. d8
  b8 a4 g8~ g2 \break
  r4 a f d
  c4 e8 g~ 2
  r4 a f e
  d2~ d8( e) d c~
  \mark \markup{ \fontsize #4 *}
  c1
  \bar "|."
}

chrdStrophe = \chordmode {
  %\set chordBassOnly = ##t
  c1 a:m d:m g
  c a:m f g
  c a:m
  d:m g
  c a:m f g
  f c
  f g c
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    %ragged-last-bottom = #f
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
    \new Lyrics \lyricsto "Strophe" \lyrStropheF
    >>
  }
}
