\version "2.22.2"
sheetComposer = "Phillippe Plard"
sheetName = "Zelda"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 6/8
  \key c \major
  \bar ".|:"
  \partial 4.
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
  e4 a,8 
  e'4 a,8 f'8 e d
  e4.
  e8 d c b4 b8
  b8 c d
  c4 a8 
  \break
  e'4 a,8 e'4 a,8
  f'8 e d
  e4.
  e8 d c
  b4 b8
  b8 c b a4. }
 % \bar "||" 
 \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
  a8 b c e,4 e8
  a8 b c f,4 f8
  a8 b c b4 b8
  d8 c b c4 a8 \bar "" \break
  a8 b c e,4 e8
  a8 b c f,4 f8
  a8 b c b4 b8
  d8 c b a4. }
  %\bar "|."
}

chrdStrophe = \chordmode {
  a4.:m s
  f c s
  g s a:m
  a:m s f c s g s a:m
  s a:m s f s g s a:m
  s a:m s f s g s a:m
}
\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \header{
    subtitle = "Cercle circassien |AABB|"
  }
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
  