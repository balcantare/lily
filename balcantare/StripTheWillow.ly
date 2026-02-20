\version "2.24.2"
sheetName = "Strip the Willow"
\include "../include/book.ily"

strophe = \relative c'' {
  %\voiceOne
  \time 4/4
  \key d \major
  \mark \markup{ \box{\fontsize #4 Intro}}
  fs8. d16 fs8. d16 fs8.a16 g8. fs16
  e8. d16 cs8. d16 e8. fs16 g8. e16 
  fs8. a16 fs8. d16 e8. g16 e8. cs16 
  d2 d4 \break
  \mark \markup{ \box{\fontsize #4 A1}}
  \repeat volta 2 {
    b16( cs) b8
    a8. fs16 d8. fs16 a8. fs16 d8. fs16
    a4 d d b16( cs) b8
    a8. fs16 d8. fs16 a8. fs16 d8 e16( fs)
    g4 e e d16( e fs g)
    a8. fs16 d8. fs16 a8. fs16 d8. fs16
    a4 d d e
    fs4 fs16( g) fs8 e8.cs16 a8. cs16
    d8. a16 fs8. a16 d4
  } \break
  \mark \markup{ \box{\fontsize #4 A2}}  
  \repeat volta 2 {
    d8( e) 
    fs8 d fs d fs a g fs
    e d cs d e fs g e
    fs d fs d fs a g fs 
    e d cs b a4 d8 e
    fs8 d fs d fs a g fs
    e d cs d e fs g e
    fs8 a fs d e g e cs 
  } \alternative {
    { d2 d4 } 
    { \time 3/4 d4. d8 }
  }
  \break
  \mark \markup{ \box{\fontsize #4 A3}}
  \repeat volta 2 {
  r8 a8
  fs8 a a d4 a8
  fs8 a a d4 a8
  e'4 a,8 cs[ b a]
  e'4 a,8 cs[ b a]
  fs8 a a d4 a8
  fs8 a a d4 a8
  e'4 a,8 cs[ b a]
  b4 cs8 d8 } \break
  \mark \markup{ \box{\fontsize #4 A4}}
  \repeat volta 2 {
    fs8 g
    a8[ b a] fs16([ g fs8) e]
    d4. d8 e8 fs
    g[ fs e] fs[ e d] 
    e[ a, a] a[ fs' g]
    a8[ b a] fs16([ g fs8) e]
    d4. d8[ cs d] 
    e4 a,8 cs[ b a]
    b4 cs8 d
  } r4
  \pageBreak
  \mark \markup{ \box{\fontsize #2 B}}
  \time 4/4
  \key g \major
  d,4. d8 d4 e
  g a b b16( c b8)
  a4 g e g
  b a b d
  d,4. d8 d4 e
  g a b c8 b8
  a4 g e8 d c e
  d8 e fs g a b c a
  d4. e8 d4 c 
  b a b2
  a4 g e g
  b a b d
  d4. e8 d4 c 
  b a b b16( c b8)
  a4 g e8 d c e
  d2 d4 \bar "||"
  \repeat volta 2 {
  \set Score.repeatCommands = #'((volta "1") end-repeat)
   d16( e) fs8  
   \set Score.repeatCommands = #'((volta #f))
   \once\override Score.RehearsalMark.self-alignment-X = #-1.5
   \once\override Score.RehearsalMark.Y-offset = #0
   \mark \markup{ \box{\fontsize #1 ..C1}} 
   s2. \bar "||"
   \set Score.repeatCommands = #'((volta "2") end-repeat) 
   e4
   \set Score.repeatCommands = #'((volta #f))
   \once\override Score.RehearsalMark.self-alignment-X = #-1.2
   \once\override Score.RehearsalMark.Y-offset = #0
   \mark \markup{ \box{\fontsize #1 ..A1}}
   s2. \bar "||"
   \set Score.repeatCommands = #'((volta "3") end-repeat)
   g4 
   \set Score.repeatCommands = #'((volta #f))
   \once\override Score.RehearsalMark.self-alignment-X = #-1.2
   \once\override Score.RehearsalMark.Y-offset = #0  
   \mark \markup{ \box{\fontsize #1 Fine}}
   s1 \bar "||"
  } 
  \break
  \mark \markup{ \box{\fontsize #2 C1}}  
  \repeat volta 2 {
    g8 a b c d b a g
    b4 b8 a b c b a
    g8 a b c d b g b
    a4 a a8 c b a
    g8 a b c d b a g
    b4 b8 a b4 b8 d
  } 
  \alternative {
     {e8fs e d e d e fs 
      g e d  b a c b a}
     {e'8 g e d b d e fs
      g e d b a[ c]  }
  } \break
    \mark \markup{ \box{\fontsize #2 C2}}

  \repeat volta 2 {
    b a
    g4 g'16( a) g8 e fs g e
    d b b a b c b a
    g4 g'16( a) g8 e fs g e
    \appoggiatura g a4 a8 g a g e fs 
    g4 g e8 fs g e
    d8 b b a b4 a16( b) d8 
    e8 fs e d b d e fs
    g16[( fs) e8 d8 b] a4
  } \break
  \partial 4
  \time 3/4
    \mark \markup{ \box{\fontsize #2 C3}}

  \repeat volta 2{
  b8 c
  d8[ c d] b[ a b]
  c[ b c] a[ fs d]
  d[ g g] fs[ g a]
  b[ g b] a[ b c]
  d8[ c d] b[ a b]
  c[ b c] a[ fs d]
  d[ g g] fs[ g a]
  b[ g g] g
  } \break
    \mark \markup{ \box{\fontsize #2 C4}}

  \repeat volta 2 {
    e'8 fs
    g8[ fs e] d[ cs d]
    e[ d c] b[ c d]
    e[ c a] d[ b g]
    fs[ a g] fs[ e d]
    g'8[ fs e] d[ cs d]
    e[ d c] b[ c d]
    e[ fs g] e[ a g]
    fs[ d d] d 
  }
  \once\override Score.RehearsalMark.self-alignment-X = #-3
  \once\override Score.RehearsalMark.Y-offset = #0  
  \mark \markup{ \box{\fontsize #1 ..B}}
  s4
  
%   \mark \markup{ \box{\fontsize #4 G}}
%   \mark \markup{ \box{\fontsize #4 C..E}}
    \bar "|."
}

chrdStrophe = \chordmode {
  d1 a d2 a2 d1
  d1 s s a d s s2 a d1
  d a d a d a d2 a d2.
  d2.
  d2. s a s d s a g4 a8 d4.
  d2. s a4. d a2. d s a g4 a8 d8
  s4
  g1 s c d g s c d g s c d g s c d s4 s1 s4 s1 s2
  g1 s s d g s c s2 d c1 s2 d
  g c d1 g2 c d1
  g2 c g1 c2 g c4g d2
  g2. d g s4. d
  g2. d g s
  g c s4. g d2. g c s d4.
}

\bookpart {
  \paper {
    page-count = #2
  }
  \bookItem
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
