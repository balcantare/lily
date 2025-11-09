\version "2.24.2"
sheetName = "Tele Glues"
sheetComposer = "Tapper Glue"
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
  \key e \major
  %\bar ".|:"
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #3
  \mark\markup{ \box{\fontsize #3 A}}
  r8 \acciaccatura ds8 e4 
  \acciaccatura ds8 e8 b8 8 g gs
  b8 cs4\3 b8 r2
  r8 \acciaccatura ds8 e4 
  \acciaccatura ds8 e8 b8 8 g gs
  b8 d4.\3  r2 \break
  r8 \acciaccatura cs8 e4 
  \acciaccatura cs8 e8 b8 8 g gs
  b8 cs4\3 e8 r2
  ds16( e ds8) b cs ds fs gs b 
  gs fs4. r2 \break
  \set TabStaff.minimumFret = #1
  r8 c8( cs) a b c\3 cs e c( cs4) a8
  r2 
  \set TabStaff.minimumFret = #3
  r8 \acciaccatura ds8 e4 
  \acciaccatura ds8 e8 b8 8 g gs
  b8 d4\3 cs8 r2 \break
  \set TabStaff.minimumFret = #6
  r8 \acciaccatura es8 fs4 \acciaccatura es8 fs8
  cs cs a b ds fs4. r2
  
  
\bar "|."
}
  
chrdStrophe = \chordmode {
  e1:7 s s s s s b:7 s a:7 s
  e:7 cs:7 fs:7 b:7
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    %ragged-last-bottom = ##t
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
      >>
    \new TabStaff \with {
      scriptDefinitions = #tab-script-alist  
    }<< \tabChordRepeats 
       \revert TabStaff.Script.stencil
       \new TabVoice = "upper" \upper
    >>  
    >>
    \layout { 
      \omit Voice.StringNumber 
    }
  }
}
