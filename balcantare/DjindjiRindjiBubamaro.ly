\version "2.24.0"
sheetName = "Djindji Rindji Bubamaro"
sheetComposer = "Goran Bregovic"
\include "../include/book.ily"

lyrA = {
  \lyricmode {
   Sa ro -- ma -- len phu -- che -- na
   Bu -- ba -- ma -- ra so -- se ni che -- lel. __
   Dev -- la, dev -- la man -- gav la
   o' la -- ke me __ ka me -- rav.
   \repeat unfold 16 \skip 8
   \set stanza = "1. "
   Sa e Ro -- men pu -- che -- la,
   Bu -- ba -- ma -- ra so -- se  a -- che -- la,
   \set stanza = "1. "
   dev -- la dev -- la va -- car le,
   bu -- ba -- ma -- ra tu -- ka po -- ci -- nel.
   \set stanza = "1. "
   Ej ro -- ma -- len a -- shu -- nen,
   e cha -- vo -- ren gu -- gle zu -- ra -- le.
   \set stanza = "1. "
   Bu -- ba -- ma -- ra cha -- jo -- ri,
   ba -- ro Gr -- ga voj si o dji -- li __
   
   Djin -- dji rind -- ji Bu -- ba -- ma -- ro
   cik -- ni -- je shu -- zhi -- je
   aj -- de mo -- re koj ro -- me -- sa.
   Cha -- va -- le ro -- ma -- len 
   \repeat unfold 4 \skip 8
   Cha -- va -- len ro -- ma -- len 
   aj -- de te khe -- la
}}

lyrB = {
  \lyricmode {
    \repeat unfold 46 \skip 8
   \set stanza = "2. "
   Sa ro -- ma -- len pu -- che -- la,
   o de -- jo -- ri fu -- suj chu -- de -- la.
   \set stanza = "2. "
   Dev -- la dev -- la sa char -- le,
   Bu -- ba -- ma -- ru voj te a -- re -- sel.
   \set stanza = "2. "
   Ej ro -- ma -- len a -- shu -- nen,
   e cha -- vo -- ren gu -- gle shu -- ka -- ren,
   \set stanza = "2. "
   zi -- vo -- to si ring -- ish -- pil,
   Tra -- jo o del rom aj rom -- nj -- i __
}}

voice = \relative c'' {
  \time 4/4
  \key c \minor
   g4. af8 g4 fs 
   g ef c2 
   c'8 c c c c8 c4 c16 b 
   c4( af f2) 

   f'8 f4 ef8 d2 
   ef4. g,8 g4. g8 
   fs'8 ef d4~ d4. d16 ef 
   d2. r4  
   \bar "||"

   g,,8 c d ef g, c d ef 
   g,8 c d ef g, c d ef 
   \bar "||"

   g4. af8 g4 fs 
   g ef c2 
   c'8 c c~ c8 c  c b4 
   c4 af f2 
   af4. af8 g4 fs 
   g ef c2 
   d8 d d d d d4.
   g4 af g2 
   \bar "||" \break

   g4. af8 g4 fs 
   g ef c2 
   c'8 c c df c b4. 
   c4 af f2 
   af4. f8 d4 af' 
   g ef c2 
   d8 d d d d d4. 
   g4 af  g2~
   \newSpacingSection
   \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  g1 
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  
   %\bar "||"
   \break 
\repeat volta 2 {
   c,8 d ef f g fs g16 g8. 
   r8 c4 af8 
   \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  f2 
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  r8 g4 ef8 
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  c2
  \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  
   f8 ef d c b c d( ef) 
   \newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/1)
  
   c1
\newSpacingSection
  \override Score.SpacingSpanner.common-shortest-duration = #(ly:make-moment 1/8)
  }
\break 
\repeat volta 3 {
   c'8 c c4 c8 c c4 
   af8 af4. af8 af4. 
   }

  c8 c c4 c8 c c4 
  d8 d d d  cs4 r  
}

chrd = \chordmode {
  c1:m s c:7 f:m g:7 c:m d:7 g:7 c:m s
  c4:m \startParenthesis \parenthesize d:m \endParenthesis \parenthesize e:m s
  s1
  c4:7 \startParenthesis \parenthesize d:7 \endParenthesis \parenthesize e:7 s
  f:m \startParenthesis \parenthesize g:m \endParenthesis \parenthesize a:m s
  g:7 \startParenthesis \parenthesize a:7 \endParenthesis \parenthesize b:7 s
  c:m \startParenthesis \parenthesize d:m \endParenthesis \parenthesize e:m s
  d:7 \startParenthesis \parenthesize e:7 \endParenthesis \parenthesize fs:7 s
  g:7 \startParenthesis \parenthesize a:7 \endParenthesis \parenthesize b:7 s
  
  c4:m \startParenthesis \parenthesize d:m \endParenthesis \parenthesize e:m s
  s1
  c4:7 \startParenthesis \parenthesize d:7 \endParenthesis \parenthesize e:7 s
  f:m \startParenthesis \parenthesize g:m \endParenthesis \parenthesize a:m s
  g:7 \startParenthesis \parenthesize a:7 \endParenthesis \parenthesize b:7 s
  c:m \startParenthesis \parenthesize d:m \endParenthesis \parenthesize e:m s
  d:7 \startParenthesis \parenthesize e:7 \endParenthesis \parenthesize fs:7 s
  g:7 \startParenthesis \parenthesize a:7 \endParenthesis \parenthesize b:7 s
  s1
  
  c8:m \startParenthesis \parenthesize d:m \endParenthesis \parenthesize e:m s s2
  f8:m \startParenthesis \parenthesize g:m \endParenthesis \parenthesize a:m s s2
  c4:m \startParenthesis \parenthesize d:m \endParenthesis \parenthesize e:m s
  f8:m \startParenthesis \parenthesize g:m \endParenthesis \parenthesize a:m s
  g8:7 \startParenthesis \parenthesize a:7 \endParenthesis \parenthesize b:7 s
  c4:m \startParenthesis \parenthesize d:m \endParenthesis \parenthesize e:m s
  
  c4:m \startParenthesis \parenthesize d:m \endParenthesis \parenthesize e:m s
  b4:dim \startParenthesis \parenthesize df:dim \endParenthesis \parenthesize ef:dim s
  c4:m \startParenthesis \parenthesize d:m \endParenthesis \parenthesize e:m s
  e4:7 \parenthesize fs:7 
  a4:7 \parenthesize b:7 
  \bar "|."
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
  }
  \bookItem 

  \score {
  \layout {
    #(layout-set-staff-size-with-jazz 24)
  }
    <<
    \new ChordNames { \chrd }
    \new Staff <<
      \new Voice = "Strophe" { \voice }
      >>
    \new Lyrics \lyricsto "Strophe" \lyrA
    \new Lyrics \lyricsto "Strophe" \lyrB
    >>
  }
}
