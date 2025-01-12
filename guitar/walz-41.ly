\version "2.24.2"
sheetName = "Walz 4.1."
sheetComposer = "RY"
#(define book-staff-size 20)
\include "../include/book.ily"

strophe = \relative c' {
  \accidentalStyle modern
  \time 3/4
  \key e \major
 % \set Timing.measurePosition = #(ly:make-moment -5/8)
  \partial 4.
  \mark \markup{ \box{\fontsize #2 A}}
  \override Fingering.font-size = #-3
  \set TabStaff.restrainOpenStrings = ##t
  \set TabStaff.minimumFret = #8
  b8-2 cs ds-1
  fs e ds e gs-1 b cs b as b cs ds
  cs-\prall b gs e cs c
  b4. gs8 b-1 e
  gs e-2 ds-1 e fs e 
  ds-\prall cs bs cs es gs
  gs-\prall fs es fs a cs 
  fs4. e8-4 ds cs-1
  cs-\prall b as b ds b
  a fs ds-1 b ds fs
  fs e ds e gs-1 b
  e2 ds4
  ds8-\prall cs as gs fs e
  cs as-1 fs fs gs as
  cs b as b ds fs 
  b4. b,8-2 cs ds-1
  fs e ds e gs-1 b cs b as b cs ds
  cs-\prall b gs e cs c
  b4. gs8 fss gs 
  cs,-2 es gs b-1 d cs
  es gs b a gs-\prall fs
  es fs a cs \ottava #1 fs4~-1 
  fs4. fs8 fs gs
    \set TabStaff.minimumFret = #13
  fs-\prall e-4 cs-1 fs fs gs
  fs-\prall e-4 c-1 fs-1 fs gs-3
  fs-\prall e-4 \ottava #0 
    \set TabStaff.minimumFret = #11
  b-2  gs-4
  \set TabStaff.minimumFret = #8  e-2 ds-1
  cs-4 
  \set TabStaff.minimumFret = #6
  gs-2 
  es-4
  \set TabStaff.minimumFret = #2
   cs-2 bs-1 cs-2
  fs,-1 \set TabStaff.minimumFret = #4
  a cs-1 fs a cs-1 
  \set TabStaff.minimumFret = #8
  ds b as b ds gs
  \tuplet 3/2 {e8(-2 fs e) } ds e gs-1 b
  <e gs, b>4. \bar "||" \pageBreak
  
  \mark \markup{ \box{\fontsize #2 B}}
  \ottava #1
  gs8-2 gs a
  \set TabStaff.minimumFret = #14
  gs-\prall fs ds-3 \set TabStaff.minimumFret = #11
  bs-1 \ottava #0 gs-3 fs-1
  \set TabStaff.minimumFret = #10
  ds-3 bs-1 gs-2 gs bs  ds
  ds cs bs 
  \set TabStaff.minimumFret = #9 cs e-1 gs
  cs4. cs8 ds cs
  \set TabStaff.minimumFret = #8
  cs-\prall bs-1 ds-4 bs gs g
  fs ds bs gs bs ds 
  ds-\prall cs bs cs e gs 
  cs4. 
  \set TabStaff.minimumFret = #14
  \ottava #1 gs'8-2 gs a
  gs-\prall fs ds-3 \set TabStaff.minimumFret = #11 
  bs-1 \ottava #0 gs-3 fs-1
  \set TabStaff.minimumFret = #10
  ds-3 bs-1 gs-2 gs bs  ds
  ds cs bs cs \set TabStaff.minimumFret = #9 e-1 gs
  cs4. \set TabStaff.minimumFret = #13 cs8-2 ds cs
  bs \ottava #1 a'-4 fs-2 
  \set TabStaff.minimumFret = #9 ds-1 \ottava #0 bs-4 gs-1
  \set TabStaff.minimumFret = #8
  fs-3 ds-1 bs-4 \set TabStaff.minimumFret = #4
  gs-1 \set TabStaff.minimumFret = #6 fs-4 ds-2
  \set TabStaff.minimumFret = #0 cs-1 gs e gs cs4~
  cs4. cs8-3 cs c 
  b ds-1 fs a cs ds
  \set TabStaff.minimumFret = #1
  cs-\prall-1 b e gs,-1 b cs
  b-3 a-1 ds fs, a b
  a-\prall gs-1 b gs e fs
  e gs b a-1 cs ds
  cs-\prall b e gs,-1 b-4 e,
  b-2 a'-2 fs-4 ds-1 b gs'
  e4. 
  \set TabStaff.minimumFret = #8
  cs'8-3 cs c
  b-2 ds fs a cs ds
  cs-\prall-1 b e \set TabStaff.minimumFret = #9 
  gs, b cs
  b-\prall a ds fs, a b
  \set TabStaff.minimumFret = #9 
  a-\prall gs b gs e cs
  \set TabStaff.minimumFret = #8
  b ds fs a cs ds
  cs-\prall b e \set TabStaff.minimumFret = #9 gs, 
  b cs
  b a \set TabStaff.minimumFret = #8 fs ds b gs'
  e4.
  %\partial 4.
   \set TabStaff.minimumFret = #4
  
\bar "|."
}


chrdStrophe = \chordmode {
  s4.
  e2. s2.*4 cs2.:7 fs:m s 
  b:7 s e s fs:7 s b:7 s
  e s s s cs:7 s s
  fs:m s fs:dim e cs:7 fs:m b:7 e
  s gs:7 s cs:m s gs:7 s
  cs:m s gs:7 s cs:m s
  gs:7 s cs:m s
  \repeat unfold 8 {b:7 e}
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
