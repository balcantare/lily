\version "2.24.2"
sheetName = "Hora in Em"
sheetComposer = "Roby Lakatos"
\include "../include/book.ily"

sheetTonality = g
octaveBf = 0

strophe = \relative c' {
  \time 4/4
  \key e \minor
  \accidentalStyle modern-cautionary
  \bar ".|:"
  \repeat volta 2 {
\mark \markup{ \box{\fontsize #4 A}}  r16 b8 b16 e16 e8 fs16 g16 g8 e16 b'16 as16 b8 |
  r16 e,16 a16 b16 c16 b16 e16 c16 b8-\prall a8 g8-\prall fs8 |
  r16 b,8 b16 ds16 ds8 e16 fs16 es16 fs16 g16 a16 ds,16 e16 fs16 |
  g16 a16 g16 fs16 g16 e16 fs16 ds16 e8 b'8 }
  \alternative {
  { a8-\prall g8 }
  { b4 }
  }
\break
\repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
  r8 e16 d16 cs8-\prall b8 e8 d8 cs8-\prall b8 |
  r16 as16 b16 cs16 d16 cs16 e16 d16 d16 cs16 cs16 b16 cs16 b16 b16 g16 |
  }
  \alternative {
    { e16 fs16 g16 a16 b16 c16 ds16 e16 fs8. e16 ds16 a16 as16 b16 |
      c16 b16 b16 a16 a16 g16 g16 fs16 e8 g16 b16 a8-\prall g8 }
    { e16 b16 e16 fs16 g16 a16 b16 c16 b8-\prall a8 g8-\prall fs8 |
      b16 fs16 g16 a16 g16 fs16 g16 a16 b16 fs16 g16 ds16 e4 }
  }
\break
\repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 C}}
  r16 e16 a16 b16 c16 b16 e16 c16 b8-\prall a8 b8 a8 |
  r16 d,16 g16 a16 bf16 a16 bf16 c16 d8. cs16 d16 a16 bf16 fs16 |
  g8 d'4 d16 cs16 e16 d16 d16 cs16 d16 e,16 fs16 g16 |
  gs16 a8 as16 b16 g16 a16 fs16 g16 a16 b16 ds,16 
} \alternative {
  { e4 }
  { e16 ds16 e16 fs16 }
}
\break
  \repeat volta 3 {
    \mark \markup{ \box{\fontsize #4 D}}
  \time 3/4  
  g16 fs16 e16 ds16 e16 fs16 g16 gs16 a16 e16 c16 a16 |
  \time 4/4
  g'16 fs16 e16 ds16 e16 fs16 e16 ds16 
  }
  \alternative {
    {e16 b16 cs16 ds16 e16 ds16 e16 fs16 }
    {e8 cs4 ds8}
  }
\bar "|."
}
chrdStrophe = \chordmode {
  e1:m6 | a1:m7 | b1:7 | s2 e4:m6 b4:7 
  e4:m6
  e1:m6 | s1 | e2:m6 a2:m7 | b2:7 e4:m6 b4:7 |
  e2:m6 a2:m7 | b2.:7 e4:m6 |
  a2:m7 d2:7 | g1:m6 | s | b2:7 e2:m6 
  s4 |
  e2:m6 a4:m7 | b2:7 e4:m6 b:7
  e8:m6 fs4:7 b8:7 | 
}
\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = \markup { Swing |AA BB CC DDD| }
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
