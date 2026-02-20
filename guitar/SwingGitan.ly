\version "2.24.2"
sheetName = "Swing Gitan"
sheetComposer = "As played by Angelo Debarre"
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

strophe = \relative c {
  %\omit Script
  %\voiceOne
  \override Fingering.font-size = #-3
  \accidentalStyle modern
  \time 4/4
  \key g \minor
  %\bar ".|:"
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #3
  <g d' g bf d>4\ds_\markup{\fret-diagram-terse "3;5;5;3-(;3-);x;"} 4\dots
  <bf ef g df' ef>4_\markup{\fret-diagram-terse "6-(;6-);5;6;4;x;"} 4
  <af ef' gf c ef>4_\markup{\fret-diagram-terse "4;6;4;5;4;x;"} 4
  <a d fs c' d>4_\markup{\fret-diagram-terse "5-(;5-);4;5;3;x;"} 4
  <g d' g bf d>4_\markup{\fret-diagram-terse "3;5;5;3-(;3-);x;"} 4
  <bf ef g df' ef>4_\markup{\fret-diagram-terse "6-(;6-);5;6;4;x;"} 
  <af ef' gf c ef>4~_\markup{\hspace #1 \fret-diagram-terse "4;6;4;5;4;x;"} 4
  <bf ef g df' ef>4_\markup{\fret-diagram-terse "6-(;6-);5;6;4;x;"} 
  <a d fs c' d>4_\markup{\fret-diagram-terse "5-(;5-);4;5;3;x;"} 
  \break
  bf'4(-2\ds
  \set TabStaff.minimumFret = #6
  d4)-2\ds r cs-1\ds 
  d8-1\ds bf'~-4\2\ds
  bf2 r8 cs,8~(-1\ds 16 d-1 e-3 d-1)
  cs4-1\ds r8 d-2\us cs-1\ds bs-\3-1\us cs4-1\ds
  a'4-4\ds r8 a~\ds a2
  \set TabStaff.minimumFret = #4
  r2 \tuplet 3/2 {c,4-1\ds b-1\us c-1\ds}
  \slashedGrace f8-2\glissando\ds a2-\2-2 r8 c,8~(-1\ds \tuplet 3/2 {c8 d-3 c-1)}
  \set TabStaff.minimumFret = #2
  
  bf4-1\dots r a-1 bf-1
  \set TabStaff.minimumFret = #4
  g'4-4 r8 g~-4 g2
  r4 r8 g,-2\ds af\us c\ds ef4\ds
  \appoggiatura e8\ds\^ f2.( \^ ff4 )
  \set TabStaff.minimumFret = #2
  ef2\ds \tuplet 3/2 {d8(-1\ds ef)-2 d\us} cs8-1\ds ef-2\us
  d4-\trill^\markup{\finger "(1 2)"}\ds r8 
  g,-3\ds_\markup{\fret-diagram "c:3-1-3;4-5;3-3;2-3;1-3;"} 
  bf-1\ds d-1\ds g-1\ds bf-2\us  
  a4-1\ds e8-1\ds f-2\us g2\2-4\ds
  \set TabStaff.minimumFret = #4
  r8 cs,-2\ds e\ds g\us \tuplet 3/2 {bf8(\ds c) bf\us} a\ds f\ds
  ef8-1\us 8\ds 4\us 4\ds \tuplet 3/2 {f8-4\ds ff\us ef\ds}
  \set TabStaff.minimumFret = #2
  \tupletSpan 4
  \tupletDown
  \tuplet 3/2 {d-3\us c-1 bf-1 a-1 g-3\ds fs-2\us ef-4\ds d-3\us c-1\ds bf-4\ds a-3\us af-2\ds}
  \tupletNeutral
  g4\ds r8 
  \set TabStaff.minimumFret = #6
  d''8( cs4) d8 bf'~\2
  bf2 r8 cs,( d8.) e32(\us d)
  cs4\ds r 
  \set TabStaff.minimumFret = #5
  c\ds cs8 a'\2
  r8 a8~\2 a2.
  \set TabStaff.minimumFret = #4
  r8 b,(\glissando \tuplet 3/2 {c8 d c)} b8 c r \appoggiatura gs'\^\2 a~\2
  a2. c,4
  \set TabStaff.minimumFret = #2
  bf4 r a bf
  g'\2 r8 g8~\2 g2
  r4 r8 g,8 af c ef4
  \appoggiatura e\^ f2.( \^ ff4)
  ef4. d8(-2 cs) d\us ef\ds cs\us
  d4\ds r8 
  bf-3\ds_\markup{\fret-diagram "c:3-1-3;3-3;2-3;1-3;"} d\ds g\ds a\ds bf\us
  a2-\mordent\ds r4 \tuplet 3/2 {g8(-1\ds a) g\us}
  fs8-1\ds ef\ds \tuplet 3/2 {d8(\ds ef) d\us} c8\ds bf\us a\ds fs\ds
  g8\us d(-2\ds ef)\5-3 d-2\us cs-1\ds d-2\us fs a\4
  c bf-1\prall a-1 g\ds fs ef-4\ds d-3\us bf-4\ds
  \bar "||"
  g8\ds a\us bf\ds d-3\ds g-3\ds fs-1 a\4-4 g-3
  d-2 bf-4\ds a\us g\ds bf4\ds g8 gs
  \tupletDown
  a4 \tuplet 3/2 {a8\5 cs e g bf\ds cs\ds e g bf}
  \set TabStaff.minimumFret = #4
  \tuplet 3/2 {a8(\ds bf) a\us g\ds e\us cs\ds a g\dots f e ef cs}
  \tupletNeutral
  ef8-3\ds d\us cs\dots d fs a c ef\ds
  fs d-1 ef4\3-2 r8 bf'-1\ds c-3\us cs-4\ds
  d-4\ds bf\us g\ds  fs\us a\2\ds g\us d\ds bf\ds
  g-1\ds \parenthesize d\4\us g \parenthesize d\4 g \parenthesize d\4 g \parenthesize d\4
  g\ds \parenthesize d\4 ef4\ds ef4\ds 
  \set TabStaff.minimumFret = #8
  \tuplet 3/2 {ef'8-1\ds af-2\ds c-1\ds}
  \tuplet 3/2 {d( ef d)} c4\2-4 f-4 d8 ef
  \tuplet 3/2 {d8( ef d)} bf8 g\3 e-1 d bf\5 g
  bf4.\5 g8 r2
  r8 cs,-1\ds e\us g bf\5 gs-1 a cs
  \set TabStaff.minimumFret = #11
  e g\ds bf\ds df\us \ottava #1 e-2\dots g-4 bf-4 gs-2
   \set TabStaff.minimumFret = #14
  a8-3 g-1 ef\ds c\ds a c ef f-4 
  fs\2-4 \ottava #0 bf,\ds c\us cs(-1\ds\glissando d)-1 bf(-1\ds\glissando a)-1 g\ds
  a4-1\ds g8-3\ds d-2\ds bf-3\ds g-1\us a-3\ds bf-4\us
  d-3\ds g-3\ds 
  bf-1\ds_\markup{\fret-diagram "c:3-1-15;3-15;2-15;1-15;"} d-1\ds \ottava #1 g\ds a-1\us bf\ds d,-1\ds
  cs-1\ds a'\ds a,4\ds a a'8 cs,
  r8 a' a,4 a'8 cs, r a'
   \set TabStaff.minimumFret = #9
  c,4 \ottava #0 r8 d,(-2\ds \tuplet 3/2 { ef8)-3 g-2\ds bf-1\ds} c8-3\us bf-1\ds
  a-1\us g-4\ds e-1\us f-2\ds 
  fs-1\us_\markup{\fret-diagram "c:2-1-10;3-11;2-10;1-10;"}
  a-1\ds d4-1\ds
  <fs,-2 a-1>4\ds <a c>4 4 <fs a>8 <g bf>
  r <bf d> <a cs> <bf d> r8 
  <gf bf ef>_\markup{\fret-diagram "c:3-1-11;3-11;2-11;1-11;"} <f a d> <gf bf ef>
  r d( \tuplet 3/2 {ef) gf-1 bf-1} gf'\ds d\us \parenthesize ef c\ds
  f,\ds gf\us c\ds a\us bf\ds gf\ds ef\ds cs\us
  d-3 e-1\ds fs-2 g-3 a-1\ds bf c cs-1
  d \ottava #1 fs(-4\glissando a)-4 g-2 d\2-1\ds \ottava #0 bf\3-1\ds a\3-1 g\4-4
  cs4\2-1 a-1 a4. bf8
  a8\us g fs a c ef d bf
  g8\ds g\us g4\ds g4\ds cs,8-1 d-2
  f\4-4 ef-2 a,-1 bf-2 c\5-3 cs\5-4 d4\5-4
  \bar "||" \break
  \set TabStaff.minimumFret = #6
  r4 r8 d8-1 cs4-1 d8-1 \appoggiatura g\glissando bf~\2
  bf2 r8 cs,-1\glissando \tuplet 3/2 {d-1 e-3 d-1}
   \set TabStaff.minimumFret = #5
  cs4-1 r8 d-2 cs-1 bs-1 cs-1 \appoggiatura fs-2\glissando a-2\2~
  a1\2
   \set TabStaff.minimumFret = #4
  r8 \appoggiatura b,-1 c8~-1 \tuplet 3/2 {c8 d(-3 c)-1} \tuplet 3/2 {b4-1 c-1 \appoggiatura f-2\glissando a-2~\2}
  a2 r8 c,~-1 \tuplet 3/2 {c8( d-3 c-1)}
  \set TabStaff.minimumFret = #2
  bf4-1 r4 a8-1 bf-1 c-3 bf-1
  \appoggiatura ef\glissando g4\2-2 g8\2 g8~\2 g2\2
  r4 r8 g,8-2 af4 c8 ef
  \appoggiatura e\^ f2.( \^ ff4)
  ef4. d8 cs d ef cs
  d d,-4\ds e\ds fs\us g\ds a\ds bf\us c-4\ds\glissando
  d-4\3\us e-1\ds f\us g\2\ds a-1\ds bf-2\us b-3 c-4
   \set TabStaff.minimumFret = #5
   \tupletDown
  cs-4 bf-1 \tuplet 3/2 {a8(-1\ds bf) a\us g\ds e cs\ds a\ds af g\ds}
  \set TabStaff.minimumFret = #3
  \tuplet 3/2 {fs8-1\us ef-3 c-1 cs-2 d-2 fs-1 a c ef fs a ef'-2}
  \set TabStaff.minimumFret = #9
  \tuplet 3/2 {d(\ds ef) d\us c\ds a\us fs\ds d-3 c-1 a-3 fs d fs }
  g4 r8 
  \set TabStaff.minimumFret = #6
  d'8-1 cs4-1 d8-1 bf'~\2-4
  bf2 r8  cs,8(-1 \tuplet 3/2 {d8-1 e-3 d)-1}
  cs4-1 r8 d-2 cs-1 bs\3-1 cs-1 a'-4
  r8 a~-4 a2.
  \set TabStaff.minimumFret = #4
  r8 b,(-1 \tuplet 3/2 { c-1 d-3 c-1)} b8-1 c-1 r \appoggiatura gs'\2\^ a-3\2~
  a2\2 r8 c,~ \tuplet 3/2 { c8 d c}
  \set TabStaff.minimumFret = #2
  bf4 r a bf
  g'\2 r8 g8\2~ g2\2
  r4 r8 g, af c ef4
  \appoggiatura e\^ f2. \^ ff4 
  ef4. d8 cs d ef cs
  d4.\mordent g,8\ds_\markup{\fret-diagram "c:3-1-3;4-5;3-3;2-3;1-3;"} 
  bf\ds d\ds g\ds bf\us_\markup{\fret-diagram "c:2-1-5;3-6;2-5;1-5;"}
  a4\ds
  cs,8\ds <e a>4\ds_\markup{\fret-diagram "3-6;2-5;1-6;"} 
  <e bf'>8\us 4\ds
  r8_\markup{\fret-diagram "3-5;2-4;1-6;"}  <c ef bf'>4\ds
   <c ef a>8\us 8\ds_\markup{\fret-diagram "3-5;2-4;1-5;"}
   r <a cs fs>\ds <bf d g>\ds_\markup{\fret-diagram "c:3-1-2;3-2;2-2;1-2;"} 
  r8 fs(\ds \tuplet 3/2 {g8) bf\ds d\ds} ef\us c\ds a\us fs\ds
  g\ds d\ds bf\ds g\ds r4 
  <d' g bf e a>4\fermata_\markup{\fret-diagram "c:5-4-5;c:2-1-5;5-5;4-5;3-3;2-5;1-5;"}
  \bar "|."
}

chrdStrophe = \chordmode {
  g2:m ef:7 af:7 d:7 
  g:m ef4:7 af:7 s ef:7 d2:7
  g1:m s a:7 s c:m d:9+
  g:m7 s af:7 s g:m s
  a:7 s c:m6 d:9- g:m g:m6
  a:7 s c:m d:9+ g:m7 s af:13- s
  g:m s a:7 c2:m d:7 a:m5-7 g:m e:m5-7 d:9- 
  g1:m s a:7 s d:9- s
  g:m s af:7 s g:m s
  a:7 s c:m d:9- g:m7 s
  a:/g s af:/g d:9+ g2:m6 a:m6 bf:6 g:/b af1:/c s
  g:m6/bf g:m6 a2:7 ef:7 c:m7 d:9+ g:m6 g:m6/bf a:7 d:9- 
  g1:m g:m6 a:7 s c:m d:9+
  g:m s af:7 af:13 g:m6 s
  a:7 s c:m7 d:9- g:m s
  a:7 s c:m d:9+ g:m s af:6 s
  g:m s a:7 d:9- g2:m d:9- g1:m 
}

\bookpart {
  \paper {
    page-count = #4
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
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
    }{ \clef "G_8" \strophe }
    \new TabStaff \with {
      scriptDefinitions = #tab-script-alist  
    }{ \tabChordRepeats 
       \revert TabStaff.Script.stencil

       \strophe }  
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 20) 
      \omit Voice.StringNumber 
    }
  }
}
