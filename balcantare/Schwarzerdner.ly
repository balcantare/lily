\version "2.24.2"
sheetName = "Schwarzerdner"
\include "../include/book.ily"

strophe = \relative c' {
  \autoBeamOff
  \accidentalStyle modern-voice-cautionary
  \partial 4
  \time 3/4
  \key f \major
  \mark \markup{ \box{\fontsize #4 A}}
  \bar ".|:"
  \repeat volta 2 {
     c4
     f4 f8[ e] f[ g]
     a2 f4 
     g4 g8[ f] g[ a] 
     bf2 \break g4
     a4 a8[ g] a[ bf]
     c4 bf a 
     g8[ a] g[ f] e[ g]
     f2
     } \break
   \mark \markup{ \box{\fontsize #4 B}}
   \repeat volta 2 {
     a8[ bf] 
     c[ b] c[ a] d[ c]
     bf2 g8[ a]
     bf8[ a] bf[ g] c[ bf]
     a2 \break 
     f8[ g] 
     a[ bf] a[ g] a4
     bf2 a4
     g8[ a] g[ f] e[ g]
     f2
   } \break
   \mark \markup{ \box{\fontsize #4 C}}
   \repeat volta 2 {
     f8[ g]
     a2 bf4
     c2 d4
     g,8[ g] c2
     bf8[ a] g[ a] f4 
     \break
     a2 bf4
     c2 d4
     g,8[ g] c2
     f,2
   }
    %\bar "|."
}

stropheB = \relative c' {
  \accidentalStyle modern-voice-cautionary
  \key f \major
  c4 
  f4 f8[ e] d[ e]
  f2 g4 
  e4 e8[ d] c[ d]
  e2 c4
  f8[ f] e[ d] e4
  f4 g a
  c,8[ d] e[ f] g[ e] 
  f2
  f8[ g] 
  a[ g] a[ f] bf[ a]
  g[ f] e[ d] c4
  c d e
  f8[ e] d[ c] e4
  f4 e f
  g2 bf4
  c,4 d e
  f2
  d4 
  f2 g4
  a2 bf4
  c,4 d2
  f8[ e] f[ g] a4
  f2 g4
  a2 bf4
  e,4 c e
  f2
}

chrdStrophe = \chordmode {
  s4
  f2. d:m c s
  f d:m c f 
  f c s f d:m bf c f
  f2 bf4 f2. c f f2 bf4 f2. c f2
}

\bookpart {
  \paper {
    #(set-global-staff-size 20)
    page-count = #1
    ragged-last-bottom = ##f
    #(define fonts (book-font 1.2))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe"  \strophe
      >>
    \new Staff <<
      \new Voice = "StropheB" \stropheB
    >>
    >>
  }
}
