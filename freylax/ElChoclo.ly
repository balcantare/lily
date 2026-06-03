\version "2.24.2"
sheetName = "El Choclo"
sheetComposer = "A.G. Villoldo"
\include "../include/book.ily"
\language "english"

sheetTonality = f
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key d \minor
  \partial 4.
  \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
  a8 a8 bf8 |
  bf8 a8 a8 d8 d8 f8 f8 bf8 |
  bf4 a4 r8 a8 a8 d8 |
  d8 a8 a8 f8 f8 g8 g8 f8 |
  f4 e4 r8 a,8 a8 bf8 |
  bf8 a8 a8 cs8 cs8 e8 e8 bf'8 |
  bf4 a4 r8 a8 gs8 a8 |
  e'8 cs8 cs8 a8 a8 g8 g8 f8 |
  e4 d4 r8 a8 a8 bf8 |
  bf8 a8 a8 d8 d8 f8 f8 bf8 |
  bf4 a4 r8 a8 gs8 a8 |
  d8 a8 a8 fs8 fs8 g8 a8 bf8 |
  c4 bf4 r8 bf,8 bf8 bf'8 |
  bf8 a8 a8 g8 g8 f8 f8 e8 |
  e4 d4 r8 f8 e8 d8 |
  d8 cs4 e8 g8 g8 f8 e8 |
  d2~ d8 
  } \break
  \mark \markup{ \box{\fontsize #4 B}}
  \repeat volta 2 {
  c b c8 |
  bf'8 bf4 bf8 c8 bf8 a8 g8 |
  bf8 a4 e8 g8 f8 e8 d8 |
  f8 e4 bf8 e8 d8 c8 b8 |
  d4 c4 r8 a8 gs8 a8 |
  g'8 g4 g8 a8 g8 f8 e8 |
  g4 f4 r8 f8 g8 f8 |
  e8 d8 cs8 d8 e8 f8 g8 gs8 |
  a2~ a8 
  } 
  \break 
  \key d \major
  \mark \markup{ \box{\fontsize #4 C}} 
  \repeat volta 2 {
  a,8 a'8 fs8 |
  d8 a4 a8 d8 a8 d8 fs8 |
  g4 e4 r8 a,8 g'8 e8 |
  cs8 a4 a8 cs8 a8 cs8 e8 |
  fs4 d4 r8 d8 fs8 e8 |
  ds8 b8 as8 b8 cs8 ds8 e8 fs8 |
  } \alternative {
    {
    a4 g4 r8 g8 b8 a8 |
    gs8 e8 ds8 e8 fs8 gs8 a8 b8 |
    a2~ a8 
    }
    { \partial 1
    a4 g4 r8 g8 a8 g8 
    }
  }
  fs8 e8 d8 e8 fs8 d8 e8 cs8 |
  d2~ d8 
\bar "|."
}

chrdStrophe = \chordmode {
  s4. | d1:m | s1 | s1 | a1:7 | s1 | s1 | s1 | d1:m | s1 | s1 | d1:7 | g1:m | s1 | d1:m | a1:7 | d1:m | c1:7 | f1 | c1:7 | f1 | a1:7 | d1:m | bf1:7 | a1:7 | 
  | 
  d1 | a1:7 | s1 | d1 | b1:7 | e1:m | e1:7 | 
  a2:7  s8 e1:m | e2:7 a2:7 | d2  
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { El Choclo }
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
