\version "2.24.2"
sheetName = "Mazurka Choro"
sheetComposer = "Villa Lobos"
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

oben = \relative c' {
  \voiceOne
  \override Fingering.font-size = #-3
  \accidentalStyle modern
  \time 3/4
  \key a \minor
  \partial 4
  
  \bar ".|:"
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #3 A}}
  e4
  e4. a8\2-4 c-1 e-4 \glissando
  b2.-4
  e,4. 
  \set TabStaff.minimumFret = #3
  gs8-1 b-4 \glissando d-4
  \set TabStaff.minimumFret = #7
  \set fingeringOrientations = #'(left up)
  <e,-3 c'-2>4. <d b'>8
  \set TabStaff.minimumFret = #5
  <c e a>4 
  \set TabStaff.restrainOpenStrings = ##f
  e4. 
  \set TabStaff.restrainOpenStrings = ##t
   a8\2-4 c-1 e-4 
   \set TabStaff.minimumFret = #0
  f,4.-1 a8-4 g-2 f-1
  \acciaccatura {f16-1 g16-4 } f8 e d-4 c-1 b gs
  a2 }
  \break
  \repeat volta 2 {
  \mark \markup{ \box{\fontsize #3 B}}
  a'4-4
  a8 g b, d  f-4 a-3
  a4 g g
  <d-3 e-1 c'-4>8 
  \set TabStaff.minimumFret = #4
  d e gs-1 c-4 b-4
  b4 a a
  \set TabStaff.minimumFret = #3
  g8-4 f a, d g f
  \set TabStaff.restrainOpenStrings = ##f
  f-1 e g, c f e
  } \alternative {
    \volta 1 {
      \set fingeringOrientations = #'(left)
      \set TabStaff.minimumFret = #2
      <fs,-3 c'-4 e>4 d'8-2 cs-1 d-1 a'-4
      a4 g
    }
    \volta 2 {
      e2 d4-4
      \set TabStaff.minimumFret = #1
      c 
      \set TabStaff.minimumFret = #8
      <e c'>2
    }
  }
  \bar "||"
  s2.^\markup{ \box{\fontsize #5 A}}
  \bar "||"
  
    
  
  
  %\bar ".|:"
  %\set TabStaff.restrainOpenStrings = ##t
  %\set TabStaff.minimumFret = #3
 \bar "|."
}

unten = \relative c {
  \override Fingering.font-size = #-3
  \voiceTwo
  \set stringNumberOrientations = #'(down down)
  r4
  a4
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #7
  \set fingeringOrientations = #'(left)
  <c'^\4-3 e^\3-2>4_\markup{\fret-diagram-terse "x;x;10;9;10;x;"} 4
  \set TabStaff.restrainOpenStrings = ##f
  a,4
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #6
  \set stringNumberOrientations = #'(up)
  <gs'\4-4 d'-3 f-2>4_\markup{\fret-diagram-terse "x;x;6;7;6;7;"} 4
  \set TabStaff.minimumFret = #5
  \set TabStaff.restrainOpenStrings = ##f
  e,4 
  \set TabStaff.restrainOpenStrings = ##t
  <d''\3-3 e\2-2>4_\markup{\fret-diagram-terse "x;x;x;7;5;4;"} <d e>8
  \set fingeringOrientations = #'(right)
  \set TabStaff.minimumFret = #8
  <f-3>  
  \set TabStaff.restrainOpenStrings = ##f
  a,,4
  \set TabStaff.restrainOpenStrings = ##t
  <e'' fs> r
  \set TabStaff.restrainOpenStrings = ##f
  a,,4
  \set TabStaff.minimumFret = #7
  \set fingeringOrientations = #'(left)
  <c'\4-3 e\3-2>4_\markup{\fret-diagram-terse "x;x;10;9;10;x;"} 4
  d,4 <bf' d> r
  e,, f'8 e  <d gs>4
  <a c e>_\markup{\hspace #1 \fret-diagram-terse "5;3;2;2;x;x;"} <c e>
  r4
  \set TabStaff.minimumFret = #3
  <g b' d>4_\markup{\hspace #1 \fret-diagram-terse "3;x;x;4;3;5;"} f' b8 f'
  <c, f'-4>_\markup{\hspace #1 \fret-diagram-terse "x;3;x;x;6;5;"} <e'-4> <c-3 e>4 4
  \set stringNumberOrientations = #'(right)
  <gs-2\4>2_\markup{\fret-diagram-terse "x;x;6;7;5;8;"} gs4
  <a-3> <c  e>4_\markup{ \fret-diagram-terse "x;x;x;5;5;5;"} 4
  \set TabStaff.minimumFret = #0
  <d, a' d>_\markup{\fret-diagram-terse "x;x;o;2;3;3;"} d <a' d>
  <g,-3>4 <e'-2> <a-2>8 g 
  a,4_\markup{\hspace #-1 \fret-diagram-terse "x;o;4;5;x;o;"} 
  <fs' c'>_\markup{\hspace #1 \fret-diagram-terse "x;x;4;5;3;x;"} 
  \set fingeringOrientations = #'(right)
  <fs-2 c'-3>
  <g, f'> <b' d>_\markup{\hspace #-1 \fret-diagram-terse "x;x;x;4;3;3;"}
  <g, g'> <f' g b> <b, f' g>_\markup{\hspace #-1 \fret-diagram-terse "x;2;3;o;3;x;"}
  <c e g>
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #8
  <c g'>2_\markup{\hspace #0 \fret-diagram-terse "8;10;x;9;x;8;"}
 }

chrdStrophe = \chordmode {
 
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    %ragged-last-bottom = ##f
  }
  \bookItem 
  \score {
    <<
      \new StaffGroup = "tab with traditional" <<
        
    %\new ChordNames { \chrdStrophe }
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
       \new Voice = "oben" \oben
       \new Voice = "unten" \unten
    >>
    \new TabStaff \with {
      scriptDefinitions = #tab-script-alist  
    } <<
        \tabChordRepeats 
       \revert TabStaff.Script.stencil
       \new TabVoice = "oben" \oben
       \new TabVoice = "unten" \unten
    >>  
    >>
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 20) 
%      \omit Voice.StringNumber 
    }
  }
}
