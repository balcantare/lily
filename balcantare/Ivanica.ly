\version "2.22.2"
sheetName = "Ivanica"
\include "../include/book.ily"

\language "english"

skipA=\repeat unfold 40 { \skip 8 }
lyrStropheA = {
  \lyricmode {
    \skipA
    \set stanza = #"1. "
    Vi  -- e se vi -- e o -- ro 
    Ma _ -- ke -- dons  -- ko 
    \set stanza = #"1. "
    Go -- lern so -- bor
    mi -- se so -- brai kraj _ Va _ -- re -- da -- rot. 
    O -- o -- tci  pe  -- se -- na. 
    son -- ce i lju  -- bov.
    to -- o -- va c  na _  -- sa
    Ma -- ke -- do _ -- ni _ -- ja
  }
}
lyrStropheB = {
  \lyricmode {
    \skipA
    \set stanza = #"2. "
    Siot na -- rod
    se na -- so -- bral Ma _ -- ke -- dons -- ki 
    \set stanza = #"2. "
    Pre -- gr -- na -- til
    brat -- ski da se raz _ -- re _ -- se _ -- lat.
}}
lyrStropheC = {
  \lyricmode {
    \skipA
    \set stanza = #"3. "
    Dali gle -- das, mi -- lo Sko -- pje,
    da _ -- li slu -- sas 
    \set stanza = #"3. "
    Kak -- va Ma -- ke -- dons -- ka pes -- na
    se _ pe _ -- e _ e.
}}
strophe = \relative c'' {
  \voiceOne
  %\partial 4
  \accidentalStyle neo-modern %-voice-cautionary
  \time 7/8
  \key c \major
   \mark \markup{ \box{\fontsize #3 A}}
   \bar ".|:"
   \repeat volta 2 {
     c8[ d e] e[ d] c4
     e8[ f g] g[ f] e4
     g8[ a b] b[ a] a[ g]
     g4.~ g2
     g8[ a b] b[ a] a[ g]
     g4 a8 g8[ f] f[ e]
     f4 g8 e[ d] d[ c]
     c4.~ c2-\markup{fine}

     } \break
   \mark \markup{ \box{\fontsize #3 B}}
   \repeat volta 2 {
     c4. b4 c
     d c8 b4 a
     g4 a8 c4 c
     b4.~ b2
     c4 c8 b4 c
     d c8 b4 a
     g4 a8 g8[ f] f[ e]
     e4.~ e2
     } \break
   \mark \markup{ \box{\fontsize #3 C}}
   \repeat volta 2 {
     e'4 d8 c2
     d4 c8 b2
     c4. b4 c
     a4. g2
     c4 b8 a4 a
     b4 a8 g2
     a4 a8 g[ a] f[ e]
     e4.~ 2
   }
   \mark \markup{ \box{\fontsize #3 D}}

   \repeat volta 2 {
     \key c \minor
     c'8[ d ef] ef[\prall d] d[\prall c]
     c[ a c] b4\prall b8[ g]
     c8[ d ef] ef[\prall d] d[\prall c]
     g'8[ af g] f[\prall ef] ef[\prall d]
     c8[ d ef] ef[\prall d] d[\prall c]
     c[ a c] b4\prall b8[ g]
     f'8[ ef d] d[ ef] d[ ef]
     d[ c c] c2
   }
  %\bar "|."
}

stropheAlt = \relative c' {
  \voiceTwo
     e8[ f g] g[ f] e4
     g8[ a b] b[ a] g4
     b8[ c d] d[ c] c[ b]
     b4. b2
     b8[ c d] d[ c] c[ b]
     b4 c8 b[ a] a[ g]
     a4 b8 g[ f] f[ e]
     e4.~ e2
     
   a4. g4 a
   b4 a8 g4 f
   e4 f8  a4 a 
   g4.~ 2
   a4 a8 g4 a
   b4 a8 g4 f
   e4 f8 e8[ d] d[ c]
   c4.~ 2

   c'4 b8 a2
   b4 a8 g2
   a4. g4 a
   f4. e2
   a4 g8 f4 f
   g4 f8 e2
   f4 f8 e8[ f] d[ c]
   c4.~ 2
   
   ef8[ f g] g[\prall f] f[\prall ef]
   fs[ ef fs] g[ d] g[ f]
     ef8[ f g] g[\prall f] f[\prall ef]
     d8[ c' bf] af[\prall g] g[\prall f]
     ef8[ f g] g[\prall f] f[\prall ef]
     fs[ ef fs] g[ d] g4
     af8[ g f] f[ g] f[ g]
     f[ ef ef] ef2
}

chrdStrophe = \chordmode {
  c4. s2 
  s4. s2
  g4. s2
  s4. s2
  g4. s2
  s4. s2
  f4. s2
  c4. s2
  
  a4.:m s2
  g4. s2
  s4. s2
  s4. s2
  a4.:m s2
  g4. s2
  c4. g2
  c4. s2

  a4.:m s2
  g4. s2
  f4. s2
  d4.:m c2
  f4. s2
  c4. s2
  f4. g2
  c4. s2
   
  c4.:m s2
  d4.:7 g2:7
  c4.:m s2
  g4.:7 s2
  c4.:m s2
  d4.:7 g2:7
  f4.:m s4 g:7
  c4.:m s2
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.2))
  }
  \header {
    title = \sheetName
  }
  \tocItem \markup \sheetName
  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 24)
  }
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff <<
      \new Voice = "Strophe" { \strophe }
      \new Voice = "StropheAlt" { \stropheAlt }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrStropheA
    \new Lyrics \lyricsto "Strophe" \lyrStropheB
    \new Lyrics \lyricsto "Strophe" \lyrStropheC  
    >>
  }
}
