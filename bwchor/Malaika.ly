\version "2.24.0"
sheetName = "Malaika"
sheetComposer = "Fadhil Mdawida"
\include "../include/book.ily"

lyrA = {
  \lyricmode {
    \set stanza = #"1. "
    Ma -- lai -- ka,
    na -- ku -- pen -- da
    Ma -- la -- i -- ka.
    \set stanza = #"1. "
    Ma -- lai -- ka,
    na -- ku -- pen -- da
    Ma -- la -- i -- ka.
    \set stanza = #"1.+ 3. "
    Nin -- ge -- ku -- o -- a _
    ma -- li -- we.
    nin -- ge -- ku -- o -- a _
    da -- da.
    na -- shin -- dwa na ma -- li
    si -- na we,
    nin -- ge -- ku -- o -- a Ma -- la -- i -- ka.
}}

lyrB = {
  \lyricmode {
    \set stanza = #"2. "
    _ Pe -- sa,
    za -- zum -- bu -- a ro -- ho yan -- gu.
    \set stanza = #"2. "
    _ Pe -- sa,
    za -- zum -- bu -- a ro -- ho yan -- gu.
    \set stanza = #"2. "
    _ Na _ -- mi ni -- fan -- ye -- je _
    _ _ ki -- jana mwen -- zi -- o.
    
 }}
lyrC = {
  \lyricmode {
  \set stanza = #"3. "
  _ Kide -- ge, ha -- ku -- wa _ -- sa ki -- de -- ge.
  \set stanza = #"3. "
  _ Kide -- ge, ha -- ku -- wa _ -- sa ki -- de -- ge.
}}

sopran = \relative c' {
  \time 4/4
  \key f \major
  \partial 8
  \set melismaBusyProperties = #'(tieMelismaBusy)
  c8
  <f a>8~ 4 a8~ 2
  r4 g8 a( bf) g4 e8
  g8( f4) f8~ 2~
  f2. \break r8 <c c'>
  a'8~ 4 8~ 2
  r4 g8 a( bf) g4 e8
  g8( f4) f8~ 2 \break
  r8 f f f f4 e8( f)
  d8 d4 d8~ d2
  r8 bf' bf bf bf4 a8( bf)
  r8 g4 g8~ g2 
  \break
  \repeat volta 2 {
    r4 c,8 c c' bf a g
    f c4 a'8~ 2
    r8 g8 g a bf8( g4) e8
    g8( f4) f8~ f2
  }
  %  \bar "|."
}

alt = \relative c' {
  \key f \major
  c8
  f8~ f4 f8~ 2
  r4 e8 f g e4 c8
  c4 c8 8~ 2~
  2. r8 8
  f8~ 4 f8~ 2
  r4 e8 f g e4 c8
  c8 c4 c8~ c2
  r8 c8 c c d4 c
  b8 b4 b8~ 2
  r8 g' g g g4 f8( g)
  r8 e8( d) e~ e2
  r4 a8 g a g f e
  c8 c4 f8~ 2
  r8 e e f g( e4) c8
  c8 c4 c8~ 2
}


chrdStrophe = \chordmode {
  s8
  f1 c:7 f c:7 f c:7 f f:7 bf s g:7 c:7 f c:7 f
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.3))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames \chrdStrophe 
    \new Staff <<
      \new Voice = "Sopran" \sopran 
      >>
    \new Lyrics \lyricsto "Sopran" \lyrA
    \new Lyrics \lyricsto "Sopran" \lyrB
    \new Lyrics \lyricsto "Sopran" \lyrC
    \new Staff <<
      \new Voice = "Alt" \alt 
      >>
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)

    }
  }
}
