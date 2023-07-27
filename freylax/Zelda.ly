\version "2.22.2"
sheetComposer = "Phillippe Plard"
sheetName = "Zelda"
\include "book.ily"

strophe = \relative c'' {
  \time 6/8
  \key c \major
  %\bar ".|:"
  %\partial 4.
  e4 a,8 e'4 a,8
  \time 3/8
  f'8 e d
  \time 6/8 e4.
  e8 d c b4 b8
  b8 c d
  \time 3/8 c4 a8  \break
  \time 6/8
  e'4 a,8 e'4 a,8
  \time 3/8
  f'8 e d
  \time 6/8 e4.
  e8 d c
  b4 b8
  b8 c b a4.
  \bar "||" \break
  a8 b c e,4 e8
  a8 b c f,4 f8
  a8 b c b4 b8
  d8 c b c4 a8 \bar "" \break
  a8 b c e,4 e8
  a8 b c f,4 f8
  a8 b c b4 b8
  d8 c b a4.
  \bar "|."
}

