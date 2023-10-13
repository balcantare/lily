\version "2.24.0"
sheetName = "Nuestra Navidad - 4 - Los Pastores"
sheetComposer = "Ariel Ramierez"
#(define book-staff-size 23)

\include "../include/book.ily"


lyrStropheA = {
  \lyricmode {
    ah __ _ _ _ _ _ _ Ah ah
  \set stanza = "1. "
  Ven -- gan pas -- to -- res del cam -- po
  qu‿el Rey de los
  \set stanza = "1. "
  Re -- yes
  ha na -- ci -- do ya
  Ven -- gan an -- tes que‿a -- ma --
  \set stanza = "1. "
  nes -- ca
  que ya‿a -- pun -- ta‿el
  di -- a‿y la no -- che se va.
  Al -- baha -- ca‿y ce -- dron, to -- mi -- llo‿y
  lau -- rel,
  que‿el Ni -- ño se duer -- me al a -- ma -- ne --
  %Coda
  cer. Al -- baha -- ca‿y ce -- dron, to -- mi -- llo‿y
  lau -- rel,
  que‿el Ni -- ño se duer -- me al a -- ma -- ne -- cer.
}}
skipA=\repeat unfold 9 { \skip 8 }
lyrStropheB = {
  \lyricmode {
    \skipA
  \set stanza = "2. "
  Lle -- guen de Pin -- cha y Chu -- quis
  de‿a -- min -- ga‿y San
  \set stanza = "2. "
  Pe -- dro,
  de‿a -- rau -- coy Po -- mán,
  An -- tes que na -- die le‿a --
  \set stanza = "2. "
  do -- re
  que -- si -- llos y flo -- res
  le va -- mu‿a lle -- var.
}}
lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = "3. "
    Pi -- dan -- le‿a Jul -- io Ro -- me -- ro ca -- ba -- llos de
   \set stanza = "3. "
   pa -- so‿y su mu -- la de‿an -- dar
   con ca -- jas y con gui --
   \set stanza = "3. "
   tar -- ras i -- re -- mos can -- tan -- do por el o -- li -- var.
   }}
lyrStropheD = {
  \lyricmode {
    \skipA
    \set stanza = "4. "
    Ay Na -- vi -- dad de‿Ai -- mo -- gas -- ta!
   A -- lo -- ja‿y añ --
   \set stanza = "4. "
   a -- pa
   no‿ha -- bra de fal -- tar.
   mien -- tras la lu -- na rio --
   \set stanza = "4. " ja -- na
   se mue -- re de gan -- as de par -- ti -- ci -- par.
}}

accomp = \relative c' {
  \key e \major
  r8 e16 b' e b d8 a d
  c c,16 a' c a b8 fs b
  a8 a,16 e' a e g8 d g
  f8 c f e b ds
  e8 r r r4 ds8
  e8 r r r4 ds8
}

strophe = \relative c'' {
  \accidentalStyle modern %neo-modern % -voice-cautionary
  \time 6/8
  \key e \major
  \bar ".|:"
  %\compressFullBarRests
  \repeat volta 2 {
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 3/8)
  e4. d c b a g f r8 e( ds)
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  e4. r4. r2.
  \break
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  gs8 a b e ds cs
  b gs e' ds cs e
  b gs b a fs a
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  gs4 r8 r4. r2.
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  g8 a b a b c
  b d, d' c d, c'
  b d, b' a d, a'
  gs4 \break b8 e8. fs16 e8
  d4 a8 c8. d16 c8
  b4 g8 a8. b16 a8
  gs8. e16 gs8 fs8. d16 fs8 } \break
  e4 b'8 e8. fs16 e8
  d4 a8c8. d16 c8
  b4-\fermata g8 a8. b16 a8
  gs8. e16 gs8 fs8. d16 fs8
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  e4 r8 r4.
  \bar "|."
}

chrdStrophe = \chordmode {
  e4.:/gs d:/fs
  c:/e b:m/d
  a:m/c g:/b
  f:/a e8.:m/g b8.
  e2 s8 b:7
  e2 s8 b:7
  e4. a e a  e b:7 e2 b4:7 e2 b4:7
  e4.:m d g d:7 g b:7
  e e:m d c:/e
  b:/ds a:/cs e/b d
  e e:m d c:/e b:/ds a:/cs e:/b d e
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
    \new Staff\with {
      fontSize = #-3
      \override StaffSymbol.staff-space = #(magstep -3)
     }  <<
      \new Voice = "Accomp" { \accomp }
      >>
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC
    \new Lyrics \lyricsto "Strophe" \lyrStropheD
    >>
    %\layout {
    %\layout {
    %  \override Score.SpacingSpanner.packed-spacing = ##f
    %}

    %\context {
    %  \Score
    %  \override SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
    %}
  %}
  }
}
