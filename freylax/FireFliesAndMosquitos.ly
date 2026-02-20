\version "2.24.2"
sheetComposer = "Wouter Kuyper"
sheetName = "Fireflies and Mosquitos"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 2/4
  \key g \major
    \accidentalStyle neo-modern-voice-cautionary

    %\bar ".|:"
  \mark \markup{ \box{\fontsize #4 A}}
  \partial 4
    bf4
  \repeat volta 2 {
     b8 g r b,
     c4. g'8
     fs8 g16 a~ a g fs8
     g c b16 a g a
     b8 g r b, 
     c4. g'8
     fs8 g16 a~ a g fs8
  } \alternative {
    {g4. bf8}
    {g4 fs}
  }
  \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
  e8 e16 fs g8 g16 fs
  e8 b' b b
  a16 b a g fs8 d
  e fs g fs
  e8 e16 fs g8 g16 fs
  e8 b' b b
  a16 b a g fs8 d
  } \alternative {
    {e2}
    {g4 a}
  } \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 C}}
  b8 b16 a g8 b 
  a8 d4 d8
  e8. d16 c8 b
  a16 b c8 b a
  b8 b16 a g8 b 
  a8 d4 d8
  e8. d16 c8 b
  a2
  }
}

chrdStrophe = \chordmode {
  s4 g2 c d g g c d g g4 d
  e2:m s d e8:m d c d
  e2:m s d c e4:m d
  g2 d c d
  g d c d
  
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
  }
  \bookItem
  \header{
    subtitle = "Polka |AABBCC|"
  }
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      >>
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 24)
    }
  }
}
  
