\version "2.22.2"
sheetName = "Fröhlicher Kreis"
\include "../include/book.ily"

strophe = \relative c'' {
  %\voiceOne
  \partial 4
  \time 6/8
  \key g \major
   \mark \markup{ \box{\fontsize #4 A}}
   \repeat volta 2 {
     d8 c
     b g g d g g
     b g b d c b
     c a a e a a
     c a c e d c
     b g g d g g
     b g b d c b
     c b c a d c
     b g g g
     } \break
   \mark \markup{ \box{\fontsize #4 B}}
   \repeat volta 2 {
     g' a
     b g g d g g
     b g b b a g
     a fs fs d fs fs
     a fs a a g fs
     e g g d g g
     c, g' g b, g' g
     c, b c a d c
     b g g g
     } \break
    %\bar "|."
}

chrdStrophe = \chordmode {
  s4
  g2. s
  a:m d g s a4.:m d
  g2.
  g s d s
  c4. g a:m g a:m d g
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    #(define fonts (book-font 1.5))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
