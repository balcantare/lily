\version "2.24.2"
sheetName = "Swing Gitan"
sheetComposer = "As played by Angelo Debarre"
#(define book-staff-size 20)
\include "../include/book.ily"


% Make a blank new fretboard table
#(define custom-fretboard-table-one
   (make-fretboard-table))

% Add a chord to custom-fretboard-table-one
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {cs:m5-7}
                        #guitar-tuning
                        "x;4;5;4;5;x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {c:m6}
                        #guitar-tuning
                        "8;x;7;8-(;8-);x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {g:7+/b}
                        #guitar-tuning
                        "7;x;5;7;7;x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {bf:dim}
                        #guitar-tuning
                        "6;x;5;6;7;x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {a:m7}
                        #guitar-tuning
                        "5;x;5-(;5;5-);x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {d:9}
                        #guitar-tuning
                        "5-(;5-);4;5-(;5;5-);"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {g:6}
                        #guitar-tuning
                        "3;5-(;5-);4;5-(;5-);"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {af:6}
                        #guitar-tuning
                        "4;6-(;6-);5;6-(;6-);"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {a:6}
                        #guitar-tuning
                        "5;7-(;7-);6;7-(;7-);"

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
  <g d' g bf d>4\ds 4\dots
  <bf ef g df' ef>4 4
  <af ef' gf c ef>4 4
  <a d fs c' d>4 4
  <g d' g bf d>4 4
  <bf ef g df' ef>4 
  <af ef' gf c ef>4~ 4
  <bf ef g df' ef>4 
  <a d fs c' d>4 
  \break
  bf'4(-2\ds
  \set TabStaff.minimumFret = #6
  d4)-2\ds r cs-1\ds 
  d8-1\ds bf'~-4\ds
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
  d4-\trill^\markup{\finger "(1 2)"}\ds r8 g,-3\ds bf-1\ds d-1\ds g-1\ds bf-2\us  
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
  d4\ds r8 bf-3\ds d\ds g\ds a\ds bf\us
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
  
\bar "|."
}

chrdStrophe = \chordmode {
  
  \set predefinedDiagramTable = #custom-fretboard-table-one
  s1
}

\bookpart {
  \paper {
    page-count = #2
    #(define fonts (book-font 1))
    % ragged-last-bottom = ##t
  }
  \bookItem 
  \score {
    <<
 %{    \new FretBoards { 
      \override FretBoard.fret-diagram-details.number-type = #'arabic
      \override FretBoard.fret-diagram-details.label-dir = #LEFT
      \override FretBoard.fret-diagram-details.barre-type = #'straight
      \override FretBoard.fret-diagram-details.dot-radius = #0.35
      \override FretBoard.fret-diagram-details.fret-label-font-mag = #0.7
      \chrdStrophe 
    }
 %} 
    \new ChordNames { \chrdStrophe }
    \new Staff \with {
      scriptDefinitions = #staff-script-alist
    }{ \clef "G_8" \strophe }
    \new TabStaff \with {
      scriptDefinitions = #tab-script-alist  
    }{ \tabChordRepeats 
       \revert TabStaff.Script.stencil

       \strophe }  
    >>
    \layout { 
      \omit Voice.StringNumber 
    }
  }
}
