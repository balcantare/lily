\version "2.24.0"
sheetName = "Möge die Straße - Irischer Reisesegen"
#(define book-staff-size 20)
\include "../include/book.ily"

lyrA = {
  \lyricmode {
  \set stanza = "1. "
  Mö -- ge die Stra -- ße uns zu -- sam -- men
  füh -- ren 
  \set stanza = "1. "
  und der Wind in dei -- nem Rü -- cken sein.
  Sanft fal -- le Re -- gen 
  \set stanza = "1. "
  auf dei -- ne Fel -- der und warm auf dein
  Ge -- sicht der Son -- nen -- schein.
  
  Und bis wir uns wie -- der -- se -- hen,
  hal -- te Gott dich fest in sei -- ner Hand
  und bis wir uns wie -- der -- se -- hen,
  hal -- te Gott dich fest in sei -- ner Hand.
  
  }}
lyrB = {
  \lyricmode {
  \set stanza = "2. "
  Füh -- re die Stra -- ße,
  die _ du _ gehst _ 
  \set stanza = "2. "
  im -- mer nur zu dei -- nem Ziel berg -- ab,
  hab, wenn es kühl wird,
  \set stanza = "2. "
  war -- me Ge -- dan -- ken _
  und den vol -- len Mond in dunk -- ler Nacht.
}}
lyrC = {
  \lyricmode {
  \set stanza = "3. "
  Bis wir _ uns dann wie _ -- der _ -- se -- hen,
  \set stanza = "3. "
  hof -- fe ich, daß Gott dich nicht ver -- läßt,
  Er hal -- te dich in 
  \set stanza = "3. "
  sei -- nen _ Hän -- den,
  doch drü -- cke sei -- ne Hand dich nicht zu
  fest.
   }}


sopran = \relative c'' {
  \voiceOne
  \override Rest.staff-position = #0
  \time 4/4
  \key f \major
  a4 a8 c g4 g
  f8 f f[ a] e4 e
  d8 e f[ bf] a g f[ a]
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  g2 r %\break
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  a4 a8 c g4 g 
  f4 f8 a e4 e8 e
  d8 e f[ bf] a g f[ e]
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  f2 r \bar "||" \break
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  d4. f8 e4 g
  f a g bf
  a8 a a[ a] a g f[ a]
  g2 r \break
  a4 a8( c) g4 g
  f4 f8( a) e4 e
  d8 e f[ bf] a g f[ e]
  f2 r2
  \bar "|."
}

alt = \relative c' {
  \voiceTwo
  f4 f8 f e4 e
  d8 d d[ d] c4 c
  bf8 bf bf[ d] c c c[ d]
  e2 s
  f4 f8 f e4 e
  d4 d8 d c4 c8 c
  bf8 bf bf[ d] c c c[ c]
  c2 s
  bf4. d8 c4 c
  c4 f e e
  f8 f f[ f] f e d[ f]
  e2 s
  f4 f e4 e
  d4 d c c
  bf8 bf bf[d] c c c[ c]
  c2 s
}

bass = \relative c {
  \clef "bass"
  \voiceTwo
  \override Rest.staff-position = #0
  \key f \major
  f4 f8 f e4 e
  d8 d d[ d] c4 c
  bf8[ c] d bf c[ c] c c
  c2 r
  f4 f8 f e4 e
  d8 d d[ d] c4 c
  bf8[ c] d bf c[ c] c c
  f2 r
  bf,4. d8 c4 e
  f f c c
  f8 f f[ f] g[ g] g g
  c,2 r
  f4 f e e 
  d d c c
  bf8 c d[ bf] c c c[ c]
  <f f,>2 r
}

tenor = \relative c' {
  \voiceOne
  c4 c8 a c4 c
  a8 a a[ f] a4 4
  f8 f f[ f] f g a[ f]
  c'2 s
  c4 c8 a c4 c
  a4 a8[ f] a4 8 8
  f8 f f[ f] c' bf a[ g]
  a2 s
  f4. bf8 g4 c
  a c c c
  c8 c c[ c] b b  b[ b]
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  c2 s
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  c4 c8 a c4  c
  a a8[ f] a4 a
  f8[ f] f f c'[ bf] a g
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  a2 s
}

chrd =  \chordmode {
  f2 c d:m a:m
  bf f:/c c1
  f2 c d:m a:m
  bf f8:/c \startParenthesis \parenthesize 
  g:m  
  \endParenthesis \parenthesize f
  c
  f1
  bf2 c
  f c
  f g:7
  c1
  f2 c
  d:m a:m
  bf f8:/c \startParenthesis \parenthesize 
  g:m  
  \endParenthesis \parenthesize f
  c
  f1
  
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1.1))
    ragged-last-bottom = ##f
  }
  \bookItem
  \score {
    <<
    \new ChordNames \chrd 
    \new Staff <<
      \new Voice = "Sopran" \sopran 
      \new Voice \alt 
      >>
    \new Lyrics \lyricsto "Sopran" \lyrA
    \new Lyrics \lyricsto "Sopran" \lyrB
    \new Lyrics \lyricsto "Sopran" \lyrC
    \new Staff <<
      \new Voice \bass
      \new Voice \tenor
      >>
    >>
    \layout {
      #(layout-set-staff-size 20)
    }
  }
}
