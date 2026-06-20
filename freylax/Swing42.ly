\version "2.24.2"
sheetName = "Swing 42"
sheetComposer = "Django Reinhardt"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

strophe = \relative c'' {
  \time 4/4
  \key c \major
%  \partial 3
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 A}}
g4 r4 r4 r8 gs8 |
a8 b8 c8 d8 e4-. f8 g8~ |
g2 r4 gs8 a8~ |
a8 f8 d8 c8 b8 a'8~ a4 |
g4 r4 r8 fs8 g8 gs8 |
a8 f8 c8 b8 e4-. g,8 c8~ |
c8 c8~ c4 r2 |
r8 b8 c8 d8  c8 b8 a af |\bar "||" \break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 A}}
g4 r4 r4 r8 gs8 |
a8 b8 c8 d8 e4-. f8 g8~ |
g2 r4 gs8 a8~ |
a8 f8 d8 c8 b8 a'8~ a4 | \break
g4 r4 r8 fs8 g8 gs8 |
a8 f8 c8 b8 e4-. g,8 c8~ |
c1 r1 \bar "||" \break
\key e \major
\once \override Score.RehearsalMark.self-alignment-X = 3.5
\mark \markup{ \box{\fontsize #4 B}}
gs8 a b cs r cs4.
a8 b8 cs8 ds8~ 4 r |
gs,8 a b cs r cs4.
a8 b8 cs8 ds8~ 4 r |
gs,8 a b cs r cs4.
a8 b8 cs8 ds8~ 4 r |
e8 e r e a4-. af8 g~ |
g1 \bar "||" \break
\key c \major
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 A}}
g,4 r4 r4 r8 gs8 |
a8 b8 c8 d8 e4-. f8 g8~ |
g2 r4 gs8 a8~ |
a8 f8 d8 c8 b8 a'8~ a4 |
g4 r4 r8 fs8 g8 gs8 |
a8 f8 c8 b8 e4-. g,8 c8~ |
c2 r |
r1 
\bar "|."
}

chrdStrophe = \chordmode {
  c2:6 a:m7 | d:m7 g:7 | e:m7 a:m7 | d:m7 g:7 | 
  g:m6 a:7 | d:m7 g:7 | c:6 a:m7 | d:m7 g:7 | 
  c2:6 a:m7 | d:m7 g:7 | e:m7 a:m7 | d:m7 g:7 | 
  g:m6 a:7 | d:m7 g:7 | c1:6 | fs2:m7 b:7 |
  e2:6 cs:m7 | fs:m7 b:7 | e:6 cs:m7 | fs:m7 b:7 | 
  e2:6 cs:m7 | fs:m7 b:7 | e1:6 | d2:m7 g:7 | 
  c2:6 a:m7 | d:m7 g:7 | e:m7 a:m7 | d:m7 g:7 | 
  g:m6 a:7 | d:m7 g:7 | c:6 cs:dim | d:m7 g:7 | 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Swing | A A B A | }
  }
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 24)
    }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
