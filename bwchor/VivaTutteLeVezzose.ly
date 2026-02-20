\version "2.24.0"
sheetName = "Viva tutte le vezzose"
sheetComposer = "Felice Giardine (1716-1796)"
\include "../include/book.ily"

lyrA = {
  \lyricmode {
    Vi -- va tut -- te le vez -- zo -- se,
    vi -- va tut -- te le vez -- zo -- se,
    vi -- va tut -- te le vez -- zo -- se,
    don -- ne‿a -- ma -- bi -- li
    gra -- zi -- o -- se, 
    che non han -- no cru -- del -- tà,
    che non han -- no cru -- del -- tà!
    Vi -- va sem __ -- pre,
    la ma -- gior fe -- li -- ci -- tà.
    Le vez -- zo -- se,
    le vez -- zo -- se,
    vi -- va tut -- te le vez -- zo -- se,
    don -- ne‿a -- ma -- bi -- li
    gra -- zi -- o -- se, 
    che non han -- no cru -- del -- tà,
    che non han -- no cru -- del -- tà!
}}

lyrB = {
  \lyricmode {
    \repeat unfold 39 \skip 8
    Vi -- va sem -- pre,
    vi -- va,  vi -- va, che da
    lo -- ro sol -- de ri -- va,
}}

lyrC = {
  \lyricmode {
    2*20
    Vi8 -- va,8 vi8 -- va!8 
    2
    Vi8 -- va,8 vi8 -- va!8
}}

sopran = \relative c' {
  \voiceOne
  \time 2/4
  \key f \major
  \override Rest.staff-position = #0
  \bar ".|:"
  \partial 4
  \repeat volta 2 {
    f8 g
    a f bf a
    g f a bf 
    c a d c
    bf a c c
    c c d c
    c bf 
    \break bf bf
    bf c16 d c8 bf
    bf a c c 
    d d c e, 
    f4 c'8 c
    d d c e,
    f4
  }
  \break
  \repeat volta 2 {
    c'8 c 
    c2~ 2~ 2~ 2
    4 d8 d
    c a bf g
    a4 \break c8 d
    bf8 g r4
    r4 c8 d
    bf g r4 
    r4 c8 c
    c c d c
    c bf \break bf bf
    bf c16 d c8 bf
    bf a c c
    d d c e,
    f4 c'8 c
    d d c e,
    f4
  }
  %\bar "|."
}

alt = \relative c' {
  \voiceTwo
  \override Rest.staff-position = #-7
  r4
  r2 
  r4 f8 g
  a f bf a
  g f a a
  a a bf a
  a g g g 
  g a16 bf a8 g
  g8 f a a
  bf bf a g
  a4 a8 a 
  bf bf a g 
  a4
  \override Rest.staff-position = #-4
  r4
  r4 a8 bf
  c a bf g
  a a a bf
  c a bf g
  a a bf bf
  a f g e
  f4 a8 bf
  g8 e s4
  s4 a8 bf
  g e s4
  s4 a8 a
  a a bf a
  a g g g
  g a16 bf  a8 g
  g f a a
  bf bf a g
  a4 a8 a
  bf bf a g 
  f4
}

bass = \relative c {
  \key f \major
  \clef "bass"
  r4
  r2 r r
  r4 f8 f 
  f f f f
  c' c, c c
  c c16 c c8 c
  f f f f
  bf, bf c c
  f4 f8 f
  bf bf c c,
  f4
  r4
  r4 f8 g
  a f g e
  f f f g
  a f g e
  f f bf bf
  c c c, c
  f4 r
  r c16( d) e( c)
  f8 f r4
  r4 c16( d) e( c)
  f8 f f f
  f f f f
  c' c, c c 
  c c16 c c8 c
  f f f f 
  bf, bf c c 
  f4 f8 f
  bf bf c c,
  f4
}

chrdStrophe = \chordmode {
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    \layout {#(layout-set-staff-size-with-jazz 20)}
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Sopran" { \sopran }
      \new Voice = "Alt" { \alt }
      >>
    \new Lyrics \lyricsto "Sopran" \lyrA
    \new Lyrics \lyricsto "Alt" \lyrB
    \new Lyrics \lyrC
    \new Staff <<
      \new Voice = "Basso" { \bass }
      >>
    >>
  }
}
