\version "2.24.2"
sheetName = "Troublant Bolero"
sheetComposer = "Django Reinhard"
#(define book-staff-size 20)
\include "../include/book.ily"

% Make a blank new fretboard table
#(define custom-fretboard-table-one
   (make-fretboard-table))

% Add a chord to custom-fretboard-table-one
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {e:7+}
                        #guitar-tuning
                        "o;2;2;1;4;x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {e:6}
                        #guitar-tuning
                        "o;2;2;1;2;x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {e:m7+}
                        #guitar-tuning
                        "o;2;2;0;4;x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {a:13}
                        #guitar-tuning
                        "o;o;2;0;2;2;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {d:6.9}
                        #guitar-tuning
                        "5-(;5-);4-(;4-);5-(;5-);"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {c:7}
                        #guitar-tuning
                        "3-(;3;5;3;5;3-);"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {b:7}
                        #guitar-tuning
                        "2-(;2;4;2;4;2-);"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {f}
                        #guitar-tuning
                        "1;3;3;4;x;x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {e:7}
                        #guitar-tuning
                        "o;2;2;1;3;x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {a:m7}
                        #guitar-tuning
                        "5;x;5-(;5;5-);x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {d:9}
                        #guitar-tuning
                        "5-(;5-);4;5-(;5-);x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {g:dim}
                        #guitar-tuning
                        "3;x;2-(;3;2-);x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {g:7+}
                        #guitar-tuning
                        "3;x;4;4;3;x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {e:9-/gs}
                        #guitar-tuning
                        "4;x;3-(;4;3-);x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {e:9-/b}
                        #guitar-tuning
                        "7;x;6-(;7;6-);x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {fs:m5-7}
                        #guitar-tuning
                        "2;x;2;2;1;x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {e:9+}
                        #guitar-tuning
                        "o;2;2;1;3-(;3-);"



strophe = \relative c, {
  %\voiceOne
  \override Fingering.font-size = #-3
  \accidentalStyle modern
  \time 4/4
  \key e \major
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #0
  \once\override Score.RehearsalMark.self-alignment-X = #1
  \mark \markup{ \box{\fontsize #3 Intro}}
  \bar ".|:"
  \repeat volta 2 {
    e4 e'8 e ds4 e
    e,8 e' e e ds4 e
  } 
  <e, b' e gs d' g>1~_\markup{\fret-diagram-terse "o;2-(;2-);1;3-(;3-);"} 1
  <a e' g cs fs>1~_\markup{\fret-diagram-terse "x;o;2;o;2;2;"} 1
  <e b' e gs d' g>1~_\markup{\fret-diagram-terse "o;2-(;2-);1;3-(;3-);"} 1
  <e as ds g cs fs>1~_\markup{\fret-diagram-terse "o;1-(;1-);o;2-(;2-);"} 1
  \break
\repeat volta 2 {
    \mark \markup{ \box{\fontsize #3 A}}
  \set TabStaff.minimumFret = #8
  r4 r8 b'' c b as b
  b'1 
  r4 gs8 a b4 g8 a
  b1
  r4 g8 a b4 a8 gs
  a1
  } \alternative {
    \volta 1 {
       g2.~ \tuplet 3/2 {g8 a( g)}
       \set TabStaff.minimumFret = #7
       fs1
    }
    \volta 2 {
       g2 fs4 e8 ds
       fs4. e8 e2
       \bar "||"
    }
  }
  \pageBreak
  \mark \markup{ \box{\fontsize #3 B}}
  
  r2 e2
  e'1
  r4 c8 d e4 d8 cs
  cs4. e8 d2
  r4 b8 c d4 c8 b
  b4. c8 c2
  \set TabStaff.minimumFret = #5
  r4 a8 b c4 b8 as
  b1
  
  \repeat volta 2 {
  \bar "||"
  s1^\markup{ \box{\fontsize #5 A}}
  \bar "||"}
  \alternative {
    \volta 3 {
 \set TabStaff.minimumFret = #4
  g2 fs4 e8 ds
  \bar "||"
    }
  }
  \mark \markup{ \box{\fontsize #3 Coda}}
  \break
  e4. 
  \set TabStaff.minimumFret = #0
  e,8 ds e ds e
  <a, e' g cs fs>4. e'8 ds e ds e
  <e, e' gs d' g>4. e'8 ds e ds e
  <a, e' g cs fs>4. e'8 ds e ds e
  e, 
  \set TabStaff.minimumFret = #4
  a' gs cs b fs' e a
  gs cs b fs' e ds e  a
  gs4
  \harmonicByFret 7 e,,2.\1
  \harmonicByFret 5 e,,2\1
  \set TabStaff.minimumFret = #0
  <e,,, b' e gs cs fs>2
  
  \bar "|."
}

chrdStrophe = \chordmode {  
  \set predefinedDiagramTable = #custom-fretboard-table-one
  s1*10
  s2 f2
  e1:7+
  e1:6 
  e1:m7+ 
  a1:13 
  d1:6.9 c:7 b:7 
  c2:7 b:7 e1:6 s2 e:7
  a1:m7 d:9 g2:dim g:7+
  e2:9-/gs e:9-/b a1:m7 fs:m5-7
  b:7 s1
  c2:7 b:7
  e1:6 a:13 e:9+ a:13
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
      \override FretBoard.fret-diagram-details.barre-type = #'straight
      \override FretBoard.fret-diagram-details.dot-radius = #0.35
      \override FretBoard.fret-diagram-details.fret-label-font-mag = #0.7
      \override FretBoard.fret-diagram-details.label-bass-fret = ##t  
      \chrdStrophe 
    }
    \new ChordNames { \chrdStrophe }
    \new Staff \with {
      \override TextScript.fret-diagram-details.number-type = #'arabic
      \override TextScript.fret-diagram-details.label-dir = #LEFT
      \override TextScript.fret-diagram-details.barre-type = #'straight
      \override TextScript.fret-diagram-details.dot-radius = #0.35
      \override TextScript.fret-diagram-details.fret-label-font-mag = #0.7
      \override TextScript.fret-diagram-details.fret-count = 3
      \override TextScript.fret-diagram-details.label-bass-fret = ##t 
    }{ \clef "G_8" \strophe }
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
