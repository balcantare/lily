\version "2.24.2"
sheetName = "Walz 23.12."
sheetComposer = "RY"
#(define book-staff-size 20)
\include "../include/book.ily"

strophe = \relative c' {
  \accidentalStyle modern
  \time 6/8
  \key e \minor
 % \set Timing.measurePosition = #(ly:make-moment -5/8)
  \partial 8
 % \mark \markup{ \box{\fontsize #2 A}}
  \override Fingering.font-size = #-3
  \set TabStaff.restrainOpenStrings = ##t
  \repeat volta 2 {
  \set TabStaff.minimumFret = #0
  b8
  e b g b fs' b,
  \set TabStaff.minimumFret = #3  
  g' e b e a e
  \set TabStaff.minimumFret = #7
  b' g e g c g
  b g e g b g
  \set TabStaff.minimumFret = #2
  fs ds a ds fs ds
  g ds a b\2 fs' ds
  } \alternative {
    { 
      \set TabStaff.minimumFret = #0 
      e b g b e b
      fs' ds a ds fs 
    }
    { 
      e b g b fs' b,
      e b g b e 
    }
  }
  \break
  b'
  \repeat volta 2 {
  \set TabStaff.minimumFret = #7
  c a e a b g
   \set TabStaff.minimumFret = #5
  a fs d fs a fs
  b g d g a fs
   \set TabStaff.minimumFret = #3
  g e c e g e
  a e c e g e
  \set TabStaff.minimumFret = #2
  fs ds b ds fs ds
  } \alternative {
   {g e b e a e
    \set TabStaff.minimumFret = #7 
    b' g e g b gs }
   { \set TabStaff.minimumFret = #0
     e b g b fs' b, 
    e b g b[ e,] }
  }
  \bar "|."
}

melodie  = \relative c {
  \clef "bass"
  \key e \minor
  b8 
  e2 fs4
  g2 a4
  b2 c4
  b2 b4
  fs2 fs4
  g2 fs4
  e2. 
  fs2 r8
  e2 fs4 
  e2 r8
  b'8
  c2 b4
  a2 a4
  b2 a4
  g2 g4
  a2 g4
  fs2 fs4
  g2 a4
  b2 b4
  e,2.
  e2 r8
}

chrdStrophe = \chordmode {
 
}

\bookpart {
  \paper {
    page-count = #1
    #(define fonts (book-font 1))
    ragged-last-bottom = ##f
  }
  \bookItem 
  \score {
    <<
    \new Staff { \melodie }
    \new ChordNames { \chrdStrophe }
    \new Staff { \clef "G_8" \strophe }
    \new TabStaff \with {
     % fontSize = #-1
     % \override StaffSymbol.staff-space = #(magstep -1)
    }{ \tabChordRepeats \strophe }  
    >>
    \layout {
      #(layout-set-staff-size-with-jazz 20) 
      \omit Voice.StringNumber 
    }
  }
}
