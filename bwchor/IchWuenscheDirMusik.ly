\version "2.24.2"
sheetName = "Ich wünsche dir Musik"
sheetComposer = "Frowin"
\include "../include/book.ily"

skipA=\repeat unfold 16 \skip 8

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1+5. "
  Ich wün -- sche dir Mu -- sik und ei -- nen
  Son -- nen -- un -- ter -- gang,
  ein Mor -- gen -- rot und ei -- ne lau -- e Brie -- se.
  Ich wün -- sche dir Mu -- sik und Glück dein gan -- zes
  Le -- ben lang, am bes -- ten fang' wir heu -- te 
  da -- mit an.
  Ja -- la -- la 
  la -- la -- la "..."
  \skipA
   \set stanza = #"2. "
  Ich wün -- sche dir die Leich -- tig -- keit,
  ü -- ber je -- den Stein zu sprin -- gen,
  \set stanza = #"2. " und daß du so zum Zeit -- ver -- treib aus vol -- ler 
  Brust willst sin -- gen.
  \set stanza = #"2. " Daß du glück -- lich bist im Au -- gen -- blick,
  auch wenn der Re -- gen fällt
  \set stanza = #"2. " und daß du als Licht er -- strahlst  in die -- ser Welt.
}}

lyrStropheB = {
  \lyricmode {
  \repeat unfold 21 \skip 8
  \set stanza = #"5. " Blu -- men -- wie -- se
  \repeat unfold 47 \skip 8
   \set stanza = #"3. "
   Ich wün -- sche dir das Zu -- ver -- sicht dich _ 
   aus dem Schat -- ten führt, _
   \set stanza = #"3. " und daß es steht im rech -- ten Licht wenn je -- mand dich be -- rührt.
   _ \set stanza = #"3. " Daß du Lie -- be und Ge -- bor -- gen -- heit als_Ge -- schenk an -- neh -- men kannst
   \set stanza = #"3. " und daß du vor lau -- ter Glück mal wie -- der tanzt.
}}


lyrStropheC = {
  \lyricmode {
  \repeat unfold 72 \skip 8  
  \set stanza = #"4. "
  Ich wün -- sche dir den hel -- len Mut,
  dei -- nem Bauch -- ge -- fühl zu fol -- gen,
  \set stanza = #"4. " _ zie -- he o -- der schmeiß den Hut, aber lach _ 
  über die Fol -- gen.
  \set stanza = #"4. " Daß der Wind mit sei -- nen Schwin -- gen dei -- ne
  Träu -- me nicht ver -- weht,
  \set stanza = #"4. " daß dein Se -- gel -- schiff stets gut vor An -- ker geht.
}}

lyrStropheD = {
  \lyricmode {
  \set stanza = #"4. "
}}

lyrStropheE = {
  \lyricmode {
  \set stanza = #"5. "
}}

strophe = \relative c' {
    %\voiceTwo
  \accidentalStyle neo-modern %-voice-cautionary
  \time 2/2
  \key c \major
  \partial 4
  c4
  g'4 g g c 
  a g f e
  d4 d4 d e4 
  g,2 r4 %\break 
  g4
  a'4 a a a
  a g a g 
  g4 e2.
  r2.
  %\break 
  c4
  g'4 g g c 
  a g f e
  d4 d4 d e4 
  g,2 r4 %\break 
  c
  f4 f f g 
  e4 d d4 c
  c2 r2
  r2 \break
  \mark \markup{ \fontsize #4 *}
  \repeat volta 2 {
    \tuplet 3/2 {c'4 a4 g}
    a2 g4 f
    d2 e4 f 
    g2 f4 e
    c2. d8 e
    f2 e4 d 
    b2 c4 d 
  } \alternative {
    { e1 r2 }
    { c1 r2. }
  }
  \bar "||" \break
  c4
  g'4 g g g 
  g f e c8 8
  f4 f4 f4 f
  f4 f2 \break c4
  f4 f f f
  f e d c
  e e e e 
  e e2 \break e8 g
  c4 c c c
  c b a  e
  g f f e 
  f2. \break c8 c
  f4 f f g 
  e d d c 
  c1 r2
  \mark \markup{ \fontsize #4 *}
 \bar "|."
}


chrdStrophe = \chordmode {
  s4
  c1 f g c f s c s
  c f g c
  f g c s
  f g c a:m
  f g c s2 c1 s
  c s d:m s f
  g c s a:m s
  d:m s f g c
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
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
