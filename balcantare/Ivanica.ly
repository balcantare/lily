\version "2.22.2"
sheetName = "Ivanica"
\include "../include/book.ily"

strophe = \relative c'' {
  \voiceOne
  %\partial 4
  \accidentalStyle neo-modern %-voice-cautionary
  \time 7/8
  \key g \major
   \mark \markup{ \box{\fontsize #3 A}}
   \bar ".|:"
   \repeat volta 2 {
     g8[ a b] b[ a] g4
     b8[ c d] d[ c] b4
     d8[ e fs] fs[\prall e] e[\prall d]
     d4. d2
     fs8[ g a] a[\prall g] g[\prall fs]
     fs4 g8 fs[\prall e] e[\prall d]
     e4 fs8 d[\prall c] c[\prall b]
     b4. b2-\markup{fine}

     } \break
   \mark \markup{ \box{\fontsize #3 B}}
   \repeat volta 2 {
     g'4 g8 fs4 g
     fs4 e8 d4 c
     b4 c8 e4 e8[ d]
     d4. d2
     e4 e8 ds4 e
     d4 c8 b4 a
     b4 c8 b[ a] a[ g]
     g4. g2
     } \break
   \mark \markup{ \box{\fontsize #3 C}}
   \repeat volta 2 {

     g'4 fs8 e4 e8[ b]
     fs'8[ d fs] e4 e8[ b]
     g'[ d fs] e4 e8[ b]
     fs'[ d fs] e2
     g4 fs8 e4 e8[ g]
     fs4 e8 d2
     e4 e8 d[ e] c[ d]
     b4. b2 }
   \mark \markup{ \box{\fontsize #3 D}}

   \repeat volta 2 {
     \key g \minor
     g8[ a bf] bf[\prall a] a[\prall g]
     g[ e g] fs4\prall fs8[ d]
     g8[ a bf] bf[\prall a] a[\prall g]
     d'8[ ef d] c[\prall bf] bf[\prall a]
     g8[ a bf] bf[\prall a] a[\prall g]
     g[ e g] fs4\prall fs8[ d]
     c'8[ bf a] a[ bf] a[ bf]
     a[ g g] g2
   }
  %\bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
     b8[ c d] d[ c] b4
     g'8[ a b] b[ a] g4
     b8[ c d] d[\prall c] c[\prall b]
     b4. b2
     d8[ e fs] fs[\prall e] e[\prall d]
     d4 e8 d[\prall c] c[\prall b]
     c4 d8 b[\prall a] a[\prall g]
     g4. g2
   \language "english"

     e'4 e8 ds4 e
     d4 c8 b4 a
     g4 a8 c4 c8[ b]
     b4. b2
     c4 c8 b4 c
     b4 a8 g4 fs
     g4 e8 d[ c] c[ b]
     b4. b2
   b'4 a8 g[ e] g4
   a8[ fs a] g[ e] g4
   b4 a8 g[ e] g4
   a8[ fs a] g[\prall fs] fs[\prall e]
   e'4 d8 c4 c8[ e]
   d4 c8 b2
   c4 c8 b8[ c] a[ b]
   g4. g2

   bf,8[ c d] d[\prall c] c[\prall bf]
   cs[ bf cs] d[ a] d[ c]
     bf8[ c d] d[\prall c] c[\prall bf]
     a8[ g' f] ef[\prall d] d[\prall c]
     bf8[ c d] d[\prall c] c[\prall bf]
     cs[ bf cs] d[ a] d4
     ef8[ d c] c[ d] c[ d]
     c[ bf bf] bf2
}

chrdStrophe = \chordmode {
  g2. s8 s2. s8
  s4. c2
  g4. s2
  d4. s4 a:7
  d4. s4 g
  c4. d2:7
  g4. s2

  c4. s4 a:7
  d4.:7 s2
  g4. c2
  g4. s2
  c4. s2
  g4. s4 d:7
  g4. s4 d:7
  g4. s2

  e4.:m s2
  d4. e2:m s4. s2
  d4. e2:m
  c4. s2
  d4.:7 g2
  c4. d2:7
  g4. s2

  g4.:m
  s2
  a4.:7 d2:7
  g4.:m s2
  d4.:7 s2
  g4.:m s2
  a4.:7 d2:7
  c4.:m s4 d:7
  g4.:m s2
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.5))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    >>
  }
}
