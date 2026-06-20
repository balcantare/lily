\version "2.24.2"
sheetName = "Par ci - par la"
sheetComposer = "?"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

strophe = \relative c'' {
  \time 3/4
  \key c \minor
  \accidentalStyle modern-cautionary
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #4 A}}
g4 c4 d4 |
ef2 ef4 |
ef4-\prall d4 c4 |
<af c>4 <g bf>4 <f af>4 |
g2. |
c2. |
g2.~ |
g2. | 
\break 
f4 g4 af4 |
af4-\prall g4 f4 |
g4 c4 d4 |
ef4-\prall d4 c4 |
d2. |
a2. |
d2. |
g,8 af8 g8 f8 ef8 d8 |
\break
g4 c4 d4 |
ef2 ef4 |
ef4-\prall d4 c4 |
<af c>4 <g bf>4 <f af>4 |
g2. |
c2. |
g2.~ |
g2. |\break
f4 g4 af4 |
af4-\prall g4 f4 |
g4 c4 d4 |
ef4-\prall d4 c4 |
d2. |
ef2. |
  \tuplet 3/2 {c8 d8 c8} b8 c8 ef8 g8 |
c4 r4 r4 | \break
  \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #4 B}}

<< {
  \voiceOne
  af2.~ |
  af4 bf4 f4 |
  g2.~ |
  g4 f4 ef4 |
  d2 d4 |
  d4 ef4 d4 |
  g2.~ g4 g g 
  af2.~ |
  af4 bf4 f4 |
  g2.~ |
  g4 f4 ef4 |
  d2 d4 |
  d4 ef4 d4 |
  c2.~ c4 r4 r4 
  }
  \new Voice {
    \voiceTwo 
    r4 c4 ef4 |
    d2. |
    r4 bf4 d4 |
    c2. |
    s s s s4 ef4 4
        r4 c4 ef4 |
    d2. |
    r4 bf4 d4 |
    c2. | 
  }
  >> 
  \once \override Score.RehearsalMark.self-alignment-X = #-1
  \mark \markup{ \box{\fontsize #4 A}}
  \bar "||" s2. \bar ".|:" \break
  \key c \major
 \oneVoice
   \once \override Score.RehearsalMark.self-alignment-X = #RIGHT
  \mark \markup{ \box{\fontsize #4 C}}

\repeat volta 2 {
<g e'>8 r8 8 8 8 8
<b g'>8 r8 8 8 8 <a f'>8
<g e'>8 r8 8 8 8 8
<b g'>8 r8 8 8 8 <a f'>8

e'-\prall r c8 d8 e8 c8 |
d8-\prall r8 b8 c8 d8 e8 |
c4 e,4 g4 |
c4 b4 bf4 |
<c a'>8 r8 <c f>8 <c g'>8 <c a'>4 |
<< {
  \voiceOne
  f8 g
   }
   \new Voice {
     \voiceTwo
     c,4}
>>
\oneVoice
<c a'>4  <c f>4 |
<e g>8 r <c e> <d f> <e g>4 |
<c e>8 <d f> <e g>4 <c e>
e2 e4
}
\alternative {
  {c4 d e 
   d2.~ d2. }
  {d4-\prall c d 
    \tuplet 3/2 {c8 d8 c8} b8 c8 e8 g8 |
c4 r4 r4 }
}
\bar "|."
}

chrdStrophe = \chordmode {
  c2.:m | s | f:m | s | 
  c:m | f:m | c:m | s |
  f:m | s | c:m | s | 
  d:7 | s | g:7 | s | 
  c:m | s | f:m | s | 
  c:m | bf | ef | s |
  f:m | s | c:m | s |
  d:7 | g:7 | c:m | s |
  
  f:m | bf:7 | ef | af |
  d:7 | s | g | s |
  f:m | bf:7 | ef | af |
  d:7 | g | c:m | s |
  s
  
 c | g:7 | c | g:7 |
 c | g:7 | c | c:7 | 
 f | s | c | a:m | d:7 | s | g s 
 g:7  c
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Walzer | A BB A CC | }
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
