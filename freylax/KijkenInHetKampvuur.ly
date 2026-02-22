\version "2.24.2"
sheetComposer = "Wouter Kuyper"
sheetName = "Kijken in het Kampvuur"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 9/8
  \key a \minor
    \accidentalStyle neo-modern-voice-cautionary
  \mark \markup{ \box{\fontsize #4 A}}
   e4 a,8 c4 e8 a4 g8
   d4. e4 d8~ d4.
   c4 b8 a4 e'8 f4 e8
   b8 c e~ e4. d4. \break
   e4 a,8 e'4  a8 g4 e8 
   d4. e4 d8~ d4.
   c8 b a e'4 f8 e4 d8~
   d1~ d8 \break
   e4 a,8 c4 e8 a4 g8
   d4. e4 d8~ d4.
   c4 a8 f'4 e8~ e4 c8
   d8 e g~ 4 e8 d4 c8
   \break
   c4 a8 e'4  a8 g4 e8 
   d4. e4 d8~ d4.
   c8 b a e'2.~ 
   e2. d4. \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
  c4.~ 4 g'8~ 4 c,8
  b4. c4 b8~ b4.
  a4. e'4 f8 e4 c8
  d8 e g c4 g8 e4 d8
  c4.~ 4 g'8~ 4 c,8
  b4. c4 b8~ 4 c8
    } \alternative {
    {\tuplet 2/3{a4. e4.}
     f4.~ f2.
     }
    {a2. e4. f2.}
  } 
  \bar "|."
}

chrdStrophe = \chordmode {
  a1:m s8 e1:m s8 f1 s8 g1 s8
  a1:m s8 e1:m s8 f1 s8 g1 s8
  a1:m s8 e1:m s8 f1 s8 g1 s8
  a1:m s8 e1:m s8 f1 s8 g1 s8
  c1 s8 g1 s8 f1 s8 g1 s8
  c1 s8 g1 s8 f1 s8 s1 s8
  f1 s8
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##t
  }
  \bookItem
  \header{
    subtitle = "Mazurka |ABB|"
  }
  \score {
    \layout {#(layout-set-staff-size-with-jazz 24)}
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
  }
}
  
