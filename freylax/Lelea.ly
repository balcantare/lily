\version "2.24.2"
sheetName = "Lelea"
sheetComposer = "Ansamblul Folcloric Romanesc"
\include "../include/book.ily"

sheetTonality = c
octaveBf = 0

strophe = \relative c' {
  \time 2/4
  \key c \major
  \accidentalStyle modern-cautionary
  \bar ".|:"
  \repeat volta 2 {
    \mark \markup{ \box{\fontsize #4 A}}
g8 b4 cs8 d8 e4   \tuplet 3/2 {cs16 d16 e16} |
f16 e16 e16 d16 d16 c16 c16 b16 b8 d4. |
g,8 b4 cs8 d8 e4   \tuplet 3/2 {cs16 d16 e16} |
f16 e16 e16 d16 d16 c16 c16 b16 b4 r4  } 
  \break
|
  \repeat volta 2 {
    \mark \markup{ \box{\fontsize #4 B}}
f''8 f8 f4 e8 e4   \tuplet 3/2 {cs16 d16 e16} |
f16 e16 e16 d16 d16 c16 c16 b16 b8 d4. |
\break f8 f8 f4 e8 e4   \tuplet 3/2 {cs16 d16 e16} |
f16 e16 e16 d16 d16 c16 c16 b16 b4 r4  } \break

\repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 C}}
f'16 e16 e16 d16 f16 e16 e16 d16 d16 c16 c16 b16 b16 d16 d16 e16 |
f16 e16 e16 d16 d16 c16 c16 b16 b8 d4 r8 |
f16 e16 e16 d16 f16 e16 e16 d16 d16 c16 c16 b16 b16 d16 d16 e16 |
f16 e16 e16 d16 d16 c16 c16 b16 b4 r4  } \break

  \repeat volta 2 {
    \mark \markup{ \box{\fontsize #4 D}}
a8 a16 gs16 a16 b16 c16 d16 d16 e16 c16 d16 b4 |
a16 g16 g16 fs16 a16 g16 g16 fs16 e16 ds16 e16 fs16 g16 a16 b8 |
a8 a16 gs16 a16 b16 c16 d16 d16 e16 c16 d16 b4 |
a'16 g16 g16 fs16 a16 g16 g16 fs16 }
  \alternative {
    {e16 b16 cs16 ds16 e4  }
    {e4 r4}
  }
\bar "|."
}

chrdStrophe = \chordmode {
  \set chordBassOnly = ##t
  g4:6 g:/fs g:/e g:/d | d4:7 d8:/e d:/fs g2:6 |
  g4:6 g:/fs g:/e g:/d | d4:7 d8:/e d:/fs g4:6 
  \parenthesize d4:7 |
  g2:7 c2:6 | d4:7 d8:/e d8:/fs g2:6 
  g2:7 c2:6 | d4:7 d8:/e d8:/fs g4:6 
  \parenthesize d4:7 
  | g2 s2*7 
   a2:m e:m | b:7 e8:m e:/fs e:/g e:/gs |
   a2:m e:m | b:7 e8:m e:/fs e:/g e:/gs 
   e4:m d:7 | | 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { |AA BB CC DD| }
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
