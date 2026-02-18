\version "2.22.2"
fileName = "Ederlezi.ly"
sheetName = "Ederlezi"
\include "../include/book.ily"

lyrStropheA = {
  \lyricmode {
  Sa me a -- ma -- la __
  o -- ro khe -- le -- na __
  o -- ro khe -- le -- na __
  di -- ve ke -- re na.
  A __ _ _ _ _ _ da -- je
  Sa o ro -- ma ba -- bo ba -- bo
  sa o ro -- ma o da -- je.
  Sa o ro -- ma ba -- bo ba -- bo
  E __ E -- der -- le -- zi
  E -- der -- le -- zi
  Sa o ro -- ma da -- je.
}}

strophe = \relative c'' {
  %\voiceOne
  \accidentalStyle modern %-voice-cautionary
  \time 2/4
  \key d \minor
  \bar ".|:"
  \repeat volta 2 {
    \slurUp
    r4 a8 bf |
    c( bf) a( g)
    a2( |
    g8 f16 g f4) |
    r4 g8 g |
    g4 g8( e) |
    f4.( g8 |
    e8 d16 e d4) |
    r4 g8 g |
    g4 g8( e) |
    f4.( g8 |
    e8 d16 e d4) |
    r4 f8( e) |
    g8 e4 d8 |
    d2
    r2
  } \break
    a'2 c b
    c8( b) c( b)
    \tieUp
    a2~ 4 g8( a)
    a2 r2 \break
    f8 f a a
    g f e d
    f f e f
    a a g4 \break
    f8 f a a
    g f e d
    d'2~ 4 c8 bf
    a4 g \break
    r c8 bf
    a4 g
    r f8 e
    g8 e4 d8
    d2
  \bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
  s4 f8 g
  a( g) f( e)
  f2(
  e4 d)
  s4 d8 d
  d4 bf
  d2
  bf4 a
  s4 bf8 bf
  bf4 c
  d2~ d
  s4 bf
  a8 a4 a8
  a2
  s2
  f'2 a g
  a8( g) a( g)
  f2~ 4 e8( f)
  f2 s2
  d8 d f f
  e d d d
  d d cs d
  f f e4
  d8 d f f
  e d d d
  bf'2~ 4 a8 g
  g4 g
  s4 a8 g
  g4 g
  s4 f8 e
  c8 c4 d8
  d2
}

chrdStrophe = \chordmode {
  d2:m s s s
  g:m s d:m s
  g:m s d:m s
  bf a:m d:m s
  d2:m s g s
  d:m s s s
  d:m g:m d:m g:m
  d:m g:m bf s s
  g:m s d:m a:m d:m
 }

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.35))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    >>
  }
}
