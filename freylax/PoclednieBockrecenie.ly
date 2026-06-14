\version "2.24.2"
sheetName = "Poclednie Bockrecenie / Tchornye Glasa"
sheetComposer = "E. Pemersburski / O.Smrok"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key e \minor
  \accidentalStyle modern-cautionary
  \partial 2.
  \bar ".|:"
  \repeat volta 2 {
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 A}}
b8 c8 b4 e8 g8 |
c2 b2 |
r4 d8 cs8 c4 fs,8 g8 |
b2 a2 |
r4 d8 cs8 c4 fs,8 g8 |
b2 a2 |

r4 as4 b4. }
  \alternative {
    { fs8 | g1 }
    {  g8 | e1 }
  } 
r1 |\break
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 B}}
e4. fs8 gs4. b8 |
d4. ds8 e4. b8 |
d2 c2 |
r1 |
d,4. e8 fs4. a8 |
c4. cs8 d4. c8 |
b1~ | 
\bar "||"
b8
\once \override Score.RehearsalMark.self-alignment-X = #-2
\mark \markup{ \box{\fontsize #4 A}}
s8*7
\bar "|."
}

chrdStrophe = \chordmode {
  s2. | e1:m | s | a:m | s | b:7 | s | 
  e:m | s8 | e1:m | s | e:7 | s | a:m | s | d:7 |
  s | g | b:7  
}

stropheB = \relative c' {
  \time 4/4
  \key g \minor
  \partial 2.
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 C}}
d4 g4 a4 |
bf2 bf2~ |
bf8 d8 cs8 d8 ef8 d8 bf8 g8 |
g8 fs4 g8 a2~ |
a4 \break d,4 fs4 a4 |
c2 c2~ |
c4 a4 bf4 c4 |
ef8 d8 d8 cs8 d2 |
r1 |
d2 d2~ |
d4 \break b4 c4 d4 |
f8 ef8 ef8 d8 f4 ef4~ |
ef4 a,4 bf4 a4 |
g4 d4 cs4 d4 |
bf'4. bf8 bf4 a4 |
g1 |
\break
  \repeat volta 2 {
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #2 D}}
r8 d8 g8 a8 bf8 fs8 g8 ef8 |
d1~ |
d4 g4 a4 bf4 |
c2 a2 |
r8 ef8 c'8 gs8 bf8 a8 c,8 ef8 |
g2. fs4 |
a4 ef4 d8 a8 bf8 c8 |
d1 |
r8 d8 g8 a8 bf8 fs8 g8 ef8 |
d1~ |
d4 g4 b4 d4 |
f2 ef2~ |
ef4 a,4 bf4 c4 |
ef8 d8 d8 bf8 fs4 g4 
  }
  \alternative {
   {a4 e4 fs4 g4 |
     a1 |}
   {bf4. bf8 a4. fs8 |
    g1~ 8 }
  }
\bar "|."
}

chrdStropheB = \chordmode {
  s2. | g1:m | s | d:7 | s | c:m | d:7 |
  g1:m | d1:7 | g1:7 s | c1:m | s  g1:m |
  d1 | g1:m | s | g1:m | s  | d1:7 | s| c1:m6 | d1:7 | g1:m |
  s | g1:m | g1:7 | c1:m | s | g1:m |
  a:7 d:7 ef2:7 d:7 g:m 
}



\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Tango |: A A B A :| | C D D | | A A B A | }
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
  }  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 24)
    }
    <<
    \new ChordNames { \chrdStropheB }
    \new Staff <<
      \new Voice = "Strophe" { \stropheB }
      >>
    >>
  }
}
