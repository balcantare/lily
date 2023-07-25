\version "2.22.2"
sheetName = "Dubbele"
\include "book.ily"

strophe = \relative c'' {
  \time 2/4
  \key c \major
  %\partial 4.
  %\mark \markup{ \box{\fontsize #4 A}}
  %    \bar "|."
  %\repeat volta 2 {
     c8 b c d
     e4 e8  e
     e d c b  a2
     f'8 e  d c
     b a b c
     d e f d
  %} \alternative {
    e4 c
     c8 b c d
     e4 e8  e
     e d c b  a2
     f'8 e  d c
     b a b c
     d e f d
     c2
     \bar "||"
    c4 b
    a4 a8 a
    a g a b
    a4. a8
    a g  a b
    c4. f8
    e8 d c e
    d2
    c4 b
    a4 a8 a
    a g a b
    a4. a8
    a g  a b
    c4. g'8
    f8 e d b
    c2
    \bar "|."
}

chrdStrophe = \chordmode {
  s2
  c2 e:m f s g s c s
  c e:m f s g s c
  c4 g a2:m s f s
  c s g
  c4 g a2:m s f s
  c g c
}

\bookpart {
  \paper {
    page-count = #1
  }
  \bookItem
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}


%{
Rl \part{A}\ \c C \ [ c85 b ] [ c d ] | e4 [ e8  e ] |
\c Em \ [ e d ] [ c b ] | \c F \ a2 /

[ f8+ e ] [ d c ] | \c G \ [f b a ] [ b c ] |
[ d e ] [ f d ] /
V1 \c -1C \ e4 c Rr /
V2b \c -1C \ c2 Rd /

L3
Vx Rl
\part{B}\
\c C \ c4 \c G \ b |
\c 1Am \ a4 a8 a |
[ a g ] [ a b ] |
\c 1F \ a4d a8 /
L4
[ a g ] [ a b ] /
V1  \c C \ c4d f8 | [ e8 d ] [ c e ] | \c G \ d2 Rr /
V2b \c C \ c4d g8+ | \c G \ [ f8 e ] [ d b ] | \c C \ c2 Rd /
%}