\version "2.24.2"
sheetName = "Sangshyttevalsen"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 3/4
  \key a \minor
  \partial 4
  \bar "|:"
  \repeat volta 2 {
    \mark \markup{ \box{\fontsize #4 A}}
    e8 f
    e4 e8 a, e' f
    d2 d,8 g
    b2 a8 g
    e2 \break e'8 f
    e4 e8 a, e' f
    d2 d8 c
    b c d e c b
    a2
  }
  \break
  \repeat volta 2 {
    \mark \markup{ \box{\fontsize #4 B}}
    a8 b
    c8 e, e c' e, c'
    b d, d b' d, b'
    a g f a g f
    e4 d \break c8 d
    c'8 e, e c' e, c'
    b d, d b' d, b'
    a g a c b g
    a2
  }
  \bar "|."
}

chrdStrophe = \chordmode {
    s4 a2.:m d:m g e:m a:m d:m g2 e4:m a2.:m
    a:m g f e:m a:m g f2 g4 a2:m
}

\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \header { subtitle = "Walzer, Groupa |AABB|" }
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
    }
  }
}
