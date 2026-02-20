\version "2.24.2"
sheetComposer = "Wouter Kuyper"
sheetName = "Ron Dodo"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 6/8
  \key a \minor
  \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
    a4 e8 a8 b c
    b4 g8 b8 c d
    e d c b4 e8~
    e d c b c b
    a4 e8 a b c
    b4 g8 b8 c d
    e d c b c d
    b2.
  }
  \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
    e4 e8~ e4 d8
    b c d b4.
    a4 a8~ a b c
    b4 a8 gs4 e8
    e'4 e8~ e d c
    b c d b4.
    a8 b c b4 c8
  } 
  \alternative {
    {a4. b8 c d}
    {a2.}
  }
  \bar "|."
}

chrdStrophe = \chordmode {
  a2.:m g c4. g4 e8 
  s2. 
  a2.:m g c4. g e2.:m
  c2. g f e c g f4. g a:m g a:m
}
rythm = \relative c'' {
  \improvisationOn
  \omit Stem
  \omit Staff.Clef
  \omit Staff.BarLine
  \omit Staff.TimeSignature
  b4 s8 b4 s8 
  b4 s8 b4 s8 
  b4 s8 b4 b4 s4 b4 s8 
b4 s8 b4 s8 
  b4 s8 b4 s8 
  b4 s8 b4 s8 
  b4 s8 b4 s8
  b4 b4 s4 
  b4 s8 b4 s8
  b4 b4 s4 
  b4 s8 b4 s8
  b4 b4 s4 
  b4 s8 b4 s8
 b4 s8 b4 s8 
  b4 s8 b4 s8 
  b4 s8 b4 s8
  }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
  }
  \bookItem
  \header{
    subtitle = "Rondeau en couple |AABB|"
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
    \layout {
      #(layout-set-staff-size-with-jazz 24)
    }
  }
}
  
