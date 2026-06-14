\version "2.24.2"
sheetName = "Rhythm Gitan"
sheetComposer = "Joe Privat"
\include "../include/book.ily"
sheetTonality = bf
octaveBf = 0

strophe = \relative c'' {
  \time 4/4
  \key g \minor
  \accidentalStyle modern-cautionary
  \once\override Score.RehearsalMark.self-alignment-X = #1
  \mark \markup{ \box{\fontsize #4 A}}
  bf8   bf8   g8   bf8~   bf4   r4 |
  r8   fs8   a8   c8   ef8   d8   cs8   c8 | 
  bf8   bf8   g8   bf8~   bf4   r4 |
  r8   d,8   fs8   a8   c8   b8   bf8   a8 |
  g8   g8   ef8   g8~   g4   r4 |
  r8   fs8   g8   a8   bf8   c8   fs,8   g8 |   
  d8   d8   r4   r2 |   r1 | \break  
  \once\override Score.RehearsalMark.self-alignment-X = #1
  \mark \markup{ \box{\fontsize #4 A}}
  bf'8   bf8   g8   bf8~   bf4   r4 |
  r8   fs8   a8   c8   ef8   d8   cs8   c8 |
  bf8   bf8   g8   bf8~   bf4   r4 |
  r8   d,8   fs8   a8   c8   b8   bf8   a8 |   
  g8   g8   ef8   g8~   g4   r4 |
  r8   fs8   g8   a8   bf8   c8   fs,8   g8 |   
  d8   d8   r4   r2 |   r1 | \break
  \once\override Score.RehearsalMark.self-alignment-X = #1
  \mark \markup{ \box{\fontsize #4 B}}
  bf'4-\prall   g8   a8   bf4   r4 | 
  r8   d8   c4   ef8   d8   c8   bf8 |  
  a4-\prall   f8   g8   a4   r4 |   r4   r8   gs'8   a8   f8   d8   a8 |
  bf8   bf8   g8   a8   bf4   r4 |   
  r8   d4   c8   ef8   d8   c8   bf8 |
  c4   bf8   a8~   a2~ |   a2   r2 | \break
  \once\override Score.RehearsalMark.self-alignment-X = #1
  \mark \markup{ \box{\fontsize #4 A}}
  bf8   bf8   g8   bf8~   bf4   r4 | 
  r8   fs8   a8   c8   ef8   d8   cs8   c8 |   
  bf8   bf8   g8   bf8~   bf4   r4 | 
  r8   d,8   fs8   a8   c8   b8   bf8   a8 |   
  g8   g8   ef8   g8~   g4   r4 |   
  r8   fs8   g8   a8   bf8   c8   fs,8   g8 |   
  d8   d8   r4   r2 |   r1 | \bar "|."
}

chrdStrophe = \chordmode {
  g1:m6 | d1:7 | g1:m6 | d1:7 | 
  c1:m6 | d1:7 | g1:m6 | d1:7 | 
  g1:m6 | d1:7 | g1:m6 | d1:7 | 
  c1:m6 | d1:7 | g1:m6 | s1 | 
  ef1:7+ | s1 | d1:m7 | s1 | 
  c1:m7 | s1 | d1:7 | s1 | 
  g1:m6 | d1:7 | g1:m6 | d1:7 | 
  c1:m6 | d1:7 | g1:m6 | d:7 | 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = "|AABA|"
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
