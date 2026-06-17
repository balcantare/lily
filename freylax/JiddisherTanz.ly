\version "2.24.2"
sheetName = "Jiddischer Tanz"
sheetComposer = "trad."
\include "../include/book.ily"

sheetTonality = g
octaveBf = 0

strophe = \relative c' {
  \time 2/2
  \accidentalStyle modern-cautionary
  \key e \minor
\language "english"
    \once\override Score.RehearsalMark.self-alignment-X = #2
\mark \markup{ \box{\fontsize #4 A}}

e8( g8) b8 e8 b4-\prall a8 g8 |
a8( b8) a4 a4 a4 |
a8( d8) a8( d8) a4 g8 fs8 |
g2 g4 fs8( e8) |
e8( g8) b8 e8 b4-\prall a8 g8 |
a8( b8) a4 a4 a4 |
d8( c8) b8 a8 g4 f4 |
e2 e2 \bar "||" |\break

    \once\override Score.RehearsalMark.self-alignment-X = #2
\mark \markup{ \box{\fontsize #4 B}}

g8 a8 b4 b4 b4 |
b4 b4 b4-\prall a8 g8 |
b8( d8) b4 b4 a8 g8 |
cs8( e8) d2 g4 |
g,8( a8) b8 b8 b8 b8 b8 b8 |
b8 b8 b8( e8) b4 a8 g8 |
a8 b8 a4 a4 g8 fs8 |
g2 g4  fs4 \bar "||" |\break
    \once\override Score.RehearsalMark.self-alignment-X = #2
\mark \markup{ \box{\fontsize #4 C}}
e4 ds'8( e8) e4 f8 e8 |
e8 b8 c8 d8 e4 b4 |
e8( c8) b8 a8 a8-\prall( gs8) a8 b8 |
c2. b8( a8) |
a4 cs8( d8) d4 e8 d8 |
d8( a8) b8 c8 d4 d4 |
b4 c8( b8) b8-\prall( a8) a8-\prall( g8) |
b1 |
\once \override Score.RehearsalMark.self-alignment-X = #-2
\mark \markup{ \box{\fontsize #4 A}}
 \bar "||" s1 \bar "||" \break
%\bar "|."
}

chrdStrophe = \chordmode {
  e1:m6 | a2.:m6 a4:7 | d1:7 |
  g2.:6 b4:7 | 
  e1:m | a2.:m a4:7 | d2:m g4 f |
  e1:m | 
  g1 | s | s | s2. b4:7 |
  e1:m | s | a:m6 | fs2:7 b:7 | 
  e1:7 | s | a2:m e2:7 | 
  a1:m | d:7 | s | g2 d:7 | g b:7 | 
}
\bookpart {
  \paper {
    page-count = #1
    system-system-spacing.padding = #6
  }
  \bookItem
  \header{
    subtitle = \markup { ruhig | A B C A | }
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
