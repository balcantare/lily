\version "2.24.4"
sheetName = "Slivovitz Polka"
sheetComposer = "Dirk Reuter"
\include "../include/book.ily"

strophe = \relative b' {
  \clef "treble" \time 2/4 \key ef \major  
  \bar ".|:"
  \repeat volta 2 {
    \partial 4.
    \tempo 4=130 
    b8 c8  d8 
    ef8. -. ef8. -.
    c8 | % 2
    f8. -.   f8. -.  c8 | % 3
    g'8   f8  ef8
    d8 | % 4
    ef8   d8  c8 b8 \break| % 5
    ef8. -.  ef8. -.  c8
    f8. -.  f8. -.  c8 | % 7
  
  \alternative {
    { g'8  f8  ef8 d8
      \partial 8 c8 
    }
    {  ef8   d8  c8  b8 \partial 8 c8 \break} 
  }
  }
  \partial 4. c8  d8 ef8
  f4  r8  f8 | % 12
  g4  af4 | % 13
  bf4   g4 | % 14
  f4  ef4 \break | % 15 
  f4  r8  f8 | % 16
  g4  af4 | % 17
  g2  | % 18
  r8  g8  d8  ef8 \break | % 19
  f4  r8  f8 | 
  g4  af4 | % 21
  bf4   g4 | % 22
  g4   d4 \break | % 23
  e4  r8  e8 | % 24
  f4  g4 | % 25
  f4   ef4 | % 26
  c4  a4 | % 27
  bf4  af4  | % 28
  \partial 8 g8 
  \bar ":|." \break
  \time 3/4  \mark \markup { \box{\fontsize #2 Coda} }  bf4
  -.   af4 -.  g4 -.  |
   bf4 -.   af4 -. g4 -. | % 31
   bf4 -.  af4 -.  g4 -. | % 32
   c4 -.  r4 r4 \bar "|."
}

chrdStrophe = \chordmode {
  s4.
  c2:m af bf g:7 c:m af g:7 c8:m g2:7 
  c:m bf s ef s bf s ef s bf s ef g:7 c:7 s
  f:7 s bf4 af g8:7 
  bf4 af g:7
  bf af g:7
  bf af g:7
  c:m
}


\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##t
  }
  \bookItem
  \score {
    \layout {#(layout-set-staff-size-with-jazz 24)}
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}