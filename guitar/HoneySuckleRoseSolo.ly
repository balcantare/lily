\version "2.24.2"
sheetName = "Nuages (for Solo Guitar)"
sheetComposer = "Django"
#(define book-staff-size 20)
\include "../include/book.ily"
%\include "fret-diagrams-modified.scm"

reversedDownbowMarkup =
\markup \rotate #180 \musicglyph #"scripts.downbow"
reversedUpbowMarkup =
\markup \rotate #180 \musicglyph #"scripts.upbow"
dotsMarkup = 
\markup {\musicglyph #"dots.dot" \musicglyph #"dots.dot"  \musicglyph #"dots.dot"}

#(define tab-script-alist default-script-alist)
#(define staff-script-alist default-script-alist)

#(set! tab-script-alist 
       (acons 
        'downstroke
        `((stencil . ,(lambda (grob)
           (grob-interpret-markup
            grob reversedUpbowMarkup)
           ))
          (avoid-slur . ignore)
          (direction . ,DOWN)
          (padding . 0.20)
          (script-priority . 150))
        tab-script-alist))

#(set! staff-script-alist
       (acons 'downstroke `((stencil . #f) (avoid-slur . ignore) (direction . ,DOWN)) 
        staff-script-alist))

downstroke = #(make-articulation 'downstroke)

#(set! tab-script-alist 
       (acons 
        'upstroke
        `((stencil . ,(lambda (grob)
           (grob-interpret-markup
            grob reversedDownbowMarkup)
           ))
          (avoid-slur . ignore)
          (direction . ,DOWN)
          (padding . 0.50)
          (script-priority . 150))      
        tab-script-alist))

#(set! staff-script-alist
       (acons 'upstroke `((stencil . #f) (avoid-slur . ignore) (direction . ,DOWN)) 
        staff-script-alist))

upstroke = #(make-articulation 'upstroke)

#(set! tab-script-alist 
       (acons 
        'dots
        `((stencil . ,(lambda (grob)
           (grob-interpret-markup
            grob dotsMarkup)
           ))
          (avoid-slur . ignore)
          (direction . ,DOWN)
          (padding . 0.75)
          (script-priority . 150))      
        tab-script-alist))

#(set! staff-script-alist
       (acons 'dots `((stencil . #f) (avoid-slur . ignore) (direction . ,DOWN)) 
        staff-script-alist))
% do no tprint fermata in tabulature
#(set! tab-script-alist
       (acons 'fermata `((stencil . #f) (avoid-slur . ignore) (direction . ,DOWN))
        tab-script-alist))

dots = #(make-articulation 'dots)

"ds" = #downstroke
"us" = #upstroke
upper = \relative c' {
  %\omit Script
  %\voiceOne
  \override Fingering.font-size = #-3
  \accidentalStyle modern
  \time 4/4
  \key g \major
  %\bar ".|:"
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #2
  \partial 2.
  \bar ".|:"
  \mark\markup{ \box{\fontsize #3 A}}
  \repeat volta 2 {
  cs8-1 d-2 a'-4\2 af-3\2 g-2\2 gs-1\2
  
  \voiceOne
  \override TieColumn.tie-configuration = #'((-7 . 0) )
      <bf,,-2~  g'-1 df'~-3 f~-4>2_\markup{\fret-diagram-terse "6;6;5;6;6;x;"} 
      <bf  df' f>4 
      \set fingeringOrientations = #'(down  up)
      <g'-1 df'-4 e-2>_\markup{\fret-diagram-terse "x;6;5;6;5;x;"}
    \override TieColumn.tie-configuration = #'((-2 . 1) )
      <d-3 fs-1~ c'-4~ ef-2~>2_\markup{\fret-diagram-terse "x;5;4;5;4;x;"}
      <fs c' ef>4
      <fs-2 c'-4 d-1>_\markup{\fret-diagram-terse "5;x;4;5;3;x;"}
      <g,_\thumb d'-4 fs-2 b-3 d-1>2\laissezVibrer_\markup{\hspace #4 \fret-diagram-terse "3;5;4;4;3;x;"}
     s2.
  } 
  %\alternative {
  %  { s2 s4 }
  %  { s2 s4 }
  %}
  \break
  \mark\markup{ \box{\fontsize #3 B}}
  bf'8-1 b-2 \acciaccatura g'-1 b-1 a\2-4 g\2-2 fs\2-1
  \set TabStaff.minimumFret = #7
  \override TieColumn.tie-configuration = #'()
  <fs,-1 c'~-3 e~-2 a~-4>2_\markup{\fret-diagram-terse "x;9;10;9;10;x;"} 
  <c' e a>4_\markup{\hspace #2 \fret-diagram-terse "8;x;x;9;8;x;"}
  <e-5 g-4>
  \set TabStaff.minimumFret = #6
  <b, a' ds fs>_\markup{\hspace #1 \fret-diagram-terse "7;x;7;8;7;x;"}
  \set TabStaff.minimumFret = #3
  bf'8-1 b-2 \acciaccatura g'-1 b-1 a\2-4 g\2-2 fs\2-1
  \set TabStaff.minimumFret = #7
  \tuplet 3/2 {r4 b-1\laissezVibrer g}
  \tuplet 3/2 {r4 b-1\laissezVibrer g}
  <b,-4 d-1 g-3 b-2>4_\markup{\hspace #0 \fret-diagram-terse "x;x;9;7;8;7;"}
  \break
  \set TabStaff.minimumFret = #5
  fs'8-1 g-2 \acciaccatura a-1 b-1 a\2-4 g-2 f-1
  <a,, g' cs e>2_\markup{\fret-diagram-terse "5;x;5;6;5;x;"}
  \set TabStaff.minimumFret = #4
  \tuplet 3/2 {<af gf' c ef>4_\markup{\hspace #0 \fret-diagram-terse "4;x;4;5;4;x;"} 4 4}
  <a g' cs e>4_\markup{\hspace #0 \fret-diagram-terse "5;x;5;6;5;x;"}
  e''8-1 fs-1
  \set TabStaff.minimumFret = #7
  g a
  \tuplet 3/2 {b-1 d-1 f}
  <c, fs a d>2_\markup{\hspace #0 \fret-diagram-terse "x;x;10;11;10;10;"}
  \tuplet 3/2 {<df g bf ef>4_\markup{\hspace #1 \fret-diagram-terse "x;x;11;12;11;11;"} 4 4}
  <c fs a d>4_\markup{\hspace #0 \fret-diagram-terse "x;x;10;11;10;10;"}
  \bar "||"
  s4*3^\markup{ \box{\fontsize #4 A}} 
  \bar "||"
  \break
  \mark\markup{ \box{\fontsize #3 C}}
  \set Timing.measurePosition = #(ly:make-moment 1/4)
  fs8 g d' df c b
  \set TabStaff.minimumFret = #5
  <af,-2 c-1 gf'-4 bf-3>2_\markup{\hspace #0 \fret-diagram-terse "x;x;6;5;7;6;"}\laissezVibrer
  s4 <gf-2 c-3 a'-4>4
  <f b af'>2~_\markup{\hspace #0 \fret-diagram-terse "3;x;3;4;x;4;"} 4
  <f-2 b-4 g'-3>4_\markup{\hspace #0 \fret-diagram-terse "3;x;3;4;x;3;"}
  \set TabStaff.minimumFret = #2
  <c-2 e-1 b'-4 g'~-3>2_\markup{\hspace #0 \fret-diagram-terse "x;3;2;4;x;3;"} 
  g''2-1~_\markup{\hspace #0 \fret-diagram-terse "x;x;5;4;5;3;"}
  g4 \break
  fs,8-1 g-2 \acciaccatura e'-3 g-3\2 f-1 ef-3\3 f-1
  \set TabStaff.minimumFret = #7
  <c, a' ef' g>2_\markup{\hspace #0 \fret-diagram-terse "8;x;7;8;8;x;"}
  \set TabStaff.minimumFret = #5
  ef'8 d c d 
  <a, g' c>4_\markup{\hspace #0 \fret-diagram-terse "5;x;5;5;x;x;"} 
  fs'8\4-1 g-2 \acciaccatura e'-3 g-3 f-1 ef-3 f-1
  <fs,-3 b-4 d-1 g-2>4_\markup{\hspace #0 \fret-diagram-terse "x;9;9;7;8;x;"}
  \set TabStaff.minimumFret = #3
  b16-2 c-3 b c
  <d,-4 fs-2 b-3 d-1>2_\markup{\hspace #0 \fret-diagram-terse "3;5;4;4;3;x;"}
  r4
  \break
  \mark\markup{ \box{\fontsize #3 A'}}
   cs'8-1 d-2 a'-4\2 af-3\2 g-2\2 gs-1\2
  
  
  \override TieColumn.tie-configuration = #'((-7 . 0) )
      <bf,,-2~  g'-1 df'~-3 f~-4>2_\markup{\fret-diagram-terse "6;6;5;6;6;x;"} 
      <bf  df' f>4 
      \set fingeringOrientations = #'(down  up)
      <g'-1 df'-4 e-2>_\markup{\fret-diagram-terse "x;6;5;6;5;x;"}
    \override TieColumn.tie-configuration = #'((-2 . 1) )
    <d-3 fs-1 c'-4 ef-2>2_\markup{\fret-diagram-terse "x;5;4;5;4;x;"}
    <a-4 fs'-2 c'-4 d-1>4_\markup{\fret-diagram-terse "5;x;4;5;3;x;"}
    <d' fs b>_\markup{\fret-diagram-terse "x;x;x;7;7;7;"}
    \set TabStaff.minimumFret = #7
    <b-3 d-1 g-2>2_\markup{\fret-diagram-terse "x;x;x;9;7;8;"}
    \tuplet 3/2 {g'4-1 a-4 g-1}
    <fs-2 b-3 d-1>2_\markup{\hspace #0 \fret-diagram-terse "x;x;x;11;12;10;"}
    \set TabStaff.minimumFret = #3
    <g,,_\thumb fs'-3 b-4 d-1 g-1>2_\markup{\hspace #0 \fret-diagram-terse "3;x;4;4;3;3;"}
   \bar "|."
}

  
lower = \relative c {
  \override Fingering.font-size = #-3
   \voiceTwo
   s2.
   \set fingeringOrientations = #'(left)
   s2 <ef-3>2
   s a,-3
   s 
   \tieUp
   b'4~ <fs~ b~>
   <g, fs' b> 
   % d' fs b
   s2.
   s2 c2-1
   s1
   \set TabStaff.minimumFret = #7 
   <b'-3 e-4 g-2>2_\markup{\fret-diagram-terse "x;x;9;9;8;7;"}
   <b-4 ef-2 g-3>_\markup{\fret-diagram-terse "x;x;9;8;8;7;"}
   s1*5 s2. 
   \set TabStaff.minimumFret = #3
   s2 af,2-1_\markup{\hspace #0 \fret-diagram-terse "4;x;4;5;x;5;"}
   s2 g2
   \set fingeringOrientations = #'(down)
   s2 e''4~-4 <b~-2 e~>4
   \override TieColumn.tie-configuration = #'((4 . 1) (1 . 1 ) )
   <g-3 b e>4 s2.
   s1*2 
   s2. g,4(_\thumb
   4) s4 s2
   \set fingeringOrientations = #'(left)
   s2 <ef'-3>2
   s1 
   s2 <c'-3 ef-1>2_\markup{\fret-diagram-terse "x;x;10;8;8;x;"}
}
  
     %{ <g d' g bf d>4\ds_\markup{\fret-diagram-terse "3;5;5;3-(;3-);x;"} 4\dots
  <bf ef g df' ef>4_\markup{\fret-diagram-terse "6-(;6-);5;6;4;x;"} 4
  <af ef' gf c ef>4_\markup{\fret-diagram-terse "4;6;4;5;4;x;"} 4
  <a d fs c' d>4_\markup{\fret-diagram-terse "5-(;5-);4;5;3;x;"} 4
  <g d' g bf d>4_\markup{\fret-diagram-terse "3;5;5;3-(;3-);x;"} 4
  <bf ef g df' ef>4_\markup{\fret-diagram-terse "6-(;6-);5;6;4;x;"} 
  <af ef' gf c ef>4~_\markup{\hspace #1 \fret-diagram-terse "4;6;4;5;4;x;"} 4
  <bf ef g df' ef>4_\markup{\fret-diagram-terse "6-(;6-);5;6;4;x;"} 
   <a d fs c' d>4_\markup{\fret-diagram-terse "5-(;5-);4;5;3;x;"} 
  %}
  
  
chrdStrophe = \chordmode {
  s2.
  ef2.:9 ef4:9-
  d2.:9- d4:7
  g1:7+
  s1
  fs2:m5-7
   \set chordBassOnly = ##t
   fs4:m5-7/c c4
  b1:7
  e2:m
  b:5+
   \set chordBassOnly = ##f 
  g1:/b
  a2:7
  af:7
  a1:7
  d2:7
  ef:7
  d1:7
  s2.
  af2.:9
  af4:9-
  g2.:9-
  g4:7
  c1:7+
  s1
  c:m6
  s1
  g:7+ s
  ef2.:9 ef4:9-
  d2:9- d4:7 d:6
  g2 c:m g:7+
  
}

\bookpart {
  \paper {
    page-count = #2
    #(define fonts (book-font 1))
    ragged-last-bottom = ##t
  }
  \bookItem 
  \score {
    <<
    \new ChordNames { \chrdStrophe }
    \new Staff \with {
      scriptDefinitions = #staff-script-alist
      \override TextScript.fret-diagram-details.number-type = #'arabic
      \override TextScript.fret-diagram-details.label-dir = #LEFT
      \override TextScript.fret-diagram-details.barre-type = #'straight
      \override TextScript.fret-diagram-details.dot-radius = #0.35
      \override TextScript.fret-diagram-details.fret-label-font-mag = #0.7
      \override TextScript.fret-diagram-details.fret-count = 3
      \override TextScript.fret-diagram-details.label-bass-fret = ##t  
    } <<
     \clef "G_8" 
     \new Voice = "upper" \upper
     \new Voice = "lower" \lower
      >>
    \new TabStaff \with {
      scriptDefinitions = #tab-script-alist  
    }<< \tabChordRepeats 
       \revert TabStaff.Script.stencil
       \new TabVoice = "upper" \upper
       \new TabVoice = "lower" \lower
    >>  
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 20) 
      \omit Voice.StringNumber 
    }
  }
}
