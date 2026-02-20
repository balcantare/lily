\version "2.24.2"
sheetComposer = "Wouter Kuyper"
sheetName = "Wals voor de Wilgen"
\include "../include/book.ily"

strophe = \relative c'' {
  \time 3/4
  \key e \minor
  \accidentalStyle neo-modern-voice-cautionary
  \bar ".|:" 
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 A}}
  e4. b8 g e'
  d b fs2
  d'8 a fs d' a fs
  c'4 c b \break
  e4. b8 g8 e'
  d8 b fs2
  d'8 a fs d' a fs
  } \alternative {
    { e2 g4 }
    { e2. }
  }
  \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #4 B}}
    e8 g c e, g c
    b2 a4 a4. a8 g fs
    g fs e2 \break
    e8 g c e, g c
    b c b a g b
    a4 g fs
    e2.
  } 
  \bar "|."
}

chrdStrophe = \chordmode {
  e2.:m b:m d c e:m b:m d c e:m
  c g d a:m9 c g d e:m
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.4))
    ragged-last-bottom = ##t
  }
  \bookItem
  \header{
    subtitle = "Wals |AABB|"
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
  
