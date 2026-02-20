\version "2.24.2"
sheetName = "Csárdás (Reinhard)"
\include "../include/book.ily"

strophe = \relative c'' {
  %\voiceOne
  \time 4/4
  \key d \minor
   \partial 4.
   \mark \markup{ \box{\fontsize #4 A}}
   c8 d e |
   \repeat volta 2 {
   f4 f c f |
   a a~ 8 fs g a |
   bf4 a g g8 e |
   f a g f e f g e |
   f4 f c f |
   a a~ 8 fs g a |
   bf4 a g g8 e |
   f a g e f2
   } \break
   \mark \markup{ \box{\fontsize #4 B}}
   \repeat volta 2 {
   a4 a gs4. f8 |
   e f gs f e4. d8 |
   f4 f e8 d cs e |
   d a b cs d e f gs |
   a4 a gs4. f8 |
   e f gs f e4. d8 |
   f4 f e8 d cs e |
   }
   \alternative{
     {d2~ d8 e f gs}
     {d1}
   } \break
   \mark \markup{ \box{\fontsize #4 C}}
  \time 2/4
  \key d \minor
   \repeat volta 2 {
   a8 b16 cs d8 e |
   f f e d |
   f f e d |
   f16 e f g f e d8 |
   a8 b16 cs d8 e |
   f f e d |
   f e16 d cs16 d e8 |
   }
    \alternative{
      {d2}
      {d4. c8}
    } \break
   \mark \markup{ \box{\fontsize #4 D}}
   \repeat volta 2 {
     a'4 g |
     f4. g8 |
     a8. g16 a8. b16 |
     c4. bf8 |
     a4 g |
     f4 \tuplet 3/2 { e8( f g) }
     f4 e |
   }
   \alternative{
     { d4. c8 }
     { d2 }
   } \break
   \mark \markup{ \box{\fontsize #4 E}}
   \repeat volta 2 {
     bf'16 a g8 g f16 g |
     a16 g f8 f8. f16 |
     e8 d e fs |
     g4 g |
     bf16 a g8 g f16 g |
     a16 g f8 f8. f16 |
     e8 d e f |
      d4 \mark \markup{ \box{\fontsize #2 Fine}} d
   } \break
   \mark \markup{ \box{\fontsize #4 F}}
   \repeat volta 2 {
   cs4 cs |
   cs bf8 a |
   d4 d |
   d8. f16 e8. d16 |
   cs4 cs |
   cs bf8. a16 |
   d2~ }
   \alternative {
     {d8. f16 e8. d16 }
     {d2}
   } \break
   \mark \markup{ \box{\fontsize #4 G}}
   \repeat volta 2 {
     a8 d4 e8 |
     f4 a |
     gs8. f16 e8. d16 |
     a'4 a |
     a,8 d4 e8 |
     f4 a |
     gs8. f16 e8. f16 |
     d4 d |
   }
   \mark \markup{ \box{\fontsize #4 C..E}}
   s2
    \bar "|."
}

chrdStrophe = \chordmode {
  s4.
  f1
  s
  c
  f2 c
  f1
  s
  c
  f

  d1:m
  s
  s2 a2
  d1:m
  d:m
  s
  s2 a:
  d1:m
  d:m

  d4:m
  \set chordBassOnly = ##t
  d:m/a
  d:m/d
  d:m/f
  \set chordBassOnly = ##f

  \mark \markup{ \fontsize #4 ...}
  \repeat unfold 4{s2}
  s4 a
  d2:m
  d2:m

  f2
  \repeat unfold 4{s2}
  d:m
  s4 a
  d2:m
  d2:m

  g:m
  \set chordBassOnly = ##t
  d4:m s %d:m/a
  s % d:m/d
  \set chordBassOnly = ##f
  d:/fs
  g:m
   \set chordBassOnly = ##t
  s %g:m/bf
  s2 % g2:m
  d:m
  s4 a
  d2:m

  a2  s
  d:m s
  a s
  d:m
  s s

  d:m s s s s s s4 a d2:m
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    \layout {#(layout-set-staff-size-with-jazz 24)}
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
