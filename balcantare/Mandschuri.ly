\version "2.24.2"
sheetName = "Mandschuri"
\include "../include/book.ily"

strophe = \relative c'' {
  %\autoBeamOff
  \accidentalStyle modern-voice-cautionary
  \time 3/4
  \partial 2
  \key g \minor
  \mark \markup{ \box{\fontsize #4 A}}
  \bar ".|:"
  \repeat volta 2 {
     r2 d2.~ d4 bf c
     d2.~ d4 r2
     c4 d fs
     bf2 a4 g2.~ g4 r2
     d4 g bf
     fs2 g4 a g ef
     a2 g4
     d g a 
     bf2 a4 g2.~ g4
  } \break
   \mark \markup{ \box{\fontsize #4 B}}
   \repeat volta 2 {
     d8 cs d ef
     d4 r8 a4.~
     a4 bf c
     d2.~ d4 f8 e f g
     f4 r8 c4.~ 
     c4 d ef
     f2.~ f4 f fs
     g2 d4~ d cs d
     f2 ef4~ ef bf c 
     d c bf
     a2 bf4 
     g2.~ g4
   } 
   s2^\markup{ \box{\fontsize #4 A}} \bar "" s4
   \break
   \mark \markup{ \box{\fontsize #4 C}}
   \repeat volta 2 {
     g'4 fs
     g2 af4
     g2 f4 
     f2 ef4
     ef d c
     f2 g4 f2 ef4
     ef d cs
     d2.
     g,4 bf d
     g bf a g f ef 
     g2 ef4
     bf d c
     a2 bf4
     g2.~ g4
   }
   s2^\markup{ \box{\fontsize #4 A}} \bar "" s4
   \bar "||"
}


chrdStrophe = \chordmode {
  s2 
  g2.:m s d s d:7 s g:m s
  g:m s c:m s g:m d:7 g:m s
  d:7 s g:m s f s bf d:7
  g:m s c:m s g:m d:7 g:m s s
  g g:7 c:m s f f:7 bf d:7
  g:m s c:m s g:m d:7 g:m
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
    #(layout-set-staff-size-with-jazz 24)
  }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe"  \strophe
      >>
    >>
  }
}
