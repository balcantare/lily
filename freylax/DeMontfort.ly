\version "2.24.2"
sheetName = "De Montfort"
sheetComposer = "Jo Freya"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 2/4
  \key a \minor
  \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
  a8 e'~ e a,
  f'4 a,8 e'~
  e a, c e
  d c b c
  a8 e'~ e a,
  f'4 a,8 e'~
  e a, c e 
  d2
  } \break
  \mark \markup{ \box{\fontsize #4 B}}
  b8. c16 d8 b~
  b d c b 
  c8. b16 a8 c~
  c a b c
  b8. c16 d8 b~
  b d c b 
  c4 d 
  e16 f e d c8 a
  b8. c16 d8 b~
  b d c b 
  c8. b16 a8 c~
  c a b c
  b8. c16 d8 b~
  b d c b 
  c4 b
  a2
  \bar "|."
}

rythm = \relative c'' {
  \improvisationOn
  \omit Stem
  \omit Staff.Clef
  \omit Staff.BarLine
  \omit Staff.TimeSignature
  b4 s b s b s b b
  b4 s b s b s b b
  b s b b b s b b
  b4 s b b b b b s
  b s b b b s b b
  b4 s b b b b b s
}

chrdStrophe = \chordmode {
  a2:m s s g
  a:m s s g
  g s a:m s
  g s f4 g a2:m
  g s f s
  g s f4 g a2:m
}



\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \header {
    subtitle = "Bourée à deux |AAB|"
  }
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff \with {
      \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 4)
         (padding . -8)) 
    }<<
      \override Staff.StaffSymbol.line-count = #0
      \new Voice = "Rythm" { \rythm }
    >>
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }

}
\layout {
  \context {
    \omit SystemStartBar
  } 
 }