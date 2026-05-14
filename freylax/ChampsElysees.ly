\version "2.24.2"
sheetName = "Champs Elysees"
sheetComposer = "?"
\include "../include/book.ily"

sheetTonality = bf
octaveBf = 0

strophe = \relative c' {
  \time 3/4
  \key g \minor
  \language "english"
  \partial 2
  \once\override Score.RehearsalMark.self-alignment-X = #1
  \mark \markup{ \box{\fontsize #4 I}}
  d'8   ef8   f8   ef8 |
  d4   a8   c8   bf8   a8 |
  bf4   g8   bf8   a8   g8 |
  a4   fs8   a8   g8   fs8 |
  g4   d'8   ef8   f8   ef8 |
  d4   a8   c8   bf8   a8 |
  bf4   g8   bf8   a8   g8 |
  a4   f8   a8   g8   f8 |
  \bar "|"
  \repeat volta 1 {
  \set Score.repeatCommands = #'((volta "1.") end-repeat)
  \tuplet 3/2 {g8   a8   g8}   fs8   g8   bf8   d8 |
  g4 
  \set Score.repeatCommands = #'((volta #f))
  }
  \break
  \once\override Score.RehearsalMark.self-alignment-X = #1
  \mark \markup{ \box{\fontsize #4 A}}
  \repeat volta 2 {
    r4   r8   d,8 |
    d4   g4   bf4 |
  d4   f4.   ef8 |
  ef4-\prall   d2~ |
  2   r8   d,8 |
  d4   g4   bf4 |
  d4   c4.   bf8 |
  c4   a2~ |
  2   r8   \break d,8 |
  d4   fs4   a4 |
  c4   ef4.   d8 |
  d4   c2~ |
  2   r8   d,8 |
  d4   fs4   a4 |
  c4   bf4   a4 |
  bf4   c4   cs4 |
  d4   r4   r8   \break d,8 |
  d4   g4   bf4 |
  d4   f4.   ef8 |
  ef4   d2~ |
  2   d4 |
  g4   d4   ef4 |
  f4   ef4   d4 |
  g4   ef4   c4 |
  g4   r4   
  \break g4 |
  g4   c4   ef4 |
  g4   f4   ef4 |
  g4   d4   bf4 |
  d,4   cs4   d4 |
  c'2.   |
  a2   bf4 |
  g2.~ |
  g4 
  } 
  s2^\markup{ \box{\fontsize #6 I}} 
  \bar "|"
  \repeat volta 1 {
  \set Score.repeatCommands = #'((volta "2.") end-repeat)
  \tuplet 3/2 { g8   a8   g8}
  fs8   g8   b8   d8 |
  g4 
  \set Score.repeatCommands = #'((volta #f))
  }
  \break
  \once\override Score.RehearsalMark.self-alignment-X = #1
  \mark \markup{ \box{\fontsize #4 B}}
  \key g \major
  \repeat volta 2 {
  r8   d,8   e8   fs8 |
  b2   b4 |
  fs2   \tuplet 3/2 {fs8   g8   fs8} |
  e2.~ |
  e2   d4 |
  d4   e4   fs4 |
  g4   fs8   r8   r8   e8 |
  c'2.~ |
  c2   
  \break d,4 |
  c'2   c4 |
  a2   \tuplet 3/2 { g8   a8   g8 } |
  fs2.~ |
  fs2   e4 |
  e4   d4   fs4 |
  a4   d8   r8   r8   c8 |
  b2.~ |
  b2 \break  
  d,4 |
  b'2   b4 |
  fs2   \tuplet 3/2 {fs8   g8   fs8} |
  e2.~ |
  e2   fs4 |
  fs4   g4   a4 |
  b4   a4   g4 |
  e'2.~ |
  e2. |
  c4-\prall   b4-\prall   a4 |
  c4-\prall   b4-\prall   a4 |
  b4   a4   g4 |
  d4   cs4   d4 |
  e2. |
  fs4   e4   d4 |
  g2.~ |
  g4 }
  %\bar "|."
}

chrdStrophe = \chordmode {
  s2 | d2.:7 | g2.:m | d2.:7 |
  g2.:m | d2.:7 | g2.:m | d2.:7 |
  g2.:m | s4  s2 | 
  g2.:m | s2. | 
  s2. | s2. | s2. | s2. | 
  d2.:7 | s2. | s2. | s2. | s2. | s2. | 
  s2. | s2. |
  g2.:m | d2.:7 | 
  g2.:m | s2. | s2. | s2. | 
  g2.:7 | s2. | c2.:m | s2. |
  s2. | c2.:m6 | g2.:m | s2. |
  d2.:7 | s2. | g2.:m | s4  
  s2 g2.:m | s4  s2 | g2. |
  s2. | s2. | s2. | s2. |
  s2. | a2.:m | d2.:7 | 
  a2.:m | s2. | d2.:7 | 
  s2. | s2. | s2. | g2. |
  d2.:7 | g2. | s2. | s2. |
  s2. | g2.:7 | s2. | c2. |
  s2. | c2.:m | s2. | g2. |
  s2. | a2.:m | d2.:7 | g2. | s4  
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Walzer |I AA I BB|II }
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
