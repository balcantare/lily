\version "2.24.0"
sheetName = "Nuestra Navidad - 1 - La Annuciacion"
sheetComposer = "Ariel Ramierez"
#(define book-staff-size 22)
\include "../include/book.ily"

leftbrace = \markup {
  \override #'(font-encoding . fetaBraces)
  \lookup "brace75"
}
stanzaA = \markup {
  \column { \vspace #.4 "1. "}
  \column { \vspace #.2 \leftbrace }
}
stanzaB = \markup {
  \column { \vspace #.4 "2. "}
  \column { \vspace #.2 \leftbrace }
}

skipA=\repeat unfold 36 { \skip 8 }

lyrStropheA = {
  \lyricmode {
    \skipA
  \set stanza = \stanzaA
  Ji -- ne -- te de‿un ra -- yo ro __ jo
  \set stanza = \stanzaA
  Vie -- ne vo -- lan do‿el An -- gel Ga -- briel
  Con sa -- ble pun -- ta de‿es --
  \set stanza = \stanzaA
  tre -- lla
  Que vue -- le
  "\"Pla" -- te ca -- ba -- ca -- "te\"."
  Soy la‿es -- cla -- va del Se -- ñor
  lle -- van -- do su cor -- a -- cón.
  Ca -- pu -- llo que se‿ha -- ce flor
  Y se‿a -- bri -- rá en Na -- vi -- dad.
}}
lyrStropheB = {
  \lyricmode {
    \skipA
  Que Dios te sal -- ve Ma -- ri __ a
  La mas bo -- ni -- ta cu -- ña -- ta -- i.
  La flor es -- ta flo -- re -- cien -- do.
  Cre -- ce_en la san -- gre
  tu "\"cu" -- clu -- "mi\"."
  }
}
lyrStropheC = {
  \lyricmode {
    \skipA
  \set stanza = \stanzaB
  El An -- gel Ga -- briel ya vuel __ ve
  \set stanza = \stanzaB
  \skip 8
  pa -- go don -- de se‿en cuen -- tra Dios.
  Ma -- mó par -- e -- hó‿An -- ge --
  \set stanza = \stanzaB
  li -- to
  Que tan con -- ten -- to te vuel -- ves vos.
}}
lyrStropheD = {
  \lyricmode {
    \skipA
  He vis -- to‿a la rei -- na‿el mun __ do.
  Le mas her -- mo -- sa "\"cu" -- ña -- ta -- "i\"."
  Los o -- jos son dos es -- trell -- as,
  su voz
  el can -- to de‿un ye --  ru -- ti.
}}

strophe = \relative c'' {
  \accidentalStyle neo-modern-voice-cautionary
  \time 6/8
  \key d \major
  \partial 4
  d8[ cs]
  <e c>4 <d b>8 <d b>4 <c a>8 |
  <b g>4.~ <b g>4 r8 |
  <c' e,>8 8 <bf g> <c e,>4 <bf g>8 |
  <a f>4. <a f>8 r a |
  <a g cs,>16 16 8 8~ 8 16 16 8
  <a fs d>16 16 8 8~ 8 16 16 8
  <a cs,>16 16 8 <g b,> <fs a,>4 <e g,>8
  <d fs,>2.~ 4. r8 \break
  \repeat volta 2 {
  r8 a8
  g b a a fs g~ |
  g e'4~ e \break e8 |
  e d cs b16 a g8 fs |
  d'4.~ d8 r a, |
  d d d b'4 b8 |
  a a a, g'4 g8 |
  fs fs fs e4 e8 |
  d4.~ d8 }
  \break
  d'\( cs\)
  %\bar "||"
  e8 d4 d c8 |
  b4.~ b8 r g |
  d'd d c4 bf8 |
  a4.~ a8 r \break a, |
  a' a a g4 g8 |
  fs4 a,8 g'4 fs8 |
  e4 a,8 fs'4 e8 |
  d4.~ d8
  \bar "|."
}

chrdStrophe = \chordmode {
  s4
  d2.:7 g c:7 f a:7 d a:7 d s
  d a:7 s d s a:7 s d
  d:7 g c:7 f a:7 d a:7 d2
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
  \layout {
    (layout-set-staff-size-with-jazz 22)
  }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
  }
}
