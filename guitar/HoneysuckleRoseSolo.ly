\version "2.24.2"
sheetName = "Honeysuckle Rose  (for Solo Guitar)"
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
  \key f \major
  %\bar ".|:"
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #9
  \bar ".|:"
  \mark\markup{ \box{\fontsize #3 I}}
  \repeat volta 2 {
    \set TabStaff.minimumFret = #9  
    <b f' af>8 8 
    \set TabStaff.minimumFret = #8    
    <bf e g>4
    \set TabStaff.minimumFret = #6
    <af d f>4   
    \set TabStaff.minimumFret = #3
    <f bf d>4
    \set TabStaff.minimumFret = #5
    <a c f>4
    \set TabStaff.minimumFret = #3
    <f bf d>8
    \set TabStaff.minimumFret = #5
    <a c f>8~ 4
   \set TabStaff.minimumFret = #9  
    <b f' af>8 8~ 8 8 
    \set TabStaff.minimumFret = #8    
    <bf e g>4
    \set TabStaff.minimumFret = #6
    <af d f>4   
    \set TabStaff.minimumFret = #3
    <f bf d>4
    \set TabStaff.minimumFret = #5
    <a c f>4
    \set TabStaff.minimumFret = #3
    <f bf d>8
    \set TabStaff.minimumFret = #5
    <a c f>8~ 4 4
  }
  r4 a'4 bf4 b
  \break
  \voiceOne
  c8 bf d, f a2
  c8 bf d, f a2
  c8 bf d, f a4 4
  a2 a8 g\2 f d\3
  \set TabStaff.minimumFret = #1
  f4\1 f\1 2
  s2 a8 g\2 f d\3
  f1 s1
  \bar "|."
}
    
lower = \relative c' {
  \override Fingering.font-size = #-3
  s1*5
  \voiceTwo
  \set TabStaff.minimumFret = #6    
  <bf~ d g~>8 <bf g'>8  d4
  \set TabStaff.minimumFret = #3
  <g, bf e >4 
  \set TabStaff.minimumFret = #1
  <c, e bf' c>4
  \set TabStaff.minimumFret = #6    
  <bf'~ d g~>8 <bf g'>8  d4
  \set TabStaff.minimumFret = #3
  <g, bf e>4
  \set TabStaff.minimumFret = #1
  <c, e bf' c>4
  <bf'~ d g~>8 <bf g'>8  d4
  \set TabStaff.minimumFret = #3
  <g, bf e>4 4
  <g c e>4 
  <g, f' bf d>
  <g' c e>4 s4
  \set TabStaff.minimumFret = #0 
  <f, d' a' c>2
  <fs ef' a c>
  \set TabStaff.minimumFret = #3
  <g f' bf d>2
  <g' c e>4 s4
  \set TabStaff.minimumFret = #0 
  <f, d' a' c>2
  \set TabStaff.minimumFret = #3
  <a f' c' e>
  <a g' c  ef>
  <d fs c' d>
  
}

chrdStrophe = \chordmode {
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
