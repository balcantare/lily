\version "2.24.2"
sheetName = "A day in the live of a Fool"
\include "../include/book.ily"

Lyrics = \lyricmode {
  %% part "A"
  A Day __ In The Life __ Of A Fool, __
  a sad __ and a long, __ lone -- ly day, __
  I walk the av -- e -- nue __ and hope I'll run in -- to __
  the wel -- come sight of you __ com -- ing my way. __

  %% part "A'"
  I stop __ just a -- cross __ from your door __
  but you're __ nev -- er home __ an -- y -- more. __
  So back to my room and there in the gloom
  I cry __ tears of good -- bye. __

  %% part "B"
  'Til you come back to me,
  that's the way it will be
  ev -- 'ry day in the life of a fool. __
}

strophe = \relative c' {
  \accidentalStyle modern
  \time 4/4
  \key a \minor
  %\mark \markup{ \box{A}} 
  \partial 2  r4 e4 |
  %% part "A"
  c'2~ \tuplet 3/2 { c4 b a } | a2~ \tuplet 3/2 { a4 gs b } | e,1~ | e2 r4 e4 |
  c'2~ \tuplet 3/2 { c4 b a } | a2~ \tuplet 3/2 { a4 g b } | e,1~ | e2 r8 e f g |
  a4. d,8 d2~ | d r8 d e f | g4. c,8 c2~ | c r8 c d e |
  f4. b,8 b2~ | b \tuplet 3/2 { b4 c d } | e1~ | e2 r4 
  \break 
  \once\override Score.RehearsalMark.self-alignment-X = #2
  \mark \markup{ \box{\fontsize #2 B}} e |
  %% part "A'"
  c'2~ \tuplet 3/2 { c4 b a } | a2~ \tuplet 3/2 { a4 gs b } | e,1~ | e2 r4 e4 |
  bf'2~ \tuplet 3/2 { bf4 a g } | g2~ \tuplet 3/2 { g4 f e } | a1~ | a |
  r4 d, \tuplet 3/2 { d e f } | b1 | r4 c, \tuplet 3/2 { c d e } | a2. g4 |
  e1~ | e2 \tuplet 3/2 { e4 gs b } | a1~ | a2
  %% part "B"
  \tuplet 3/2 { r4 a b } |
  \tuplet 3/2 { c d c } \tuplet 3/2 { b a b } | \tuplet 3/2 { c d c } \tuplet 3/2 { b a b } |
  \tuplet 3/2 { c d c } \tuplet 3/2 { b a g } | a1~ | a2. \bar "|."
}

chrdStrophe = \chordmode {
  \once\override Score.RehearsalMark.self-alignment-X = #2
  \mark \markup{ \box{\fontsize #2 A}}
  \partial 2 s2 |
  %	\myMark "A"
  a1:m | b2:m7.5- e:7.9- | a1:m | b2:m7.5- e:7.9- | %\break
  a1:m | d2:m7 g:7 | c1:maj7 | e2:m7.5- a:7.9- | %\break
  d1:m7 | g:7 | c:maj7 | f:maj7 | %\break
  b:m7.5- | e:7.9- | a:m | b2:m7.5- e:7.9- | %\break
  
  %\myMark "A'"
  a1:m | b2:m7.5- e:7.9- | a1:m | b2:m7.5- e:7.9- | %\break
  e1:m7.5- | a:7.9- | d1*2:m |%\break
  d2:m d:m/c |
  b:m7.5- e:7.9- | a:m a:m/g | f1:maj7 | %\break
  b:m7.5- | e:7 | a1:m | \startParenthesis \parenthesize b4:m5-7 \endParenthesis
  \parenthesize e4:7 \bar ":|." \break
  %\myMark "B"
  \once\override Score.RehearsalMark.self-alignment-X = #0
  %\once\override Score.RehearsalMark.Y-offset = #2
  \mark \markup{ \box{\fontsize #2 Coda}}
  s2 \noBreak
  d2:m7 \noBreak a:m7 \noBreak d:m7 a:m7  d:m7 e:m7 \noBreak a1:m6 \noBreak 
}

\bookpart {
  \paper {
    page-count = #1
    ragged-last-bottom = ##f
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
      >>
      \new Lyrics \lyricsto "Strophe" \Lyrics
    >>
  }
}
