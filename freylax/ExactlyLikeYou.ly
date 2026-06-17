\version "2.24.2"
sheetName = "Exactly like you"
sheetComposer = "Jimmy McHugh / Dorothy Fields"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

Lyrics = \lyricmode {
I know why I've wai -- ted, 
know why I've been blue
Prayed each night for some -- one 
ex -- act -- ly like you
Why should we spend mo -- ney 
on a show or two?
No one does those love scenes 
ex -- act -- ly like you
You make me feel so grand; 
I'd like to hand the world to you
You seem to un -- der -- stand 
each foo -- lish lit -- tle scheme 
I'm sche -- ming
And_the dream_I'm drea -- ming
Now I know why_my mo -- ther 
taught me to be true
She meant me for some -- one 
ex -- act -- ly like you
}

strophe = \relative c' {
  \time 4/4
  \key c \major
  \bar ".|:"
  \repeat volta 2 {
  \once\override Score.RehearsalMark.self-alignment-X = #2
  \mark \markup{ \box{\fontsize #4 A}}
e'4 b4 d4 a4 |
c4 c2. |
e4 b4 d4 a4 |
c1 |
b4 f4 a4 e4 |
g4 g2 g4 |
c4 c,4 c4 c4~ |
c2 r2 | \break
\once\override Score.RehearsalMark.self-alignment-X = #2
  \mark \markup{ \box{\fontsize #4 A}}
e'4 b4 d4 a4 |
c4 c2. |
e4 b4 d4 a4 |
c1 |
b4 f4 a4 e4 |
g4 g2 g4 |
c4 c,4 c4 c4~ |
c4 \break 
\once\override Score.RehearsalMark.self-alignment-X = #2
\mark \markup{ \box{\fontsize #4 B}}
d4 e4 g4 |  
d'4 d4 d2~ |
d4 cs4 e8 d8 c8 b8 |
c4 c4 c2~ |
c4 a4 b4 c4 |
f4 f4 f2~ |
f4 e4 g8 f8 e8 d8 |
e4 e4 b4 b4 |
d4 d4 a4 g4 |\break
    \once\override Score.RehearsalMark.self-alignment-X = #2
\mark \markup{ \box{\fontsize #4 A}}
e'4 b4 d4 a4 |
c4 c2. |
e4 b4 d4 a4 |
c1 |
b4 f4 a4 e4 |
g4 g2 g4 |
c4 c,4 c4 c4~ |
c2 r2  }\break 
  \repeat volta 2 {
    \once\override Score.RehearsalMark.self-alignment-X = #2
\mark \markup{ \box{\fontsize #4 A'}}
c'4 r4 c4 r4 |
c4 r8 c8 c4 c8 d8~ |
d8 d8 r4 d4 r4 |
d4 r4 d4 d8 ef8~ |
ef8 ef8 r4 ef4 r4 |
e4 r4 e4 r4 |
c8 c b c~ c c b c~ c c b c~ c c b4  }
\once \override Score.RehearsalMark.self-alignment-X = #-2
\mark \markup{ \box{\fontsize #4 B}}
  s1 
\once \override Score.RehearsalMark.self-alignment-X = #-2
\mark \markup{ \box{\fontsize #4 A'}}
  s1 
  \bar "|."
}

chrdStrophe = \chordmode {
  c1:6 | s | d1:7 | s1 | 
  g1:7 | s | c1:6 | d2:m7 g2:7 | 
  c1:6 | s | d1:7 | s1 |
  g1:7 | s1 | c2:6 f2:6 | c2:6 c2:7 | 
  f1:6 | f:m6 | c1:6 | s2 e4:7 a4:m7 | 
  f1:6 | f2:m6 g:7 | c1:6  | d2:m7 g2:7 |
  c1 | s | d1:7 | s1 |
  g1:7 | s1 | c2:6 f2:6 | c1:6 |
  
  c1:6 | s1 | d1:7 | s1 | 
  ef1:6 | s1 | c4:6 b:6 c:6 b:6 |
  c4:6 b:6 c:6 b:6 
   
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Swing |: A A B A :| Riff | A' A' B A' |}
  }
  \score {
    \layout {
      #(layout-set-staff-size-with-jazz 22)
    }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    \new Lyrics \lyricsto "Strophe" \Lyrics
   >>
  }
}
