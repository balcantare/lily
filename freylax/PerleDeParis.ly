\version "2.24.2"
sheetName = "Perle de Paris"
sheetComposer = "Maurice Vittenet/Arleite Marlot"
\include "../include/book.ily"

sheetTonality = g
octaveBf = 0

strophe = \relative c' {
  \time 3/4
  \key e \minor
  \accidentalStyle modern-cautionary
  \partial 8*5
  \bar ".|:"
  \repeat volta 2 {
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 A}}
as8 b8 e8 g8 b8 |
c4. d16 c16 b4 |
r8 fs'8 g8 e8 b8 g8 |
fs4. g16 fs16 e4 |
r8 as,8 b8 e8 g8 b8 |
c4. d16 c16 b4 |
r8 fs'8 g8 e8 c8 b8 |
a2. |\break
r4 fs8 g8 a8 b8 |
c8 b8 as8 b8 fs'4 |
r4 fs,8 g8 a8 b8 |
c8 b8 as8 b8 g'4 |
r4 e8 fs8 g8 e8 |
fs2. |
cs2. |
ds2.~ |
ds8 \break as,8[ b8 e8 g8 b8] |
c4. d16 c16 b4 |
r8 fs'8 g8 e8 b8 g8 |
fs4. g16 fs16 e4 |
r8 as,8 b8 e8 g8 b8 |
c4. d16 c16 b4 |
r4 e,8 fs8 gs8 b8 |
d4. e16 d16 c4 |\break
r4 a8 b8 c8 e8 |
b'4. c16 b16 a4 |
r4 b8 a8 g8 fs8 |
a4. b16 a16 g4 |
r4 a8 g8 fs8 e8 |
g2. |
fs2. |
e2.~ |
e8 | \break
  }
\repeat volta 2 {
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 B}}
a,8 b8 c8 d8 e8 |
fs8 e8 ds8 e8 c8 a8 |
fs'8 e8 ds8 e8 c8 a8 |
fs'8 e8 ds8 e8 b8 g8 |
fs'8 b,8[ as8 b8 d8 df8] |
c8 b8 a8 g8 fs8 e8 |
ds8 b'8 as8 b8 d8 df8 |
c8 b8 as8 b8 e8 fs8 |
g8 \break a,8[ b8 c8 d8 e8] |
fs8 e8 ds8 e8 c8 a8 |
fs'8 e8 ds8 e8 c8 a8 |
fs'8 e8 ds8 e8 b8 g8 |
fs'8 b,8[ as8 b8 d8 df8] |
c8 b8 a8 g8 fs8 e8 |
ds8 e8 fs8 g8 a8 b8 |
e,2.~ |
e8  }|\break
|
  \repeat volta 2 {
\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
\mark \markup{ \box{\fontsize #4 C}}
r8 r4 d4 |
g4 b4 g4 |
fs4 b4 fs4 |
e4 e4 fs4 |
g4 fs4 e4 |
g2. |
c,2. |
c2.~ |
c4 r4 \break d4 |
fs4 a4 fs4 |
e4 a4 e4 |
d4 d4 e4 |
fs4 e4 d4 |
fs2. |
b,2. |
b2.~ |
b4 r4 \break b4 |
d2 d4 |
f2 f4 |
e2 e4 |
c'2 b4 |
b2 a4 |
a2 gs4 a2.~ |
a4 r4 \break d,4 |
g4 b4 g4 |
fs4 b4 fs4 |
e4 e4 fs4 |
g4 fs4 e4 |
g2. |
fs4 g4 a4 |
g2.~ |
g8  }|
|
%\bar "|."
}

chrdStrophe = \chordmode {
  s8*5 | e2.:m | s s s s s a:m | s |
  b:7 | s | e:m | s | fs:7 | s | b:7 | s |
  e:m | s | s | s | e:7 | s | a:m | s | s |
  s | e:m | s | c:7 | b:7 | e:m | s |
  a:m | s | e:m | s | b:7 | s | e:m | s |
  a:m | s | e:m | s | b:7 | s | e:m | s | 
  g | s | s | s | a:m7 | s | d:7 |
  s | a:m | d:7 | s s | g | s | s | s |
  d:m7/f | 
    \set chordBassOnly = ##t
d:m7/a | e:7 | s | a:m7 | e:7 a:m7 | 
  d:7 | g | s | s | s | a:m7 | d:7 | g  
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Musette Walz | AA BB CC | }
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
    >>
  }
}
