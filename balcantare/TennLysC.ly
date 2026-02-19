\version "2.24.0"
sheetName = "Tenn Lys (C)"
sheetComposer = "Sigvald Tvelt"
sheetPoet = "Eyvind Skeie"
\include "../include/book.ily"

trans_to = c

lyrStropheA = {
  \lyricmode {
  \set stanza = "1. "
  Tenn lys! Et lys skal bren -- ne
  for den -- ne lil -- le jord.
  Den blan -- ke him -- mel -- stjer -- ne,
  der vi -- og al -- le bor.
  Må al -- le del -- e hå -- pet
  så go -- de ting kan skje.
  Må jord og him -- mel mø -- tes. 
  Et lys er tent for det.
}}

lyrStropheB = {
  \lyricmode {
    \set stanza = "2. "
    Oh Licht der ei -- nen Ker -- ze,
    er -- strah -- le uns -- rer Welt,
    dem Stern, auf dem wir woh -- nen,
    der uns am Le -- ben hält.
    Daß uns die Hoff -- nung blei -- be,
    daß Gu -- tes bald ge -- schieht.
    Ein Licht, das weit -- hin leuch -- tet,
    das je -- der von uns sieht.
  }}

lyrStropheC = {
  \lyricmode {
  \set stanza = "3. "
  Oh Licht Es stehn zwei Ker -- zen für Lie -- be und Ver -- traun,
  für die, die mit dem Her -- zen für an -- dre Brü -- cken bau'n.
  Den Trau -- ri -- gen er -- strah -- le der ers -- ten Ker -- ze 
  Schein.
  Das zwei -- te Licht kann Kraft -- quell für die da trös -- ten
  sein.
}}
lyrStropheD = {
  \lyricmode {
  \set stanza = "4. "
  Oh Licht Drei Ker -- zen bren -- nen für Frei -- heit, Recht und Mut.
  Für je -- ne, die da käm -- pfen für al -- ler Men -- schen Gut.
  Daß uns die Kraft nicht schwin -- de, wolln wir zu -- sam  -- men
  stehn. Laßt uns im Schein der Ker -- zen den Weg ge -- mein -- sam gehn.
}}
lyrStropheE = {
  \lyricmode {
  \set stanza = "5. "
  Oh Licht vier Ker -- zen bren -- nen für IHN, der al -- le liebt,
  die Welt mit all den We -- sen, die rings -- um -- her es gibt.
  Der Him -- mel kommt auf Er -- den mit je -- dem klei -- nen Kind,
  vier Ker -- zen strahln den Wun -- dern, _ die le -- ben -- dig sind!
}}

introSopran = \relative c''' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
    \override Rest.staff-position = #-3
  \time 4/4
  \key d \major
  a2~ a8 fs a fs 
  e4 d2.
  <d b>2.( <fs d>4)
  e2.
}
introAlt = \relative c' {
  \voiceTwo
  fs1~ 1 a4 g2 fs8 e <e cs'>2. %(b2 a4)
}
chrdIntro = \chordmode {
  d1 b:m g a2.
}

stropheSopran = \relative c'' {
  \voiceOne
  \accidentalStyle neo-modern-voice-cautionary
    \override Rest.staff-position = #-3
  \time 4/4
  \key d \major
  \partial 4
  r8 a8 
  a2~ a8 fs a fs
  d4 d2 r8 b8
  g'4 fs e4. d8
  e2. \break
  r8 a8
  a2~ 8 fs a fs
  d4 d2 r8 b8
  g'4 fs e4. d8
  d2. \break r8 b'
  b4. fs8 fs4 b
  a fs2 r8 a8
  b4. a8 g4 b
  a2. \break a4
  a2~ a8 fs a fs
  d4 d2 r8 b
  g'4 fs e4. d8
  d2. r4
  
  \bar "|."
}

stropheAlt = \relative c' {                     
  \voiceTwo
  s8 a
  d2~ d8 d d d
  d4 d2 s8 b
  d4 d e4. d8
  e2. s8 cs8
  cs2~ cs8 8 8 8
  d4 d2 s8 b8 
  b4 d cs4. b8 
  a2. s8 d
  d4. d8 d4 d
  cs4 a2 s8 cs8
  b4. b8 b4 d
  cs2. a4
  cs2~ cs8 8 8 8 
  d4 d2 s8 b
  b4 d cs4. b8
  a2. s4
}

stropheBass = \relative c {
  \clef "bass"
  \key d \major 
  \partial 4
  % d1 b g a2.
  r8 a'8
  fs2~ 8 a fs a
  b4 b2 r8 b
  b4 a g4. b8
  a2. r8 a
  fs2~ 8 a fs a
  b4 b2 r8 b,
  e4 e a4. g8
  fs2. r8 b8
  b4. b8 b4 b
  fs4 fs2 r8 fs
  g4. g8 e4 e
  g2. a4
  fs2~ 8 a fs a
  b4 b2 r8 b,
  e4 e a4. g8
  fs2. r4
}
chrdStrophe = \chordmode {
  % d1 b:m g a
  s4 d1 b:m g2 e:m a1
  fs:m b:m e2:m a:7 d1
  b:m fs:m g2 e:m a1
  fs:m b:m e2:m a:7 d1
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last = ##f
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
     <<
       \new ChordNames { \transpose d \trans_to \chrdIntro }
       \new Staff <<
         \new Voice = "IntroSopran" { \transpose d \trans_to \introSopran }
         \new Voice = "IntroAlt" { \transpose d \trans_to \introAlt }
       >>
     >>
  }
  \score {
    <<
      \new ChordNames { \transpose d \trans_to \chrdStrophe }
      \new Staff <<
        \new Voice = "StropheSopran" { \transpose d \trans_to \stropheSopran }
        \new Voice = "StropheAlt" { \transpose d \trans_to \stropheAlt }
      >>
    \new	Lyrics \lyricsto "StropheAlt" \lyrStropheA
    \new	Lyrics \lyricsto "StropheAlt" \lyrStropheB
    \new	Lyrics \lyricsto "StropheAlt" \lyrStropheC
    \new	Lyrics \lyricsto "StropheAlt" \lyrStropheD
    \new	Lyrics \lyricsto "StropheAlt" \lyrStropheE
    \new Staff <<
      \new Voice = "StropheBass" {  \transpose d \trans_to \stropheBass }
    >>
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 20)
      
      \context {
        \Lyrics
       % \override LyricText.font-size = #1
      }
    }
  }
}
