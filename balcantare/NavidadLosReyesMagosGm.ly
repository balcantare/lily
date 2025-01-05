\version "2.24.0"
sheetName = "Nuestra Navidad  - 5 - Los Reyes Magos (Gm)"
sheetComposer = "Ariel Ramierez"
#(define book-staff-size 20)
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
    \repeat unfold 20 { \skip 8 }
    Lle -- ga -- ron ya los re -- yes y'e -- ran -- tres
   Mel -- chor, Gas -- par, y'el ne -- gro Bal -- ta -- zar.
   A -- rro -- pe‿y miel le lle -- va -- rán
   y'un pon -- cho blan -- co de‿al -- pa -- ca re -- al.
   Chan -- gos y chi -- ni -- tas duer -- man sé
   Que ya Mel -- chor, Gas -- par y Bal -- ta -- zar,
   To -- dos los re -- ga -- los de -- ja -- rán pa -- ra ju -- gar
   ma -- ña -- na‿al des -- per -- tar.
   El Ni -- ño Dio muy bien lo‿a -- gra -- de -- ció
   co -- mió la miel y'el pon -- cho lo‿a -- bri -- gó.
   y fué des -- pués que los mi -- ró
   y‿a me -- dia no -- che el sol re -- lum -- bró.
 }}


strophe = \relative c'' {
  \accidentalStyle modern %neo-modern % -voice-cautionary
  \time 2/4
  \key a \minor
  \bar ".|:"
  \partial 4
  \repeat volta 2 {
    r4
    a8 b c d
    e2
    a,8 b c a
    e2
    e8 fs gs a
    b2
    e,8 fs gs b
    a4
  } \break
  \voiceOne
  \override Rest.staff-position = #0
  \repeat volta 2 {
     
    r16^\markup{ \box{\fontsize #2 A}} e e' d
    c8. d16 e d c b
    a4 r16^\markup{ \box{\fontsize #2 B}} d, d' c
    b8. c16 d c b a
    g4 \break
    r16^\markup{ \box{\fontsize #2 A}} e c' b
    c4~ c16 %e, a g f4~ f16
    a16^\markup{ \box{\fontsize #2 B}} d cs d4~ d16
    d^\markup{ \box{\fontsize #2 A+B}} f d
    e8 c16 e d8 c16 b
    c4
  }
  r4 \break
  d16 c^\markup{ \box{\fontsize #2 B}} b c d c b c
  d4 r16 c b c
  d8. c16 b g g' f
  e4. r8
  b16 a^\markup{ \box{\fontsize #2 A}} gs a b a gs a
  b4~ b16 a gs a
  b8. a16 gs e e' d
  c4 \break
  r16^\markup{ \box{\fontsize #2 B}} e, e' d
  c8. d16 e d c b
  a4 r16^\markup{ \box{\fontsize #2 A}} d, d' c
  b8. c16 d c b a
  g4 \break r16^\markup{ \box{\fontsize #2 B}} e c' b
  c4~ c16 a^\markup{ \box{\fontsize #2 A}} a' g
  f4~ f16 d^\markup{ \box{\fontsize #2 A+B}} f d
  e8 c16 e d8 c16 b
  a4 r4-\fermata
  \bar "|."
}

alt = \relative c' {
  \voiceTwo
   s4 s2*7 s4
   s16 e c' b a8. b16 c b a g f4
   s16 d b' a g8. a16 b a g f e4
   s16 e a g a4~ a16 e a g 
   f4~ f16 b d b
   c8 a16 c b8 a16 gs a4 s4
   b16 a g a b a g a
   b4 s16 a g a
   b8. a16 g g c b c4. s8
   gs16 fs e fs gs fs e fs 
   gs4~ gs16 fs e fs 
   gs8. fs16 e e c' b 
   a4 s16 e c' b a8. b16 c b a g f4
   s16 d b' a g8. a16 b a g f e4
   s16 e a g a4~ a16 a d cs 
   d4~ d16 b d b 
   c8 a16 c b8 a16 gs a4
}

chrdStrophe = \chordmode {
  s4
  a2:m s s
  e:7 s s s a4:m
  s
  a2:m d:m7 g:7 c4:7+ s
  a4.:m a8
  d2:m7
  a4:m7 e:7 a:m s
  g2:7 s s
  c e:7 s s a4:m s
  a2:m d:m7 g:7
  c:7+ a4.:m a8
  d2:m7 a4:m7 e:7
  a2:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \transpose c bf, \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe"  { \transpose c bf, \strophe }
      \new Voice = "Alt" { \transpose c bf, \alt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    >>
  }
}
