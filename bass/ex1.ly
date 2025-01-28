\version "2.24.2"
sheetName = "Bass Lektion 1"
#(define book-staff-size 20)
\include "../include/book.ily"

% Make a blank new fretboard table
#(define custom-fretboard-table-one
   (make-fretboard-table))

% Add a chord to custom-fretboard-table-one
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {a}
                        #bass-tuning
                        "x;o;2;2;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {e}
                        #bass-tuning
                        "o;2;2;x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {d:m}
                        #bass-tuning
                        ";;2;1;"
%\storePredefinedDiagram #custom-fretboard-table-one
%                        \chordmode {bf}
%                        #guitar-tuning
%                        "6-(;8;8;7;6;6-);"

bass = \relative c, {
  \override Fingering.font-size = #-3
  \accidentalStyle modern
  \time 4/4
  \clef "bass_8"
  \key a \minor
  \bar ".|:"
  \mark \markup{Latin 1}
  \repeat volta 2 {
    \set TabStaff.restrainOpenStrings = ##t
    \set TabStaff.minimumFret = #0
    a4-0 e'8-1^\markup { 
      % A
      \fret-diagram "w:4;3-o;2-2;1-2;" 
    }
      a~-1 a e-1 a,-0 e'
    a,4 e'8 a~ a e a, e'
    e,4-0 b'8-1^\markup { 
      % E
      \fret-diagram "w:4;4-o;3-2;2-2;" 
    }
    e8~-1 e b-1 e b
    e,4 b'8 e8~ e b e, b'
  }
  a1
  \break
  \bar ".|:-|."
  \mark \markup{Latin 2}
  \repeat volta 2 {
    d4-0 f8-2^\markup { 
      % Dm
      \fret-diagram "w:4;1-2;2-o;2-3;" 
    }
    a~-1 a f a f
    d4 f8 a~ a f d f
    a,4-0 c8-2^\markup {
      % Am
      \fret-diagram "w:4;2-2;3-o;3-3;"
    }
    e~-1 e c a c
    a4 c8 e~ e c e c
    e,4-0 b'8-1^\markup {
      % E
      \fret-diagram "w:4;4-4;2-2;3-2;4-o;" 
    }
    e~-1 e b-1 gs-4 b-1
    e,4 b'8 e~ e b e gs,
    a4-0 e'8-1 c~-2^\markup {
      % Am
      \fret-diagram "w:4;2-2;3-o;3-3;"
    }
     c e c a
    a4-0 b8-1^\markup {
      % A79
      \fret-diagram "w:4;2-2;3-o;3-2;3-4;"
    } cs~-4 cs e cs a
  }
  d1
  \break
  \bar ".|:-|."
  \mark \markup{Swing 1 }
  \repeat volta 2 {
  d4 \xNote d^\markup { 
      % Dm
      \fret-diagram "w:4;3-o;2-o;2-3;" 
    }
  a \xNote a 
  d \xNote d f-2 \xNote f
  a,4 \xNote a^\markup {
      % Am
      \fret-diagram "w:4;2-2;3-o;3-3;"
    }
  c-2 \xNote c 
  e-1 \xNote e c \xNote c 
  \break
  e,-0 \xNote e^\markup {
      % E
      \fret-diagram "w:4;4-4;2-2;3-2;4-o;" 
    }
  b'-1 \xNote b 
  gs-4 \xNote gs b \xNote b
  a-0 \xNote a^\markup {
      % Am
      \fret-diagram "w:4;2-2;3-o;"
    } 
  e'-1 \xNote e
  a,-0 b-1^\markup {
      % A7
      \fret-diagram "w:4;3-4;3-3;3-2;3-o;"
    } c-2 cs-4
  }
  
}

chrdStrophe = \chordmode {
  \set predefinedDiagramTable = #custom-fretboard-table-one
  a1 s e s a
  d:m s a:m s
  e s a:m a
  d:m
  d:m s a:m s
  e s a:m a:7
 }


\layout {
  \context {
    \Score
    \omit BarNumber
    % or:
    %\remove "Bar_number_engraver"
  }
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
    \new Staff { \clef "G_8" \bass }
    \new TabStaff \with {
      stringTunings = #bass-tuning
    }{ \tabChordRepeats \bass }  
    >>
    \layout { 
      \omit Voice.StringNumber 
    }
  }
}
