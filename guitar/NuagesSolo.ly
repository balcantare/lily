\version "2.24.2"
sheetName = "Nuages (Solo Melody)"
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
  \repeat volta 2 {
  cs8 d a'\2 af\2 g\2 gs\2
  
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
  } \alternative {
    { s2 s4 }
    { s2 s4 }
  }
  \break
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
  <b,-4 d-1 g-3 b-2>4_\markup{\hspace #4 \fret-diagram-terse "x;x;9;7;8;7;"}
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
}

  
lower = \relative c {
  \override Fingering.font-size = #-3
   \voiceTwo
   s2.
   \set fingeringOrientations = #'(left)
   s2 <ef-3>2
   s a,-3
   s 
   b'4 fs 
   d 
   d fs b
   s2.
   s2 c,2-1
   s1
  \set TabStaff.minimumFret = #7 
   <b'-3 e-4 g-2>2_\markup{\fret-diagram-terse "x;x;9;9;8;7;"}
   <b-4 ef-2 g-3>_\markup{\fret-diagram-terse "x;x;9;8;8;7;"}
   
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
  s1 s2.
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
}

\bookpart {
  \paper {
    page-count = #1
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
      \omit Voice.StringNumber 
    }
  }
}
