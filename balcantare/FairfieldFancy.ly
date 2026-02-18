\version "2.24.2"
sheetName = "Fairfield Fancy"
sheetComposer = "Paddy on the Turnpike USA"
\include "../include/book.ily"

strophe = \relative c' {
  %\autoBeamOff
  \accidentalStyle modern-voice-cautionary
  \time 2/4
  \partial 8
  \key e \minor
  \mark \markup{ \box{\fontsize #4 A}}
  \bar ".|:"
  \repeat volta 2 {
     r8
     b16 e e ds e8 e16 fs
     g e b' e, c' e, b' e,
     a, d d cs d8 d16 e
     fs d a' d, b' d, a' d,
     b e e ds e8 e16 fs
     g fs g a b a g b
     d e d b a g e fs 
     g e fs d e8
  } \break
   \mark \markup{ \box{\fontsize #4 B}}
   \repeat volta 2 {
     b'16 b
     b e e ds e8 e16 fs
     g e fs e g e fs e
     a, d cs e d8 d16 e
     fs d e d fs d e d
     b e ds fs e8 e16 fs
     g e fs e g e fs e
     d e d b a g e fs
     g e fs d e8
   } 
   \break
    %\bar "|."
}


chrdStrophe = \chordmode {
  s8
  e2:m s d s
  e:m s g4 b:7 e8:m b:7 e:m s
  e2:m s d s
  e:m s g4 b:7 e8:m b:7 e:m s
}

\bookpart {
  \paper {
    page-count = #1
    %ragged-last-bottom = ##f
    #(define fonts (book-font 1.4))
  }
  \bookItem
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 20)
  }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe"  \strophe
      >>
    >>
  }
}
