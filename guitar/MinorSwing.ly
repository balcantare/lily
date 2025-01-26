\version "2.24.2"
sheetName = "Minor Swing"
sheetComposer = "Django Reinhardt, Stephane Grapelli"
#(define book-staff-size 20)
\include "../include/book.ily"

% Make a blank new fretboard table
#(define custom-fretboard-table-one
   (make-fretboard-table))

% Add a chord to custom-fretboard-table-one
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {a:m}
                        #guitar-tuning
                        "5-(;7;7;5;5;5-);"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {e:7}
                        #guitar-tuning
                        "7-(;7-);6;7;5;x;"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {d:m}
                        #guitar-tuning
                        "5-(;5;7;7;6;5-);"
\storePredefinedDiagram #custom-fretboard-table-one
                        \chordmode {bf}
                        #guitar-tuning
                        "6-(;8;8;7;6;6-);"

guitar = \relative c' {
  \override Fingering.font-size = #-3
  \accidentalStyle modern
  \time 4/4
  \key a \minor
  \bar ".|:"
  \mark \markup{ \box{\fontsize #2 GitB}}
  \repeat volta 2 {
  \repeat volta 3 {
    \set TabStaff.restrainOpenStrings = ##t
    \set TabStaff.minimumFret = #3
     e,4-4 a-5 c~-2 c8 d16(-1 c)-3  
     \set TabStaff.minimumFret = #4
     b4-1 d8-4 f~-3 f2 
  }
  \set TabStaff.minimumFret = #0
  e,,4 f fs g
  \set TabStaff.minimumFret = #4
  gs a as b 
  }
  \mark \markup{ \box{\fontsize #2 GitA}}
  \repeat volta 2 {
  \repeat volta 3 {
    \set TabStaff.restrainOpenStrings = ##t
    \set TabStaff.minimumFret = #3
     a'4-3 c-1 e~ e8 f16( e) d4-1 f8-4 a~-3 a2
     \set TabStaff.minimumFret = #4
  }
  r1 
  }
  \alternative {
   \volta 1 { r1 }  
  }
  \break
  \repeat volta 2 {
    r8 <gs, d' fs c'>8 8[ 8] r8 8 <gs d' fs b>4
    r8 <fs c' e a>8 4 4 r4 
    r8 b'16-4 a-2 gs8-1 a b a gs b
    a4 f8
     \set TabStaff.minimumFret = #3
    d b4 r4
     \set TabStaff.minimumFret = #7
    r8 b-3 d'-4 c b a
    \tuplet 3/2 {gs8( a gs)} f8 d b4 r
     \set TabStaff.minimumFret = #6
    r4 \tuplet 3/2 {gs-1 b-4 d-1} 
     \set TabStaff.minimumFret = #9
    f4 \tuplet 3/2 {e8( f) e}
    \set TabStaff.minimumFret = #7
    c8 a a4 a2 
    r4 r8 a'8 b4 c8 d
    r8 d8~ 4 r8 c-4 b-3 \set TabStaff.minimumFret = #4 a-1
    b4 r8 gs-1 b-4 a-2 f e
    d c b %\appoggiatura e\^ 
          f'-3 e4-2 c8-1 a-4
    e-3 a-4 c-1 e-1 a-1 b c a
    \set TabStaff.minimumFret = #7
    b4 fs8-1 a-4 gs4 e8 ef
    d c'~ 4 \set TabStaff.minimumFret = #4 b8-4 a-2 gs-1 b 
    a8 e-1 c4-1 a2 
  } \break
  \repeat volta 2 {
  a4-3 c e2 a,4 c8 e r8 e~ e4 \set TabStaff.minimumFret = #3 d4-1 f-4 a2-3
  d,4 f8 a r a~ a4
  e4-2 gs-1 b2-4
  e,4 gs8 b r8 c4
  } \alternative {
   \volta 1 { \set TabStaff.minimumFret = #0 e,,,8 
              e'\6 e, d'\6 e, c'\6 e, b'\6 e, 
              a\6 e gs e f e r4 
  }
   \volta 2 { r8} 
  }
  \set TabStaff.minimumFret = #4
  r8 e''-2 ds e f fs 
  \set TabStaff.minimumFret = #8
  g gs 
  a4 r4 r2
\bar "|."
}

chrdStrophe = \chordmode {
  \set predefinedDiagramTable = #custom-fretboard-table-one
  s1*8
  a2:m
  e:7
  a1:m
  s d:m s e:7 s a:m s d:m s a:m s
  e:7 bf a:m 
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
    \new FretBoards { 
      \override FretBoard.fret-diagram-details.number-type = #'arabic
      \override FretBoard.fret-diagram-details.label-dir = #LEFT
      \override FretBoard.fret-diagram-details.barre-type = #'straight
      \override FretBoard.fret-diagram-details.dot-radius = #0.35
      \override FretBoard.fret-diagram-details.fret-label-font-mag = #0.7
      \chrdStrophe 
    }
    \new ChordNames { \chrdStrophe }
    \new Staff { \clef "G_8" \guitar }
    \new TabStaff \with {
     % fontSize = #-1
     % \override StaffSymbol.staff-space = #(magstep -1)
    }{ \tabChordRepeats \guitar }  
    >>
    \layout { 
      \omit Voice.StringNumber 
    }
  }
}
