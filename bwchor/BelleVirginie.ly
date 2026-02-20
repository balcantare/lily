\version "2.24.4"
sheetName = "Belle Virginie"
sheetComposer = "Satz: La Bottine Souriante"
\include "../include/book.ily"


lyrStropheA = {
  \lyricmode {
  \set stanza = " 1."
  Belle Vir -- gi -- nie
  les larmes aux yeux
  Je viens \set stanza = " 1." te faire mes a -- dieux
  Et là‿je re -- pars pour l'A -- mé -- rique
  \set stanza = " 1." Et je m'en vas sui -- vant le vent
  Et a -- dieu donc \set stanza = " 1." belle Vir -- gi -- nie
  Les voiles sont dé -- jà mises au vent
}}
lyrStropheB = {
  \lyricmode {
  \set stanza = " 2." 
  Les voiles au vent, mon cher a -- mant
  Ce -- la \set stanza = " 2." me cause du tour -- ment
  Il sur -- vien -- dra quel -- que tem -- pête
  \set stanza = " 2." Et des o -- rages as -- su -- ré -- ment
  Qui fera pé -- rir \set stanza = " 2." 
  ton bâ -- ti -- ment
   Et moi je re -- sterai sans a -- mant  
}}
lyrStropheC = {
  \lyricmode {
  \set stanza = " 3." Belle Vir -- gi -- nie, ne crains donc rien
  Je suis \set stanza = " 3." un pre -- mier ma -- rin
  Et je con -- nais tou -- te la terre
  \set stanza = " 3." Et je suis sûr de mon vais -- seau
  Il m'ar -- ri -- vera \set stanza = " 3." au -- cun nau -- frage
  Du -- rant que j'se -- rai sur les eaux
  }}
lyrStropheD = {
  \lyricmode {
  \set stanza = " 4." Belle Vir -- gi -- nie, jus -- qu'au re -- tour
  Sois fi -- \set stanza = " 4." dèle à nos a -- mours
  Je te pro -- mets, ô ma mig -- nonne
  \set stanza = " 4." De re -- ve -- nir _ en ce pays
  Là nous nous ma -- \set stanza = " 4. " rierons en -- sem -- ble
  Et a -- dieu donc belle Vir -- gi -- nie  
}}

strophe = \relative c' {
  \key e \major
  \time 2/4
  \voiceOne
  \override Rest.staff-position = #0
  r8 b8 e gs
  e'4( b)
  r8 e cs b
  \time 3/4
  gs2  a8 b
  \time 2/4
  cs8 b a fs
  gs2-\fermata %\break
  r8 e' e e
  \time 3/4
  b4 r8 e e e
  cs4 \break r8 b a gs
  e' e e e e( fs16 e 
  \time 2/4 ds2)
  r8 ds8 ds ds
  \time 3/4
  b4 \break r8 ds8 ds e
  cs4 r8 b a gs 
  \time 2/4
  cs b a fs
  gs2-\fermata
  
}

stropheAlt = \relative c' {
  \voiceTwo
  s8 b e gs 
  b4( gs)
  s8 b a fs
  e2 fs8 gs
  a fs ds b 
  e2
  s8 b'8 b b
  gs4 s8 b8 b cs
  a4 s8 gs8 fs e
  cs' fs, a cs 
  cs( ds16 cs b2)
  s8 b8 b b 
  gs4 s8 b8 b cs
  a4 s8 gs fs e
  a fs ds b
  e2
}

stropheBass = \relative c' {
    s2*3 s2. s2*2
  \clef "bass"
  \key e \major
  r8 gs gs gs
  e4 r8 e e e
  e4 r8 e e e
  e e e e e4(
  fs2)
  r8 gs gs gs
  e4 r8 fs e ds 
  cs4 r8 b b b 
  b b b b
  b2
  \bar "|."
}

chrdStrophe =  \chordmode {
  s2 e2 s4 a e2. a4 b e2
  s2 e2. a s b2 gs:m e2.
  a b2 e2
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 20)
      \context {
        \Staff \RemoveAllEmptyStaves
      }
    }
    <<
    \new ChordNames { \transpose e d \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \transpose e d \strophe }
      \new Voice = "StropheAlt" { \transpose e d \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    \new Staff <<
      \new Voice = "StropheBass" { \transpose e d \stropheBass }
      >>
    >>
  }
}
