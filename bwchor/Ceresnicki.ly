\version "2.22.2"
sheetName = "Čerešnički"
sheetComposer = "slowakisches Volkslied, arr. Reinhard Simmgen"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  \set stanza = #"1. "
  Če -- reš -- nič -- ky,
  Če -- reš -- nič -- ky,
  če -- reš -- ne
  vy ste sa mi ro -- zsy -- py -- ly
  na ce -- stě.
  \set stanza = #"1. "
  Če -- reš -- nič -- ky,
  Če -- reš -- nič -- ky,
  če -- reš -- ne
  vy ste sa mi ro -- zsy -- py -- ly
  na ce -- stě.
  \set stanza = #"1. "
  Kdo vás naj -- de,
  kdo vás pos -- bě -- rá,
  já som ma -- la vče -- ra
  ve -- čér fra -- je -- ra.
}}
lyrStropheB = {
  \lyricmode {
  \set stanza = #"2. "
  Byl to fra -- jer ma -- lo -- va -- ný
  ak rů -- ža,
  to -- ho bych si vy -- vo -- li -- la
  za mu -- ža.
  \set stanza = #"2. "
  Byl to fra -- jer ma -- lo -- va -- ný
  ak rů -- ža,
  to -- ho bych si vy -- vo -- li -- la
  za mu -- ža.
  \set stanza = #"2. "
  a nič bych mu ro -- bit ne -- da -- la,
  je -- nom a -- ko rü -- žu
  bych ho cho -- va -- la.
}}
lyrStropheC = {
  \lyricmode {
  \set stanza = #"3. "
  A -- ko rů -- žu, a -- ko rů -- žu
  čer -- ve -- nú,
  já bych bo -- la
  je -- ho že -- nu
  mi -- le -- nu.
  \set stanza = #"3. "
  A -- ko rů -- žu, a -- ko rů -- žu
  čer -- ve -- nú,
  já bych bo -- la
  je -- ho že -- nu
  mi -- le -- nu.
  \set stanza = #"3. "
  já bych bo -- la že -- nu la -- li -- ja,
  a on mo -- ja rů -- ža,
  rů -- ža  čer -- ve -- ná.
}}

lyrStropheAalt = {
  \lyricmode {
  \repeat unfold 48 { \skip 8 }
  \set stanza = #"alt: "
  pos -- bě -- rá,
}}
lyrStropheBalt = {
  \lyricmode {
  \repeat unfold 48 { \skip 8 }
  \set stanza = #"alt: "
  ne -- da -- la,
}}
lyrStropheCalt = {
  \lyricmode {
  \repeat unfold 48 { \skip 8 }
  \set stanza = #"alt: "
  la -- li -- ja,
}}

lyrStropheAbass = {
  \lyricmode {
  \set stanza = #"1. "
  Če -- reš -- nič -- ky,
  če -- reš -- ne
  ro -- zsy -- py -- ly
  na ce -- stě.
  \set stanza = #"1. "
  Če -- reš -- nič -- ky,
  če -- reš -- ne
  ro -- zsy -- py -- ly
  na ce -- stě.
  \set stanza = #"1. "
  Kdo vás naj -- de,
  kdo vás pos -- bě -- rá,
  já som ma -- la vče -- ra
  fra -- je -- ra.
}}
lyrStropheBbass = {
  \lyricmode {
  \set stanza = #"2. "
  Byl to fra -- jer %ma -- lo -- va -- ný
  ak rů -- ža,
  %to -- ho bych si
  vy -- vo -- li -- la
  za mu -- ža.
  \set stanza = #"2. "
  Byl to fra -- jer %ma -- lo -- va -- ný
  ak rů -- ža,
  %to -- ho bych si
  vy -- vo -- li -- la
  za mu -- ža.
  \set stanza = #"2. "
  a nič bych mu ro -- bit ne -- da -- la,
  je -- nom a -- ko rü -- žu
  %bych ho
  cho -- va -- la.
}}
lyrStropheCbass = {
  \lyricmode {
  \set stanza = #"3. "
  A -- ko rů -- žu, %a -- ko rů -- žu
  čer -- ve -- nú,
  %já bych bo -- la
  je -- ho že -- nu
  mi -- le -- nu.
  \set stanza = #"3. "
  A -- ko rů -- žu, %a -- ko rů -- žu
  čer -- ve -- nú,
  %já bych bo -- la
  je -- ho že -- nu
  mi -- le -- nu.
  \set stanza = #"3. "
  já bych bo -- la že -- nu la -- li -- ja,
  a on mo -- ja rů -- ža,
  % rů -- ža
  čer -- ve -- ná.
}}

strophe = \relative c'' {
  \voiceOne
  \time 2/2
  \key c \major
  \repeat unfold 2 {
  g8 f e f g f e f
  g4 a g2
  c8 b a g a g f e
  f4 e d2
  } \break

  \repeat volta 2 {
  d'4 d d d
  d8 c b a g2
  g8 a b c c4 e
  g8 f e d c2
  }
  %\bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  \repeat unfold 2 {
  e8 d c d e d c d
  e4 f e2
  e8 g f e f e d c
  d4 c b2
  }
  b4 d d c b d g2
  g8 f d f e4 c e8 d c b c2
}

stropheBass = \relative c {
  \clef "bass"

  c4 g c g c c c2
  c4 g c e b c g2
  c4 g c g c c c2
  c4 e d c d c g2

  g4 b d c
  b8 a b d g,2
  g8 g b g c4 e
  g g, c2
}

chrdStrophe =  \chordmode {
  \repeat unfold 2 {
    c1 c4 f c2
    c2 d:m g4:7 c g2
  }
  g2 d g4 d g2
  g2:7 c g c
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \header {
    subtitle = "Kirschelein"
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe"    \lyrStropheA
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheAalt
    \new Lyrics \lyricsto "Strophe"    \lyrStropheB
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheBalt
    \new Lyrics \lyricsto "Strophe"    \lyrStropheC
    \new Lyrics \lyricsto "StropheAlt" \lyrStropheCalt

    %\new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Staff <<
      \new Voice = "StropheBass" { \stropheBass }
      >>
    \new Lyrics \lyricsto "StropheBass" \lyrStropheAbass
    \new Lyrics \lyricsto "StropheBass" \lyrStropheBbass
    \new Lyrics \lyricsto "StropheBass" \lyrStropheCbass

    >>
  }
}
