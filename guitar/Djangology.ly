\version "2.24.2"
sheetName = "Djangology"
sheetComposer = "Django"
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



strophe = \relative c' {
  %\voiceOne
  \accidentalStyle modern
  \time 4/4
  \key g \major
  %\bar ".|:"
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #6
  r8 e4. ef4 d 
  \set TabStaff.minimumFret = #5
  \mark \markup{ \box{\fontsize #2 A}}
  \repeat volta 2 {
    cs8 e g b r b r4
    c,8 ef fs b r b r4
    \set TabStaff.minimumFret = #7
    b,8 d fs a r a r4
    bf,8 df e a r g4.
    e2 r8 g8 r4
  } \alternative {
    \volta 1 {fs4 r4 d fs 
    \set TabStaff.minimumFret = #5
    e4 r8 e8~ 2 r1}
    \volta 2,3 
    {fs4 r4 d b' g r8 g8~ g2 r1}
  } \break
  \mark \markup{ \box{\fontsize #2 B}}
  af,8 bf c df ef4 ef
  ef4 r8 c bf af r4
  \set TabStaff.minimumFret = #6 
  a8 b cs d e4 e 
  e r8 cs b a r4
  \bar "||"
  s1^\markup{ \box{\fontsize #4 A}} \break
  \bar "||"
  \repeat volta 2 {
  \set Score.repeatCommands = #'((volta "Coda") end-repeat)
  fs'4 r4 d b'8 g
  \set Score.repeatCommands = #'((volta #f))
  \set TabStaff.minimumFret = #3 
  r8 bf a g  f e d c 
  b4 d,8 af r4 g4 }
  \bar "|."
  \pageBreak
  \tupletSpan 2
  \set TabStaff.minimumFret = #2
  \tuplet 3/2 { cs4 e g b a g fs a c ef d c b d fs}
  a8 g fs g
  bf4 e,8 
  \set TabStaff.minimumFret = #8 
  g r2
  \set TabStaff.minimumFret = #5
  r2 <a,, e' a c e>8 g'' b d
 \set TabStaff.minimumFret = #7 
   c b a g fs e d c
  as b g4 g4. \set TabStaff.minimumFret = #4 
  d8
  fs8 d fs a g4 r8 g'
  \set TabStaff.minimumFret = #7 
  a8 a g4 e4. g8
  a4 g8 ef~ ef4. g8
  a4 g d8 bf'\^ b4
  a4 g8 e r e4.
  r4 r8 
  \set TabStaff.minimumFret = #4
  b c b' a fs
  e c a g 
  \set TabStaff.minimumFret = #2 
  fs d' r8 fs,
  g b d g ef c a fs
  g d af g r2 \break
  \tuplet 3/2 { ef'4 af c} ef f
  c4. c8~ c2
  \tuplet 3/2 { e,4 a cs } e gs
  fs cs8 e r8 e4.
  cs8 e g b r8 b r4
  a8 g ef c r8 c4.
  b8 d fs a r4 g8 bf
  a4 g8 bf a4 g8 e~
  e2 e8 es fs d'
  b fs d df c bf'\^ b4
  g8 g g4 g2 r8 e4. ef4 d
  
\bar "|."
}

chrdBase = \chordmode {
  \set predefinedDiagramTable = #custom-fretboard-table-one
  s1
  cs1:m5-7 c:m6 g:7+/b bf:dim a:m7 d:9 g:6 s 
  d:9 g2:6 c:m6 g1:6
  af:6 s a:6 s
  s
  d2..:9 g8:6 s1 s2. g4:6
}

chrdStrophe = \chordmode {
  
  \set predefinedDiagramTable = #custom-fretboard-table-one
  s1
  cs1:m5-7 c:m6 g:7+/b bf:dim a:m7 d:9 g:6 s 
  d:9 g2:6 c:m6 g1:6
  af:6 s a:6 s
  s
  d2..:9 g8:6 s1 s2. g4:6
  cs1:m5-7 c:m6 g:7+/b bf:dim a:m7 d:9 g:6 s
  cs1:m5-7 c:m6 g:7+/b bf:dim a:m7 d:9 g2:6 c:m6 g1:6
  af:6 s a:6 s
  cs1:m5-7 c:m6 g:7+/b bf:dim a:m7 d:9 g:6 s
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
    \new FretBoards { 
      \override FretBoard.fret-diagram-details.number-type = #'arabic
      \override FretBoard.fret-diagram-details.label-dir = #LEFT
      \chrdStrophe 
    }
    \new ChordNames { \chrdStrophe }
    \new Staff { \clef "G_8" \strophe }
    \new TabStaff \with {
     % fontSize = #-1
     % \override StaffSymbol.staff-space = #(magstep -1)
    }{ \tabChordRepeats \strophe }  
    >>
    \layout { 
      \omit Voice.StringNumber 
    }
  }
}
