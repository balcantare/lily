\version "2.24.2"
sheetName = "Le Bal de la Marine"
sheetComposer = "F. Deguelt"
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
  \override Fingering.font-size = #-3
  \accidentalStyle modern
  \time 3/4
  \key a \minor
  %\bar ".|:"
  %\set Timing.beatBase = #1/4
  \set Timing.beatStructure = 1,1,1
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #0 
  \mark\markup{ \box{\fontsize #3 In/Out}}
  e8 c a e' c a
  e' c a e' c a
  f' c a f' c a
  f' c a f' c a
  e' b gs e' b gs
  e' b gs e' b gs
  r a-\prall gs a e c 
  a 
  \break 	
  \mark\markup{ \box{\fontsize #3 A}}
    \set TabStaff.minimumFret = #4
    a'[ c e a c]
  \repeat volta 2 {
    b4 r8 a e c
    b4 r8 a b c
    b4 a2 
    r8 a c e a c
    b4 r8 a e c 
    b4 r8 a8 b c
    e4 d2
    r8 d e f e d
    f d e f e d
    \set TabStaff.minimumFret = #3
    
    a' c, d e d c
    e c d e d c
    a' c, d e d c 
  } \alternative {
    \volta 1 {
      b2. r4 fs a gs2. 
      r8 \set TabStaff.minimumFret = #4
      a[ c e a c]
    }
    \volta 2 { b,2.
               \set TabStaff.minimumFret = #0
                 e,,4 fs gs b4 a2 }
  }
  \pageBreak
  \key a \major
  \set TabStaff.minimumFret = #4 
  \mark\markup{ \box{\fontsize #3 B}}
  r8 a''8 a b b cs
  cs b b a a gs
  \set TabStaff.minimumFret = #2
  gs fs fs gs fs cs
  fs2.
  \set TabStaff.minimumFret = #4 
  r8 a8 a b b cs
  cs b b a a gs
  \set TabStaff.minimumFret = #2
  gs fs fs gs fs cs
  fs2.
  cs4 d e
  e d2
  b4 cs d
  cs2.
  a4 b cs
  cs b2
  \set TabStaff.minimumFret = #1
  gs4 a b
  a2.
  \bar "||"
  s2.^\markup{ \box{\fontsize #5 A}}
  \bar "||"
  
  \repeat volta 2 {
  \set Score.repeatCommands = #'((volta "3") end-repeat)
  b2. 
  e4 fs gs
  b4 a2
  \set Score.repeatCommands = #'((volta #f))
  %\set TabStaff.minimumFret = #3 
  }
  
  
  \bar "|."
}

chrdStrophe = \chordmode {
  a2.:m s f s e:7 s a2:m e4 a2.:m
  a:m b:dim a:m/c a:m s s 
  d:m s s d:m/f a:m/e a:m
  b:7 s s e:7
  b:7 e:7 a:m a:m 
  a:/e af:/ef a a:/fs a:/cs a fs:/as 
  fs:7/cs b:m d:m/f a s b:9 e:7 a a:m
  b:7 e:7 a:m 
}

chrdBass = \relative c {
  \tabFullNotation
  \repeat percent 2 {a4 <e' a c>4 4}
  \repeat percent 2 {f,4 <f' a c>4 4}
  \repeat percent 2 {e,4 <b' e gs d'>4 4}
  a4 <e' a c>4 <b e gs>4 
  <a e' a c>4 r4 r4
  
  a4 <e' a c>4 4
  b <f' gs d'>4 4
  c <e a c>4 4
 \repeat percent 2 {a,4 <e' a c>4 4}
  c <e a c>4 cs
  d <a' d f>4 4
  a, <a' d f>4 4
  d, <a' d f>4 4
  f <f a d f>4 4
  e <e a c>4 c
  a4 <e' a c>4 4
  b <ds a'>4 4
  ds <ds a'>4 4
  e e, fs
  gs <b d gs b>4 4
  
  b <ds a' b> a
  gs <b d gs> b
  a4 <e' a c>4 4
  a,4 <e' a c>4 4
  \set TabStaff.minimumFret = #4 
  \set TabStaff.restrainOpenStrings = ##t
  e <a cs e>4 4
  ef <af c ef>4 4
  a <a cs e>4 gs
  fs <cs' e> \set TabStaff.minimumFret = #2 e,
  cs <e a cs>4 4
  \set TabStaff.minimumFret = #0
  a, <e' a cs>4 4
  bf <e g cs>4 4
  \set TabStaff.minimumFret = #1
  cs <fs bf e>4 4
  b, <fs' b d>4 4
  f, <f' a d>4 4
  \set TabStaff.minimumFret = #0
  a, <e' a cs>4 e
  \set TabStaff.minimumFret = #1
  g fs e
  ef <ef a cs>4 fs,
  \set TabStaff.minimumFret = #0
  e fs gs
  a <e' a cs>4 4
  a, <e' a c>4 4
  
  b <ds a' b> a
  gs <b d gs> b
  a4 <e' a c>4 4
  
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
   %{  \new FretBoards { 
      \set predefinedDiagramTable = #custom-fretboard-table-one
      \override FretBoard.fret-diagram-details.number-type = #'arabic
      \override FretBoard.fret-diagram-details.label-dir = #LEFT
      \override FretBoard.fret-diagram-details.barre-type = #'straight
      \override FretBoard.fret-diagram-details.dot-radius = #0.35
      \override FretBoard.fret-diagram-details.fret-label-font-mag = #0.7
      \chrdStrophe } 
   %}  
    
    \new Staff { \clef "G_8" \strophe }
    \new TabStaff \with {
    }{ \tabChordRepeats \strophe } 
    \new ChordNames { \chrdStrophe }
    \new TabStaff { \chrdBass }
    
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 20) 
      \omit Voice.StringNumber 
    }
  }
}
