\version "2.24.2"
sheetComposer = "Paul Young"
sheetName = "Michael's Jig"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 6/8
  \key e \minor
  \accidentalStyle neo-modern-voice-cautionary
  \bar ".|:" 
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
    g4. g8 fs d
    e fs g fs4 d8
    b'8 a g e'4 d8~
    d4 g,8 b c d
    e4 g8~ g fs e
    d4 g,8 g a b
    c4 b8 b a g
    a4. a8 g a
  }
  \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
    g4 e8 e fs g
    fs4 d8 d e fs
    g e e e g b
    b c b a g fs
    g4 e8 e g b
    c4 d8~ 4 b8
    c b a b a g
  } \alternative {
    {a4. a8 g a}
    {a4. a4 fs'8}
  } \bar "||" \break
  \mark \markup{ \box{\fontsize #4 C}}
  g8 d b g'd a'
  g d b c4 d8
  e8 g e d c b
  c4 b8 a4 g8 \break
  g'8 d b g'd a'
  g d b c4 b8
  c b a d c b
  a4. a4 fs'8 \break
  g8 d b g'd a'
  g d b c4 d8
  e8 g e d c b
  c4 b8 a4 g8 \break
  b g d d c' g 
  e e e' d b g
  b g g b'a g
  a2.
  
  \bar "|."
}

chrdStrophe = \chordmode {
  g2. c4. d s c4 g8 s2.
  c g a:m d
  c d e:m b:m e:m c4 g4 s4 a4.:m g d2. d
  g s c d g s4.d c g d2.
  g s c d
  g a4.:m g s c d
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    ragged-last-bottom = ##f
  }
  \bookItem
  \header{
    subtitle = "Jig |AABBC|"
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
  
